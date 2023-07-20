TehHP.toggleinfo = {
    toggledMarkers = {}
}

Debug:Watch("TehHP_ToggleInfo", TehHP.toggleinfo)

function TehHP_ToggleInfo(marker, isAutoTriggered)
    local markerInfo = TehHP.toggleinfo.toggledMarkers[marker.Guid]

    -- Add marker to table if not already there, and add the subtext
    if (markerInfo == nil) then
        TehHP.toggleinfo.toggledMarkers[marker.Guid] = { info = nil }
        markerInfo = TehHP.toggleinfo.toggledMarkers[marker.Guid]
        local newInfo = marker:GetBehavior("InfoModifier").InfoValue .. "\n\n(Pressing F will toggle this info off)"
        marker:GetBehavior("InfoModifier").InfoValue = newInfo
    end

    -- If they press F, check whether we have stored info or not
    if (isAutoTriggered == false) then
        if (markerInfo.info == nil) then -- if not, then we should store it then clear the info on the marker
            TehHP.toggleinfo.toggledMarkers[marker.Guid].info = marker:GetBehavior("InfoModifier").InfoValue
            marker:GetBehavior("InfoModifier").InfoValue = ""
        else -- if we do, then restore that info to the marker
            marker:GetBehavior("InfoModifier").InfoValue = markerInfo.info
            TehHP.toggleinfo.toggledMarkers[marker.Guid].info = nil
        end
    end
end

function TehHP_UnhideAllInfo()
    for key, value in pairs(TehHP.toggleinfo.toggledMarkers) do
        if (value.info ~= nil) then
            local marker = World:MarkerByGuid(key)
            marker:GetBehavior("InfoModifier").InfoValue = value.info
            TehHP.toggleinfo.toggledMarkers[key].info = ""
        end
    end
end