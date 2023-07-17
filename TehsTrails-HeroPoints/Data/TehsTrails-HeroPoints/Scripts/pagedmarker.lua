local MARKER_CATALOG = {
    ["EoDStart"] = {
        info = {
            "This is the start of the Teh's Trails EoD Hero Point trail!\n\nWhile you don't have to follow this specific map order, the intended order is:\nNKC -> SP -> TEW -> DE",
            "For this trail you will need:\n - All mounts and their masteries\n(Skyscale, Griffon, Beetle especially)\n - Prototype Position Rewinder\n - 10 Ash Legion Spy Kits (Optional)\n - A decent open-world build",
            "The vast majority of EoD HP's are fairly easy to complete solo\n\nI highly recommend bringing some form of stealth to stealth-commune HP's (Or ALSKs)\n\nOtherwise, just find a good open world build for the specializations you have available and you should be okay soloing most HP's",
        },
        maxPages = 3,
        initialized = false
    },
    ["PoFStart"] = {
        info = {
            "This is the start of the Teh's Trails PoF Hero Point trail!\n\nWhile you don't have to follow this specific map order, the intended order is:\nCO -> DS -> ER -> TD",
            "Vabbi is left out because the other four alone provide 260 HPs which is 10 more than needed for one whole elite spec and Vabbit itself only has 3 very spread out HP's\n\nIf you want to, you can probably get them on your own pretty quickly",
            "For this trail you will need:\n - All mounts and their masteries\n(Skyscale, Griffon, Beetle especially)\n - Prototype Position Rewinder\n - Jade Waypoint\n - 7 Ash Legion Spy Kits (Optional)\n - A decent open-world build",
            "The vast majority of PoF HP's are fairly easy to complete solo\n\nI highly recommend bringing some form of stealth (Or ALSK's) to stealth-commune HP's\n\nOtherwise, just find a good open world build for the specializations you have available and you should be okay soloing most HP's",
        },
        maxPages = 4,
        initialized = false
    }
}

TehHP.pagedmarker = {
    pageTracker = {}
}

Debug:Watch("TehHP_PagedMarkers", TehHP.pagedmarker)

function TehHP_PagedMarker(marker, isAutoTriggered, catalogName)
    local catalog = MARKER_CATALOG[catalogName]
    if (catalog.initialized == false) then
        TehHP.pagedmarker.pageTracker[catalogName] = 1
        marker:GetBehavior("InfoModifier").InfoValue = catalog.info[1] .. "\n\n(Press F to flip to the next page)"
        MARKER_CATALOG[catalogName].initialized = true
    end

    if (isAutoTriggered == false) then
        local markerPage = TehHP.pagedmarker.pageTracker[catalogName]

        -- increment page
        markerPage = markerPage + 1
        if (markerPage > catalog.maxPages) then markerPage = 1 end

        -- get new info
        local info = catalog.info[markerPage]

        if (markerPage == catalog.maxPages) then
            info = info .. "\n\n(Press F to return to the first page)"
        else
            info = info .. "\n\n(Press F to flip to next page)"
        end

        -- set it
        marker:GetBehavior("InfoModifier").InfoValue = info
        TehHP.pagedmarker.pageTracker[catalogName] = markerPage
    end
end