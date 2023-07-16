-- Constants
local MARKERS_IN_CIRCLE = 7
local MARKER_DISTANCE_FROM_PLAYER = 10
local INFO_RANGE = 4
local MARKER_CATEGORY = "tthp"
local MARKER_CATALOG = {
    {
        info = {
            "This marker shows the start of the trail on the current map\n\n(Press F to flip to next page)",
            "This red marker shows the way to the next map\n\n(Press F to flip to return to the first page)",
        },
        iconFile = { "Data/TehsTrails-HeroPoints/Markers/Start.png", "Data/TehsTrails-HeroPoints/Markers/ExitMap.png" },
        iconSize = { 1, 1 },
        copy = { "", "" },
        copyMessage = "",
        maxPages = 2
    },
    {
        info = {
            "Scripts can be tweaked via the Pathing 'Scripts' menu\n\nTo access the menu, left-click the Pathing icon and hover over Scripts -> Tehs Trails - Hero Points\n\nThere you can change the settings to however you like\n\n(Press F to flip to next page)",
            "Please note that these script settings are unique to this pack and will have no affect on any other packs you have installed\n\nIf anything ever messes up, you can also reset all scripts in the script menu\n\n(Press F to return to the first page)"
        },
        iconFile = { "Data/TehsTrails-HeroPoints/Markers/scripts.png", "Data/TehsTrails-HeroPoints/Markers/scripts.png" },
        iconSize = { 1, 1 },
        copy = { "", "" },
        copyMessage = "",
        maxPages = 2
    },
    {
        info = {
            "Skyscale is used frequently to gain height for griffon dives\n\nThere's no real trick behind this since Anet made the change to allow midair dismounting\n\nSpamming dodges with your camera angled up while also holding spacebar to climb can be used to gain slightly higher altitude quicker than you could by just flying up, that's about it\n\n(Press F to flip to the next page)",
            "This marker signifies when you should dismount from Skyscale and swap to griffon\n\nThis allows you to superdive where you might not otherwise have the clearance\n\n(Press F to flip to the next page)",
            "You can also make use of Glide Booster (Jade Bot required) to gain even more height if needed\n\nWe recommend using Glide Booster and Mount Energy upgrades for your jade bot if possible. They make a big difference!\n\n(Press F to flip to the next page)",
            "Finally, you may sometimes see this marker in places with lots of enemies where you don't want to be put in combat. It just means to use the Stealth mount mastery\n\n(Press F to return to the first page)"
        },
        iconFile = { "Data/TehsTrails-HeroPoints/Markers/skyscale.png", "Data/TehsTrails-HeroPoints/Markers/DismountToGriff.png", "Data/TehsTrails-HeroPoints/Markers/glidebooster.png", "Data/TehsTrails-HeroPoints/Markers/StealthMount.png" },
        iconSize = { 1.2, 1.5, 0.6, 0.6 },
        copy = { "", "", "", "" },
        copyMessage = "",
        maxPages = 4
    },
    {
        info = {
            "From easiest to hardest to solo:\n - Path of Fire (Easiest)\n - End of Dragons\n - Heart of Thorns (Hardest)\n\n\n(Press F to flip to the next page)",
            "PoF is the easiest due to most combat HP's being veterans unless scaled by a lot of people\n\nPretty much any level of player with a decent build should be able to manage these solo\n\n(Press F to flip to the next page)",
            "EoD is kind of mid-tier difficulty. The combat HP's are all elites, so they are technically a bit more challenging than PoF, but a lot of them can be stealth-communed\n\nBecause of this, if your class has access to stealth (or you have ALSK's), EoD can actually be easier than PoF\n\n(Press F to flip to the next page)",
            "HoT is significantly harder than either of the other two expansions\n\nCombat HP's are extremely challenging, there's not many free communes, and even some of the normal mobs can be dangerous to newer players or squishy builds\n\nI really recommend trying to get a few guildies or friends to tag along\n\nIf you've got your mind set on solo-ing, pay attention to the HP notes and pick your fights carefully\n\n(Press F to flip back to the first page)"
        },
        iconFile = { "Data/TehsTrails-HeroPoints/Markers/expacs.png", "Data/TehsTrails-HeroPoints/Markers/pof.png", "Data/TehsTrails-HeroPoints/Markers/eod.png", "Data/TehsTrails-HeroPoints/Markers/hot.png"},
        iconSize = { 2, 1, 1, 1 },
        copy = { "", "", "", "" },
        copyMessage = "",
        maxPages = 4
    },
    {
        info = {
            "This marker is used to show when you can stealth-commune a hero point (although it will probably be obvious to most of you)\n\nStealth-communing is just stacking enough stealth on yourself so that you can fully commune with an HP before the mob guarding it attacks you and breaks the channel\n\n(Press F to flip to the next page)",
            "Obviously, this requires access to stealth in some way or another\n\nA full commune takes 6 seconds, and you have a grace of about a second or 2 when you unstealth before the mob guarding it will actually hit you, meaning you need ~4-6s of stealth depending on how quick you are\n\n(Press F to flip to the next page)",
            "There are a few specializations who have access to easy stealth in their kit:\n- Thief has Shadow Refuge\n- Engie has Elixir S w/ HGH trait\n (Scrapper also has Sneak Gyro)\n- Mesmer has Mass Invisibility",
            "For other specs, or if you don't want to change your build to use those skills, we have Ash Legion Spy Kits\n\nALSK's are consumable items which give you a camouflage skill, granting 10s of stealth while stationary, so you simply go next to the commune, pop the kit, and channel without moving\n\nYou can buy these from Krya Sharptracker, a heart-vendor in Plains of Ashford, for 28 karma each\n\nThe POI she is near will be copied to your clipboard, if you want to go buy some\n\n(Press F to copy POI to clipboard and flip back to first page)"
        },
        iconFile = { "Data/TehsTrails-HeroPoints/Markers/stealth.png", "Data/TehsTrails-HeroPoints/Markers/stealth.png", "Data/TehsTrails-HeroPoints/Markers/stealthskills.png", "Data/TehsTrails-HeroPoints/Markers/spykit.png"},
        iconSize = { 1, 1, 1, 0.6},
        copy = { "", "", "", "[&BFkBAAA=]" },
        copyMessage = "[&BFkBAAA=] copied to clipboard",
        maxPages = 4
    },
    {
        info = {
            "If you have any questions that this tutorial did not answer, or you just want to join our community, feel free to join us on the Teh's Trails discord!\n\n(Press F to copy the discord link to your clipboard)"
        },
        iconFile = {"Data/TehsTrails-HeroPoints/Markers/discord.png"},
        iconSize = { 0.9 },
        copy = { "https://discord.gg/bJV6VXT" },
        copyMessage = "Discord link copied to clipboard",
        maxPages = 1
    },
    {
        info = {
            "Welcome to Teh's Trails - Hero Points!\n\nThe markers around you are part of a tutorial to help you understand how to use the pack\n\nEach marker in the circle has different info attached to it, which you can read by walking up to the marker. Pressing F will advance the 'page'.\n\n(Press F to flip to the next page)",
            "As a disclaimer: This pack is specifically tailored to FAST, SOLO or SMALL-GROUP hero point farming\n\nIt's a bit more on the 'try-hard' side and not intended for your first time doing hero points\n\nIf you try to lead a large squad through these routes, chances are it will go horribly and half of them will crash or get lost\n\n(Press F to flip to the next page)",
            "To run this pack you will need:\n - All mounts + mount masteries\n(especially Skyscale, Griffon and Beetle)\n - Prototype Position Rewinder\n - Jade Waypoint\n - Ash Legion Spy Kits (Optional)\nYou can attempt to follow the trails without these, but you may struggle at times and it will take considerably longer\n\n(Press F to flip to the next page)",
            "Feel free to move around to the other markers to read up on more tutorial info!\n\nIf you ever want to reread the tutorial, or if a tutorial marker spawned somewhere inaccessible, you can always reopen the tutorial from the Script Menu\n\nScripts -> Tehs Trails -> Show/Hide Tutorial\n\n(Press F to flip back to the first page)"
        },
        iconFile = {"Data/TehsTrails-HeroPoints/Markers/Trail.png", "Data/TehsTrails-HeroPoints/Markers/Trail.png", "Data/TehsTrails-HeroPoints/Markers/Trail.png", "Data/TehsTrails-HeroPoints/Markers/Trail.png" },
        iconSize = { 0.6, 0.6, 0.6, 0.6 },
        copy = { "", "", "", "" },
        copyMessage = "",
        maxPages = 4
    },
}

