local basics = require "addrs.basics"
local versions = require "addrs.versions"

local same = {
    ["O JP10"] = "O US10",
    ["O JP11"] = "O US11",
    ["O JP12"] = "O US12",
    --["O JPGC MQ"] = "O USGC", -- maybe?
}

return function(hash)
    local version = versions[hash] or VERSION_OVERRIDE
    if version == nil then
        print('ERROR: unknown rom')
        return
    end
    local v = version:sub(1, 2)
    local rv = same[version] or version

    local b = basics[rv]
    function AL(a, s) return A(b.link + a, s) end
    function AG(a, s)
        if rv == 'M JP10' or rv == 'M JP11' then
            if a >= 0x17000 then -- approximate
                a = a - 0x20
            end
        end
        return A(b.global + a, s)
    end
    function AA(a, s) return A(b.actor + a, s) end

    local subdir = version:sub(1, 1)
    local rvs = rv:sub(3)

    local addrs = require("addrs."..subdir.."."..rvs)
    addrs.version = version
    addrs.oot = v == "O "
    addrs.mm  = v == "M "
    local common = require("addrs."..subdir..".common")
    return setmetatable(addrs, {__index=common})
end