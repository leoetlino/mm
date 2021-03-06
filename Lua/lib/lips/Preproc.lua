local abs = math.abs
local format = string.format
local insert = table.insert

local path = string.gsub(..., "[^.]+$", "")
local Base = require(path.."Base")
local Expression = require(path.."Expression")
local util = require(path.."util")

local signs = util.signs

local Preproc = Base:extend()
function Preproc:init(options)
    self.options = options or {}
end

function Preproc:error(msg, got)
    if got ~= nil then
        msg = msg..', got '..tostring(got)
    end
    error(format('%s:%d: Error: %s', self.fn, self.line, msg), 2)
end

function Preproc:iter(statements)
    assert(statements)
    local i = 0
    return function()
        i = i + 1
        local s = statements[i]
        if s == nil then return end
        self.i = i
        self.s = s
        self.fn = s.fn
        self.line = s.line
        return s
    end
end

function Preproc:lookup(t)
    if t.tt == 'VARSYM' then
        local name = t.tok
        t.tt = 'NUM'
        t.tok = self.variables[name]
        if t.tok == nil then
            self:error('undefined variable', name)
        end
    end
end

function Preproc:resolve(t)
    if t.tt == 'RELLABEL' then
        t.tt = 'LABEL'
        -- exploits the fact that user labels can't begin with a number
        local name = t.tok:sub(2)
        t.tok = tostring(self.i)..name
    elseif t.tt == 'RELLABELSYM' then
        local i = self.i
        t.tt = 'LABELSYM'

        local rel = signs(t.tok)
        assert(rel ~= 0, 'Internal Error: relative label without signs')

        local name = t.tok:sub(abs(rel) + 1)
        local seen = 0

        -- TODO: don't iterate over *every* label, just the ones nearby.
        -- we could do this by popping labels as we pass over them.
        -- (would need to iterate once forwards and once backwards
        --  for plus and minus labels respectively)
        if rel > 0 then
            for _, rl in ipairs(self.plus_labels) do
                if rl.name == name and rl.index > i then
                    seen = seen + 1
                    if seen == rel then
                        t.tok = tostring(rl.index)..name
                        break
                    end
                end
            end
        else
            for _, rl in ipairs(self.minus_labels) do
                if rl.name == name and rl.index < i then
                    seen = seen - 1
                    if seen == rel then
                        t.tok = tostring(rl.index)..name
                        break
                    end
                end
            end
        end

        if seen ~= rel then
            self:error('could not find appropriate relative label', t.tok)
        end
    end
end

function Preproc:check(s, i, tt)
    local t = s[i]
    if t == nil then
        local err = ("expected another argument for %s at position %i"):format(self.s.type, self.i)
        self:error(err)
    end

    if t.tt ~= tt then
        local err = ("argument %i of %s expected type %s"):format(i, s.type, tt)
        self:error(err, t.tt)
    end
    return t.tok
end

function Preproc:evaluate(t)
    if t.tt == 'EXPR' then
        local result, err = self.expr:eval(t.tok)
        if err then
            self:error('failed to evaulate ('..t.tok..')', err)
        end
        t.tt = 'NUM'
        t.tok = result
    end
    self:lookup(t)
end

function Preproc:process(statements)
    self.variables = {}
    self.plus_labels = {} -- constructed forwards
    self.minus_labels = {} -- constructed backwards
    self.expr = Expression(self.variables)

    -- first pass: resolve variables and collect relative labels
    local new_statements = {}
    for s in self:iter(statements) do
        for j, t in ipairs(s) do
            self:evaluate(t)
        end
        if s.type == '!VAR' then
            local a = self:check(s, 1, 'VAR')
            local b = self:check(s, 2, 'NUM')
            self.variables[a] = b
        elseif s.type == '!LABEL' then
            if s[1].tt == 'RELLABEL' then
                local label = s[1].tok
                local rl = {
                    index = #new_statements + 1,
                    name = label:sub(2)
                }
                local c = label:sub(1, 1)
                if c == '+' then
                    insert(self.plus_labels, rl)
                elseif c == '-' then
                    insert(self.minus_labels, 1, rl) -- remember, it's backwards
                else
                    error('Internal Error: unexpected token for relative label')
                end
            end
            insert(new_statements, s)
        else
            insert(new_statements, s)
        end
    end

    -- second pass: resolve relative labels
    for s in self:iter(new_statements) do
        for j, t in ipairs(s) do
            self:resolve(t)
        end
    end

    return new_statements
end

return Preproc
