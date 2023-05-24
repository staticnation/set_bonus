-- config.lua: This module is a configuration data container for the Set Bonus mod.
-- This configuration file contains three tables:
-- `sets`: This table stores registered set data, where each key is a set name and its value is the corresponding set data.
-- `setLinks`: This is a lookup table used to quickly find the set data associated with a specific item ID. In this table, item IDs are keys and the corresponding set data are values.
-- `setsArray`: This table is an empty array initially which can be used for storing or organizing additional data related to the sets.

local config = {
    sets = {},
    setLinks = {},
    setsArray = {}
}

return config