TehHP.tutorial = {
    origin = nil,
    markerOffsets = {},
    pageTracker = { 1, 1, 1, 1, 1, 1, 1 },
    markers = {},
    shown = false
}

Debug:Watch("TehHP_Tutorial", TehHP.tutorial)

local function showTutorial()
    -- First we make the outer markers
    -- get angle between each marker
    local angle = 2 * math.pi / (MARKERS_IN_CIRCLE - 1)
    -- get player position as the origin
    TehHP.tutorial.origin = Mumble.PlayerCharacter.Position

    for i = 1, MARKERS_IN_CIRCLE do
        local theta = angle * i
        local x = MARKER_DISTANCE_FROM_PLAYER * math.cos(theta)
        local y = MARKER_DISTANCE_FROM_PLAYER * math.sin(theta)

        if (i == MARKERS_IN_CIRCLE) then
            x = 0
            y = 0
        end

        local attributes = {
            xpos = TehHP.tutorial.origin.X + x,
            ypos = TehHP.tutorial.origin.Z,
            zpos = TehHP.tutorial.origin.Y + y,
            MapVisibility = false,
            InGameVisibility = true,
            Info = MARKER_CATALOG[i].info[1],
            iconSize = MARKER_CATALOG[i].iconSize[1],
            InfoRange = INFO_RANGE,
            type = MARKER_CATEGORY,
            copy = MARKER_CATALOG[i].copy[1],
            ["copy-message"] = MARKER_CATALOG[i].copyMessage,
            ["script-trigger"] = "TehHP_Infoflip(" .. i .. ")"
        }

        local newMarker = Pack:CreateMarker(attributes)
        newMarker:SetTexture(MARKER_CATALOG[i].iconFile[1])
        table.insert(TehHP.tutorial.markers, newMarker)
    end

    TehHP.tutorial.shown = true
