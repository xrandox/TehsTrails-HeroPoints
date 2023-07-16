TehHP.highlight = {
    currentWaypoint = nil,
    currentTeleport = nil,
    waypointHighlighted = false,
    currentSize = 100,
    sizeGrowing = true,
    timeSinceStarted = 0,
    secondaryTarget = nil,
    optionalWaypoint = nil,
}

Debug:Watch("TehHP_Highlight", TehHP.highlight)
local MAX_SIZE = 200
local MIN_SIZE = 100

-- Resets the highlight
function TehHP_HighlightReset()
    local waypoint = TehHP.highlight.currentWaypoint
    waypoint.MapVisibility = false
    waypoint.MiniMapVisibility = false
    waypoint.TriggerRange = 0
    if (TehHP.highlight.optionalWaypoint ~= nil) then
        TehHP.highlight.optionalWaypoint.MapVisibility = false
        TehHP.highlight.optionalWaypoint.MiniMapVisibility = false
        TehHP.highlight.optionalWaypoint.TriggerRange = 0
    end
    TehHP.highlight.currentTeleport.TriggerRange = 15
    TehHP.highlight.currentWaypoint = nil
    TehHP.highlight.currentTeleport = nil
    TehHP.highlight.waypointHighlighted = false
    TehHP.highlight.currentSize = 100
    TehHP.highlight.sizeGrowing = true
    TehHP.highlight.timeSinceStarted = 0
    TehHP.highlight.secondaryTarget = nil
    TehHP.highlight.optionalWaypoint = nil
end

--Sets the given marker GUID as the current waypoint and highlights it
function TehHP_HighlightWaypoint(marker, isfocused, markerguid)
    if (not TehHP_GetBool("highlightToggled")) then return end
    local waypoint = World:MarkerByGuid(markerguid)

    if (isfocused) then
        if (TehHP.highlight.waypointHighlighted) then
            TehHP_HighlightReset()
        end

        -- If optional waypoint, we have to show that one too
        if (TehHP.highlight.optionalWaypoint ~= nil) then
            TehHP.highlight.optionalWaypoint:SetTexture("Data/TehsTrails-HeroPoints/Markers/waypoint-highlight2.png")
            TehHP.highlight.optionalWaypoint.MapVisibility = true
            TehHP.highlight.optionalWaypoint.MiniMapVisibility = true
            TehHP.highlight.optionalWaypoint.TriggerRange = 15
        end

        waypoint:SetTexture("Data/TehsTrails-HeroPoints/Markers/waypoint-highlight.png")
        waypoint.MapVisibility = true
        waypoint.MiniMapVisibility = true
        waypoint.TriggerRange = 15
        TehHP.highlight.currentTeleport = marker
        TehHP.highlight.currentWaypoint = waypoint
        TehHP.highlight.waypointHighlighted = true
        marker.TriggerRange = 0
    end
end

-- Highlights the given marker guid, but also sets a secondary target that will clear the waypoint when focused
function TehHP_HighlightWaypoint2(marker, isfocused, markerguid, secondaryTarget)
    TehHP.highlight.secondaryTarget = World:MarkerByGuid(secondaryTarget)
    TehHP_HighlightWaypoint(marker, isfocused, markerguid)
end

-- Highlights the given marker guid, but also highlights a second waypoint in blue, reaching either will clear it
function TehHP_HighlightWaypoint3(marker, isfocused, markerguid, optionalWaypoint)
    TehHP.highlight.optionalWaypoint = World:MarkerByGuid(optionalWaypoint)
    TehHP.highlight.secondaryTarget = TehHP.highlight.optionalWaypoint
    TehHP_HighlightWaypoint(marker, isfocused, markerguid)
end

-- Animates the highlight on the map
function TehHP_HighlightTickHandler(gameTime)
    if (not TehHP_GetBool("highlightToggled")) then
        TehHP_HighlightReset()
        return
    end
    local elapsedSeconds = gameTime.ElapsedGameTime.TotalSeconds
    TehHP.highlight.timeSinceStarted = TehHP.highlight.timeSinceStarted + elapsedSeconds
    if (TehHP.highlight.timeSinceStarted > 300) then
        TehHP_HighlightReset()
        return
    end

    local size = TehHP.highlight.currentSize
    local growing = TehHP.highlight.sizeGrowing
    local INTERVAL = 180 * elapsedSeconds

    if (growing) then
        size = size + INTERVAL;
    else
        size = size - INTERVAL;
    end
    TehHP.highlight.currentSize = size

    if (size > MAX_SIZE) then growing = false end
    if (size < MIN_SIZE) then growing = true end
    TehHP.highlight.sizeGrowing = growing

    TehHP.highlight.currentWaypoint.MapDisplaySize = size
    -- If optional waypoint, we have to grow/shrink that too
    if (TehHP.highlight.optionalWaypoint ~= nil) then
        TehHP.highlight.optionalWaypoint.MapDisplaySize = size
    end
end

--Checks if highlighted waypoing is focused, if it is, stop highlighting it.
--Returns true if the waypoint is still highlighted
function TehHP_ValidateHighlight()
    local waypoint = TehHP.highlight.currentWaypoint
    local secondaryTarget = TehHP.highlight.secondaryTarget
    if (waypoint.Focused) then
        TehHP_HighlightReset()
        return false
    end
    if (secondaryTarget ~= nil and secondaryTarget.Focused) then
        TehHP_HighlightReset()
        return false
    end
    return true
end
