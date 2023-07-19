TehHP = {}
TehsTrailsVersion = "Beta v1"

Debug:Print("Pathing Version: v" .. PathingVersion)
Debug:Print("TehsTrails-HeroPoints Version: " .. TehsTrailsVersion)
Debug:Print("Map: " .. Mumble.CurrentMap.Id)

-- Do a version check
Pack:Require("Data/TehsTrails-HeroPoints/Scripts/versioncheck.lua")

-- If the version check is good, then we load everything else
if (TehHP_VersionCheck()) then
    -- Load storage first
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/storage.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/trailcolors.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/staticcategories.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/pagedmarker.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/bounce.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/highlight.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/mmtoggle.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/copy.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/alternatemounts.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/tutorial.lua")
    Pack:Require("Data/TehsTrails-HeroPoints/Scripts/tehmenu.lua")

    TehHP_ChangeColor(TehHP.storage.hpTrailColor)

    local function tickHandler(gameTime)

        if (TehHP.highlight.waypointHighlighted) then
            if (TehHP_ValidateHighlight()) then
                TehHP_HighlightTickHandler(gameTime)
            end
        end

        if (TehHP.bounce.isBouncing) then
            TehHP_BounceTickHandler(gameTime)
        end

        TehHP_CopyTickHandler()

    end

    Event:OnTick(tickHandler)
end


