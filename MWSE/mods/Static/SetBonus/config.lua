-- config.lua: Configuration data for the Set Bonus mod. 
-- It provides two tables:
-- `sets`: where registered sets' data is stored, with set names as keys and the corresponding set data as values.
-- `setLinks`: a lookup table where item IDs are used as keys and the corresponding set data as values.

local config = {
    sets = {},
    setLinks = {}
}

return config