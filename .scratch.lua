local function table_print(tt, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tt) == "table" then
        for key, value in pairs(tt) do
            io.write(string.rep(" ", indent)) -- indent it
            if type(value) == "table" and not done[value] then
                done[value] = true
                io.write(string.format("[%s] => table\n", tostring(key)))
                io.write(string.rep(" ", indent + 4)) -- indent it
                io.write("(\n")
                table_print(value, indent + 7, done)
                io.write(string.rep(" ", indent + 4)) -- indent it
                io.write(")\n")
            else
                io.write(string.format("[%s] => %s\n", tostring(key), tostring(value)))
            end
        end
    else
        io.write(tt .. "\n")
    end
end

local function GroupBy(tableToGroup, keyFunction)
    assert(tableToGroup and type(tableToGroup) == "table", "Table to group must be not be nil and of type table")
    assert(keyFunction and type(keyFunction) == "function", "key function must not be null and of type function")
    local ret = {}
    local index = 1
    local function GetEntryForGroupKey(tableToSearch, key)
        for i, v in ipairs(tableToSearch) do
            if key == v.key then
                return v
            end
        end
        return nil
    end
    for k, v in pairs(tableToGroup) do
        local key = keyFunction(v)
        -- print(string.format("Key: %s -> value: %s", k, v))

        local existingGroup = GetEntryForGroupKey(ret, key)
        if existingGroup == nil then
            -- print("Creating new table for key " .. k)
            existingGroup = { key = key, values = {} }
            table.insert(ret, existingGroup)
        end
        table.insert(existingGroup.values, v)
    end
    return ret
end

local test = { 15, 15, 23, 23, 56, 558, 5559 }

local grouped = GroupBy(test, function(key)
    return key
end)

table_print(grouped)
