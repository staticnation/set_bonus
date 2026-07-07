local config = {
    sets = {},
    setLinks = {},   -- itemId(lower)   -> { [setName] = true }
    iconLinks = {},  -- "iconPath|meshPath"(lower) -> { [setName] = true }  (matches enchanted/copied items)
    setsArray = {}
}
return config
