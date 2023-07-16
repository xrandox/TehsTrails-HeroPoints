local mainTrail = World:TrailByGuid("cb6VPxgSL0yytSwws/y+Vg==")

function TehHP_SetMinimapVisibility()
    if (mainTrail == nil) then
        Debug:Warn("Could not find reference to Main Trail on the current map: " .. Mumble.CurrentMap.Id)
        return
    end
    mainTrail.MiniMapVisibility = TehHP_GetBool("minimapToggled")
end

-- Check toggles on start up
TehHP_SetMinimapVisibility()