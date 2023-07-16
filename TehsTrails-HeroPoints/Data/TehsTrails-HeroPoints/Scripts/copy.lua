TehHP.copy = {
    categoriesToWatch = {
        ["tt"] = World:CategoryByType("tthp.credits.tt.link"),
        ["overflow"] = World:CategoryByType("tthp.credits.overflow.link"),
        ["bhud"] = World:CategoryByType("tthp.credits.bhud.link"),
        ["ign"] = World:CategoryByType("tthp.credits.mail.m.ign"),
        ["kofi"] = World:CategoryByType("tthp.credits.kofi.k.link"),
    },
    visibility = {
        ["tt"] = nil,
        ["overflow"] = nil,
        ["bhud"] = nil,
        ["ign"] = nil,
        ["kofi"] = nil
    }
}

Debug:Watch("TehHP_Copy", TehHP.copy)

-- Preload the visibility values to our internal table
local c = TehHP.copy.categoriesToWatch

TehHP.copy.visibility["tt"] = c["tt"]:IsVisible()
TehHP.copy.visibility["overflow"] = c["overflow"]:IsVisible()
TehHP.copy.visibility["bhud"] = c["bhud"]:IsVisible()
TehHP.copy.visibility["ign"] = c["ign"]:IsVisible()
TehHP.copy.visibility["kofi"] = c["kofi"]:IsVisible()


-- Copies the display name of the given category to the clipboard
function TehHP_Copy(category)
    User.SetClipboard(category.DisplayName)
end

-- Handles listening for visibility changes in the watched categories
function TehHP_CopyTickHandler()
    -- For each watched category
    for key, value in pairs(TehHP.copy.categoriesToWatch) do
        -- Get the current visibility
        local currentVis = value:IsVisible()
        -- If that doesn't match our saved visibility, then copy to clipboard and update the saved visibility
        if (currentVis ~= TehHP.copy.visibility[key]) then
            TehHP_Copy(value)
            TehHP.copy.visibility[key] = currentVis
        end
    end
end