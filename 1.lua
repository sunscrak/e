local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Tower Teleport Hub",
    LoadingTitle = "Loading Assets...",
    LoadingSubtitle = "by sunscrak", 
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, 
        FileName = "HubConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Automation", 4483362458)
local UtilityTab = Window:CreateTab("Utilities", 4483362458)

local Section = MainTab:CreateSection("Tower Controls")
local UtilSection = UtilityTab:CreateSection("Anti-Idling")

local isProLooping = false
local isNoobLooping = false
local isAntiAfkLooping = false
local Player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")

local proCoordinates = Vector3.new(-23.39, 223.77, 366.00)
local noobCoordinates = Vector3.new(-14.56, 162.22, -442.03)

local function startProLoop()
    while isProLooping do
        local character = Player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(proCoordinates)
            task.wait(0.5)
        else
            task.wait(1)
        end
    end
end

local function startNoobLoop()
    while isNoobLooping do
        local character = Player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(noobCoordinates)
            task.wait(0.5)
        else
            task.wait(1)
        end
    end
end

local function startAntiAfkLoop()
    while isAntiAfkLooping do
        local camera = workspace.CurrentCamera
        if camera then
            local viewportSize = camera.ViewportSize
            local centerX = viewportSize.X / 2
            local centerY = viewportSize.Y / 2
            
            VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
            task.wait(0.1)
            VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
        end
        
        task.wait(1020)
    end
end

local ProToggle = MainTab:CreateToggle({
    Name = "Teleport Pro Tower",
    CurrentValue = false,
    Flag = "ProTpToggle", 
    Callback = function(Value)
        isProLooping = Value
        
        if isProLooping then
            Rayfield:Notify({
                Title = "Pro Loop Activated",
                Content = "Teleporting to Pro Tower every 0.5 seconds.",
                Duration = 3
            })
            task.spawn(startProLoop)
        else
            Rayfield:Notify({
                Title = "Pro Loop Stopped",
                Content = "Pro Tower teleportation paused.",
                Duration = 3
            })
        end
    end,
})

local NoobToggle = MainTab:CreateToggle({
    Name = "Teleport Noob Tower",
    CurrentValue = false,
    Flag = "NoobTpToggle", 
    Callback = function(Value)
        isNoobLooping = Value
        
        if isNoobLooping then
            Rayfield:Notify({
                Title = "Noob Loop Activated",
                Content = "Teleporting to Noob Tower every 0.5 seconds.",
                Duration = 3
            })
            task.spawn(startNoobLoop)
        else
            Rayfield:Notify({
                Title = "Noob Loop Stopped",
                Content = "Noob Tower teleportation paused.",
                Duration = 3
            })
        end
    end,
})

local AntiAfkToggle = UtilityTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "AntiAfkToggle",
    Callback = function(Value)
        isAntiAfkLooping = Value
        
        if isAntiAfkLooping then
            Rayfield:Notify({
                Title = "Anti-AFK Active",
                Content = "Simulating center clicks every 17 minutes.",
                Duration = 3
            })
            task.spawn(startAntiAfkLoop)
        else
            Rayfield:Notify({
                Title = "Anti-AFK Stopped",
                Content = "Anti-idle sequence paused.",
                Duration = 3
            })
        end
    end,
})
