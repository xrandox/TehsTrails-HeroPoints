local MARKER_CATALOG = {
    ["HoTStart"] = {
        info = {
            "This is the start of the Teh's Trails HoT Hero Point trail!\n\nWhile you don't have to follow this specific map order, the intended order is:\nVB -> AB -> TD",
            "DS is left out because it's pesky to work around the meta and you can get enough HP's for an elite spec from just VB/AB/TD",
            "For this trail you will need:\n • All mounts and their masteries\n(Skyscale, Griffon, Beetle especially)\n • Nuhoch Wallows Mastery\n • Jade Waypoint (Don't Forget Your Jade Bot Core!)\n • Prototype Position Rewinder\n • ~4 Ash Legion Spy Kits (Optional)\n • A very good solo build",
            "HoT Hero Points are extremely challenging compared to the other two expansions\n\nEach combat HP will be given a difficulty and have a marker giving tips on how to beat it. The difficulty will range from:\n • AFK - Can basically be killed AFK\n • Easy - The majority of people on a good build will be able to solo it\n • Medium - Starting to get difficult. Need to know your way around your build to solo these\n • Hard - Some builds may be outright incapable of soloing these, and even the best builds will be challenged by them\n • Very Hard - Good luck!\n\n\nRemember, all of these ratings are based on SOLOING. If you throw extra people in the mix, everything changes",
            "The builds that are the best for doing these solo tend to have the following:\n • Decently-sized health pool (15k+, to prevent one-shots)\n • Good sustain (regen, leech, etc)\n • Good condi cleanse\n • Good boon application (might and prot/reso are especially good)\n • Access to a decent ranged weapon (1500 ideally)\n • Have distractions (Pets, Minions, Golem, Clones, Etc)\n • Decent CC skills\n • And lastly, decent damage",
            "As you can see, that is a pretty extensive list of things that typically one single build doesn't have, which is what makes soloing these HP so difficult\n\nIf you can add other people into the mix, then you not only increase the total health pool and damage, but you also can split up responsibilities like CC, healing/condi clease, boons, etc.\n\nEven just one more person makes most of the HP's doable, so try and find a guildie or two you can drag with you, or ask in map chat for help at the hard ones"
        },
        maxPages = 6,
        initialized = false
    },
    ["EoDStart"] = {
        info = {
            "This is the start of the Teh's Trails EoD Hero Point trail!\n\nWhile you don't have to follow this specific map order, the intended order is:\nNKC -> SP -> TEW -> DE",
            "For this trail you will need:\n • All mounts and their masteries\n(Skyscale, Griffon, Beetle especially)\n • Equipped Jade Bot Core\n • Prototype Position Rewinder\n • 10 Ash Legion Spy Kits (Optional)\n • A decent open-world build",
            "The vast majority of EoD HP's are fairly easy to complete solo\n\nI highly recommend bringing some form of stealth to stealth-commune HP's (Or ALSKs)\n\nOtherwise, just find a good open world build for the specializations you have available and you should be okay soloing most HP's",
        },
        maxPages = 3,
        initialized = false
    },
    ["PoFStart"] = {
        info = {
            "This is the start of the Teh's Trails PoF Hero Point trail!\n\nWhile you don't have to follow this specific map order, the intended order is:\nCO -> DS -> ER -> TD",
            "Vabbi is left out because the other four alone provide 260 HPs which is 10 more than needed for one whole elite spec and Vabbit itself only has 3 very spread out HP's\n\nIf you want to, you can probably get them on your own pretty quickly",
            "For this trail you will need:\n • All mounts and their masteries\n(Skyscale, Griffon, Beetle especially)\n • Prototype Position Rewinder\n • Jade Waypoint (Don't Forget Your Jade Bot Core!)\n • 7 Ash Legion Spy Kits (Optional)\n • A decent open-world build",
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