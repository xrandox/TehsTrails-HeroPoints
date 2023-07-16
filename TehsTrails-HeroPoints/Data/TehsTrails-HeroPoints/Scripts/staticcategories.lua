TehHP.static = {
    -- List of the map ID's we have markers on in, split by area
    maps = {
        eod = { 1422, 1428, 1438, 1442, 1452 },
        hot = { 1043, 1045, 1052 },
        pof = { 1210, 1211, 1226, 1228 },
        all = { 1043, 1045, 1052, 1210, 1211, 1226, 1228, 1422, 1428, 1438, 1442, 1452 }
    },
    -- Category types we want shown always, according to which areas they should be shown in
    categories = {
        all = {
            "tthp.credits.null.ign",
            "tthp.credits.zotmer.discord",
            "tthp.credits.snow.snow2",
            "tthp.credits.foxe.foxe3",
            "tthp.credits.odeh.odeh1",
            "tthp.credits.radd.radd0",
            "tthp.credits.orig.orig2",
            "tthp.credits.maptesters.contributor",
            "tthp.credits.assets.assets0",
            "tthp.credits.tt.link",
            "tthp.credits.overflow.link",
            "tthp.credits.bhud.link",
            "tthp.credits.mail.m.ign",
            "tthp.credits.kofi.k.link",
            "tthp.credits.a",
            "tthp.credits.f",
            "tthp.credits.k"
        },
        eod = {

        },
        hot = {

        },
        pof = {

        }
    }
}

local mapID = Mumble.CurrentMap.Id

-- Returns true if a map ID is in the table of ID's
local function mapIsIn(table, val)
    for _, v in ipairs(table) do
        if (v == val) then
            return true
        end
    end

    return false
end

-- Globally accessible version of above
function TehHP_MapIsIn(table, val)
    return mapIsIn(table, val)
end

-- Creates invisable markers with the categories from a given table
local function markerFromTable (table)
    -- Attributes to use for all the markers
    local attributes = {
        MapVisibility = false,
        MiniMapVisibility = false,
        InGameVisibility = false,
        xpos = 0,
        ypos = 0,
        zpos = 0,
        type = nil
    }

    -- For each category, create a marker with that type
    for _, category in ipairs(table) do
        attributes.type = category
        Pack:CreateMarker(attributes)
    end
end

-- Create markers from the respective categories if the current mapID is in the table

local maps = TehHP.static.maps
local categories = TehHP.static.categories

-- EoD maps
if (mapIsIn(maps.eod, mapID)) then
    markerFromTable(categories.eod)
    markerFromTable(categories.all)

-- HoT maps
elseif (mapIsIn(maps.hot, mapID)) then
    markerFromTable(categories.hot)
    markerFromTable(categories.all)

-- PoF maps
elseif (mapIsIn(maps.pof, mapID)) then
    markerFromTable(categories.pof)
    markerFromTable(categories.all)
end
