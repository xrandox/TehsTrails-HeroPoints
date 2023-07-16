-- Click Functions
local function toggleTutorial(menu)
    TehHP_ToggleTutorial()
end

local function newColor(menu)
    -- clear any other checked boxes
    for index, value in ipairs(TehHP.trailcolors.colors) do
        if (value[1] ~= menu.Name) then
            value[3].Checked = false
        else
            value[3].Checked = true
        end
    end

    -- change the color
    TehHP_ChangeColor(menu.Name)
end

local function minimapTrails(menu)
    TehHP_ToggleStorage("minimapToggled")
    menu.Checked = TehHP_GetBool("minimapToggled")
    TehHP_SetMinimapVisibility()
end

local function waypointHighlight(menu)
    TehHP_ToggleStorage("highlightToggled")
    menu.Checked = TehHP_GetBool("highlightToggled")
end

local function routeMarkerHighlight(menu)
    TehHP_ToggleStorage("bounceToggled")
    menu.Checked = TehHP_GetBool("bounceToggled")
end

local function resetClicked(menu)
    if (TehHP.bounce.isBouncing) then TehHP_BounceReset() end
    if (TehHP.highlight.waypointHighlighted) then TehHP_HighlightReset() end
end

-- Creating Menu
local mainMenu = Menu:Add("Tehs Trails - Hero Points", nil)

local stut = mainMenu:Add("Show/Hide Tutorial", toggleTutorial, false, false, "Shows/Hides the pack tutorial. Make sure you're in a flat, open space!")

-- Color menu
local colorMenu = mainMenu:Add("Select Trail Color", nil, false, false, "Changes the color of the main trail")

for i, value in ipairs(TehHP.trailcolors.colors) do
    local name = value[1]
    local checked = false
    if (name == TehHP.storage.hpTrailColor) then
        checked = true
    end
    TehHP.trailcolors.colors[i][3] = colorMenu:Add(name, newColor, true, checked)
end

-- Map menu
local mapOptionMenu = mainMenu:Add("Map Visibility Options", nil, false, false, "Requires Default for Show Trails on Map in Pathing Settings to work properly")
mapOptionMenu:Add("Show Main Trail on Minimap", minimapTrails, true, TehHP_GetBool("minimapToggled"), "Draw the main trail on the minimap")

-- Other options
local ewh = mainMenu:Add("Enable Waypoint Highlights", waypointHighlight, true, TehHP_GetBool("highlightToggled"), "Adds a highlight around the waypoint you are supposed to teleport to. Highly recommended to leave this on")
local rmh = mainMenu:Add("Enable Route Marker Highlights", routeMarkerHighlight, true, TehHP_GetBool("bounceToggled"), "Adds a highlight and bounce effect to the route marker you are supposed to follow")

-- Script reset
local ras = mainMenu:Add("  [  RESET ALL SCRIPTS  ]  ", resetClicked, false, false, "Resets all currently running scripts in case there is a malfunction")