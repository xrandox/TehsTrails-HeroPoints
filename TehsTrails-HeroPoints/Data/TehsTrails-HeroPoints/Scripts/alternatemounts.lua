-- Constants
local MOUNT_IDS = {
    ["beetle"] = 2213302,
    ["jackal"] = 2179789,
    ["raptor"] = 2179792,
    ["skimmer"] = 2179791,
    ["skyscale"] = 2141699,
    ["springer"] = 2179790,
    ["griffon"] = 1824207
}

local PARENT_CATEGORIES = { "tthp.hothpt.mm.", "tthp.pofhpt.mm.", "tthp.eodhp.mm." }
local PARENT_PATH = "Data/TehsTrails-HeroPoints/Markers/"
local PATH_END = ".png"

TehHP.alternatemounts = {
    isSwitched = false
}

Debug:Watch("TehHP_AlternateMounts", TehHP.alternatemounts)

-- Function to actually change the mount icons
local function switchMounts()
    for _, value in ipairs(PARENT_CATEGORIES) do
        for mountName, id in pairs(MOUNT_IDS) do
            local mountCategory = World:CategoryByType(value .. mountName)
            local mountMarkers = mountCategory:GetMarkers()
            if (mountMarkers ~= nil) then
                for _, marker in pairs(mountMarkers) do
                    if (TehHP.alternatemounts.isSwitched) then
                        marker:SetTexture(id)
                    else
                        marker:SetTexture(PARENT_PATH .. mountName .. PATH_END)
                    end
                end
            end
        end
    end
end

-- Global function to switch which mount art is used
function TehHP_AlternateMounts()
    TehHP_ToggleStorage("alternateMounts")
    TehHP.alternatemounts.isSwitched = TehHP_GetBool("alternateMounts")
    switchMounts()
end

-- Load initial value from storage
TehHP.alternatemounts.isSwitched = TehHP_GetBool("alternateMounts")

-- If it's switched, switch them
if (TehHP.alternatemounts.isSwitched) then
    switchMounts()
end