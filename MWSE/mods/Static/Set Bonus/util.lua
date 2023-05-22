local util = {}

function util.mergeTables(table1, table2)
    for k, v in pairs(table2) do
        if type(v) == "table" then
            if type(table1[k] or false) == "table" then
                util.mergeTables(table1[k] or {}, table2[k] or {})
            else
                table1[k] = v
            end
        else
            table1[k] = v
        end
    end
    return table1
end

return util
