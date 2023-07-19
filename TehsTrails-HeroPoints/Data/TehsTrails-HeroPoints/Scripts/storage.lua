TehHP.storage = {
    --These are the default values
    minimapToggled = "false",
    globalMarkersToggled = "false",
    bounceToggled = "true",
    highlightToggled = "true",
    hpTrailColor = "Light Blue [Default]",
    firstLaunch = "true",
    alternateMounts = "false"
}

Debug:Watch("TehHP_Storage", TehHP.storage)

-- Load defaults on startup
for key, _ in pairs(TehHP.storage) do
    local storedValue = Storage:ReadValue("tehstrails-heropoints", key)
    if (storedValue ~= nil) then
        TehHP.storage[key] = storedValue
    end
end

-- Saves the the value into storage
function TehHP_SaveValue(key, value)
    Storage:UpsertValue("tehstrails-heropoints", key, tostring(value))
    TehHP.storage[key] = value
end

-- Returns the boolean value of the stored keys string value
function TehHP_GetBool(key)
    if (TehHP.storage[key] == "true") then return true
    else return false end
end

-- Toggles the boolean value of the given setting
function TehHP_ToggleStorage(key)
    if (TehHP_GetBool(key)) then
        TehHP_SaveValue(key, "false")
    else
        TehHP_SaveValue(key, "true")
    end
end