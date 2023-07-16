TehHP.bounce = {
    currentTarget = nil,
    isBouncing = false,
    wasFocused = false,
    timeSinceStarted = 0
}

Debug:Watch("TehHP_Bounce", TehHP.bounce)

-- Reset the bouncing marker to normal
function TehHP_BounceReset()
    local target = TehHP.bounce.currentTarget
    local bounce = target:GetBehavior("BounceModifier")
    bounce.BounceHeight = 0
    TehHP.bounce.isBouncing = false
    local category = target.Category.Name
    if (category == "1") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/1.png")
    elseif (category == "2") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/2.png")
    elseif (category == "3") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/3.png")
    end
    TehHP.bounce.currentTarget = nil
    TehHP.bounce.wasFocused = false
    TehHP.bounce.timeSinceStarted = 0
end

-- Checks if the player enters the markers trigger range, if they do, waits for them to no longer be in the trigger range to stop it from bouncing
function TehHP_BounceTickHandler(gameTime)
    TehHP.bounce.timeSinceStarted = TehHP.bounce.timeSinceStarted + gameTime.ElapsedGameTime.TotalSeconds
    if (not TehHP_GetBool("bounceToggled")) then TehHP_BounceReset() return end
    if (TehHP.bounce.timeSinceStarted > 300) then TehHP_BounceReset() return end

    if (TehHP.bounce.wasFocused) then
        if (not TehHP.bounce.currentTarget.Focused) then
                TehHP_BounceReset()
            return
        end
        return
    end

    if (TehHP.bounce.currentTarget.Focused) then
        TehHP.bounce.wasFocused = true
    end
end

-- Makes the marker with the given guid bounce until you enter and leave it's trigger range
function TehHP_Bounce(marker, isAutoTrigger, guid)
    if (not TehHP_GetBool("bounceToggled")) then return end

    local target = World:MarkerByGuid(guid)
    local category = target.Category.Name

    local bounce = target:GetBehavior("BounceModifier")
    bounce.BounceHeight = 1

    if (category == "1") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/1-shadow.png")
    elseif (category == "2") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/2-shadow.png")
    elseif (category == "3") then
        target:SetTexture("Data/TehsTrails-HeroPoints/Markers/3-shadow.png")
    end
    TehHP.bounce.currentTarget = target
    TehHP.bounce.isBouncing = true
    TehHP.bounce.wasFocused = false
    TehHP.bounce.timeSinceStarted = 0
end