end

local function hideTutorial()
    for _, marker in pairs(TehHP.tutorial.markers) do
        marker:Remove()
    end

    TehHP.tutorial.origin = nil
    TehHP.tutorial.markerOffsets = {}
    TehHP.tutorial.pageTracker = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    TehHP.tutorial.markers = {}
    TehHP.tutorial.shown = false
end

if (TehHP_GetBool("firstLaunch")) then
    showTutorial()
    TehHP_ToggleStorage("firstLaunch")
end

function TehHP_Infoflip(marker, autoTriggered, num)
    -- only do something if they actually pressed F
    if (autoTriggered == false) then
        -- Get catalog for the current marker
        local infoCatalog = MARKER_CATALOG[num]

        -- Get the new page
        local newPage = TehHP.tutorial.pageTracker[num] + 1
        if (newPage > infoCatalog.maxPages) then newPage = 1 end

        -- Set new values to the new page
        marker:SetTexture(infoCatalog.iconFile[newPage])
        marker.Size = infoCatalog.iconSize[newPage]
        marker:GetBehavior("InfoModifier").InfoValue = infoCatalog.info[newPage]
        marker:GetBehavior("CopyModifier").CopyValue = infoCatalog.copy[newPage]

        TehHP.tutorial.pageTracker[num] = newPage
    end
end

function TehHP_ToggleTutorial()
    if (TehHP.tutorial.shown) then
        hideTutorial()
    else
        showTutorial()
    end
end

local function tutorialTickHandler(gametime)
    if (TehHP.tutorial.shown) then
        if ((Mumble.PlayerCharacter.Position - TehHP.tutorial.origin):Length() > 35) then
            hideTutorial()
        end
    end
end

Event:OnTick(tutorialTickHandler)