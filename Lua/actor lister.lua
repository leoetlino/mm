require = require "depend"
require "boilerplate"
require "addrs.init"
require "messages"
require "classes"

local suffix = oot and " oot" or ""
local damage_names = require("data.damage names"..suffix)

-- check for errors in the actor linked lists
local validate = false

-- for figuring out actor variables
local debug_mode = true

local debug_watch = mm and {
    {'room_number', '%02X'},
    --{'x_rot_init', '%04X'},
    --{'y_rot_init', '%04X'},
    --{'z_rot_init', '%04X'},
    --{'unk_1A', '%02X'},
    {'unk_1E', '%02X'},
    {'unk_20', '%08X'},
    {'unk_22', '%04X'},
    --{'unnamed_x_rot', '%04X'},
    --{'unnamed_y_rot', '%04X'},
    --{'unnamed_z_rot', '%04X'},
    {'unk_36', '%04X'},
    {'unk_38', '%02X'},
    {'x', '%9.3f'},
    {'y', '%9.3f'},
    {'z', '%9.3f'},
    {'lin_vel_old', '%9.3f'},
    {'unk_54', '%9.3f'},
    {'unk_74', '%9.3f'},
    {'unk_78', '%9.3f'},
} or {}

-- creating an object every time is a bit slow, so
-- using a template to offset from will do for now.
local actor_t = Actor(0)

function sort_by_key(t)
    local sorted = {}
    local i = 1
    for k, v in pairs(t) do
        sorted[i] = {k=k, v=v}
        i = i + 1
    end
    table.sort(sorted, function(a, b) return a.k < b.k end)
    return sorted
end

function get_actor_count(i)
    return R4(addrs.actor_counts[i].addr)
end

function get_first_actor(i)
    return deref(R4(addrs.actor_firsts[i].addr))
end

function get_next_actor(addr)
    return deref(R4(addr + actor_t.next.addr))
end

function get_prev_actor(addr)
    return deref(R4(addr + actor_t.prev.addr))
end

function count_actors()
    local counts = {}
    for i = 0, 11 do
        counts[i] = get_actor_count(i)
    end
    return counts
end

function iter_actors(counts)
    local at, ai = 0, 0
    local addr

    local y = 1
    local complain = function(s)
        s = s..(" (%2i:%3i)"):format(at, ai)
        T_TR(0, y, "yellow", s)
        y = y + 1
    end

    local iterate
    iterate = function()
        if ai == 0 then
            addr = get_first_actor(at)
            if validate and addr and get_prev_actor(addr) then
                complain("item before first")
            end
        else
            local prev = addr
            addr = get_next_actor(addr)
            if validate then
                if addr and prev ~= get_prev_actor(addr) then
                    complain("previous mismatch")
                end
            end
        end

        if not addr then
            if validate then
                if ai < counts[at] then
                    -- known case: romani ranch on first/third night
                    complain("list ended early")
                elseif ai > counts[at] then
                    complain("list ended late")
                end
            end

            ai = 0
            at = at + 1
            if at == 12 then return nil end
            return iterate()
        else
            local temp = ai
            ai = ai + 1
            return at, temp, addr
        end
    end

    return iterate
end

function longbinary(x)
    return ('%032s'):format(bizstring.binary(x))
end

function focus(actor, dump)
    local color = actor.name:sub(1,1) == "?" and "red" or "orange"
    local flags = longbinary(actor.flags)
    local y = debug_mode and #debug_watch + 9 or 9
    local write = function(color, fmt, ...)
        T_BL(0, y, color, fmt, ...)
        y = y - 1
        return y + 1
    end

    write(nil,    'Hi: %s', flags:sub(1,16))
    write(nil,    'Lo: %s', flags:sub(17,32))
    write(color, actor.name)
    write(nil,    'HP:  %02X', actor.hp)
    write('cyan', 'No.: %03X', actor.num)
    write(nil,    'Var: %04X', actor.var)
    write(nil,    '80%06X', actor.addr)
    write(nil, 'type:  %3i', actor.at)
    write(nil, 'index: %3i', actor.ai)
    write(nil, 'count: %3i', actor.type_count)

    if debug_mode then
        local a = Actor(actor.addr)

        for i, t in ipairs(debug_watch) do
            write(nil, '%12s: '..t[2], t[1], a[t[1]]())
        end

        if dump then
            a.unk_38(math.random(0, 0xFF))
            --print(R1(actor.addr + 0x1E))
            --W1(actor.addr + actor_t.unk_1E.addr, 0xFF)
        end
        --a.x_old(a.x())
        --a.y_old(a.y())
        --a.z_old(a.z())

        return -- skip damage table crap
    end

    local dmg = deref(R4(actor.addr + actor_t.damage_table.addr))
    if dmg then
        for i = 0, 31 do
            local name = damage_names[i]
            local str = ('%9s: %02X'):format(name, R1(dmg + i))

            if i >= 16 then
                T_TR(0, i - 16, nil, str)
            else
                T_TL(0, i, nil, str)
            end
        end
    end

    if dump then
        console.clear()
        s = ("%04X\t%02X\t%02X"):format(actor.num, actor.at, actor.hp)
        if dmg then
            for i = 0, 31 do
                s = s..("\t%02X"):format(R1(dmg + i))
            end
        end
        print(s)
    end
end

function collect_actors()
    local game_counts = count_actors()
    local any = 0
    for i = 0, 11 do
        any = any + game_counts[i]
        --FIXME: T_BR(0, 13 - i, nil, "#%2i: %2i", i, game_counts[i])
    end
    --FIXME: T_BR(0, 1, nil, "sum:%3i", any)

    local actors_by_type = {[0]={},{},{},{},{},{},{},{},{},{},{},{}} -- 12
    local new_counts = {[0]=0,0,0,0,0,0,0,0,0,0,0,0} -- 12
    if any > 0 then
        any = 0
        for at, ai, addr in iter_actors(game_counts) do
            actors_by_type[at][ai] = addr
            new_counts[at] = new_counts[at] + 1
            any = any + 1
        end
    end
    return any > 0, actors_by_type, new_counts
end

local input_handler = InputHandler{
    enter = "P1 L",
    up    = "P1 DPad U",
    down  = "P1 DPad D",
    left  = "P1 DPad L",
    right = "P1 DPad R",
}

local al = ActorLister(input_handler, debug_mode)
event.onexit(function() al = nil end, 'actor cleanup')
event.onloadstate(function() if al then al:wipe() end end, 'actor wipe')
while oot or mm do
    local now = emu.framecount()
    al:runwrap(now)
    print_deferred()
    emu.frameadvance()
end
