-- ==========================================
-- 1. INITIALIZE RAYFIELD LIBRARY
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local TweenService = game:GetService("TweenService")

local Window = Rayfield:CreateWindow({
    Name = "Tower Move Hub",
    LoadingTitle = "Loading Assets...",
    LoadingSubtitle = "by sunscrak", 
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Automation", 4483362458)
local Section = MainTab:CreateSection("Tween Movement Loop")

-- ==========================================
-- 2. CONTROL STATE & FIXED TWEEN LOGIC
-- ==========================================
local isLooping = false
local Player = game.Players.LocalPlayer
local targetCoordinates = Vector3.new(-14.56, 162.22, -442.03)

local tweenInfo = TweenInfo.new(
    0.5, 
    Enum.EasingStyle.Linear, 
    Enum.EasingDirection.Out
)

local function startTweenLoop()
    while isLooping do
        local character = Player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            -- 1. Grab your current location right before moving (so it can go back)
            local startCFrame = humanoidRootPart.CFrame
            local targetCFrame = CFrame.new(targetCoordinates)
            
            -- 2. Smoothly walk/tween to the destination (takes 0.5 seconds)
            local walkTween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
            walkTween:Play()
            walkTween.Completed:Wait() 
            
            -- 3. Give the game a split second to register the win/checkpoint
            task.wait(0.2)
            
            if not isLooping then break end
            
            -- 4. Instantly teleport back to your starting point so you can "walk" up again
            humanoidRootPart.CFrame = startCFrame
            
            -- 5. Wait a moment before starting the next walk cycle
            task.wait(0.5)
        else
            task.wait(1)
        end
    end
end

-- ==========================================
-- 3. UI TOGGLE ELEMENT
-- ==========================================
local Toggle = MainTab:CreateToggle({
    Name = "Auto Walk/Tween Loop",
    CurrentValue = false,
    Flag = "TweenLoopToggle", 
    Callback = function(Value)
        isLooping = Value
        if isLooping then
            task.spawn(startTweenLoop)
        end
    end,
})
