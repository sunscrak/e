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
local VirtualUser = game:GetService("VirtualUser")

local proCoordinates = Vector3.new(-23.39, 223.77, 366.00)
local noobCoordinates = Vector3.new(-14.56, 162.22, -442.03)
local afkConnection

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

local ProToggle = MainTab:CreateToggle({
    Name = "Teleport Pro Tower",
    CurrentValue = false,
    Flag = "ProTpToggle", 
    Callback = function(Value)
        isProLooping = Value
        
        if isProLooping then
            if isNoobLooping then
                Rayfield:Notify({Title = "Error", Content = "Turn off Noob Tower loop first!", Duration = 3})
            else
                Rayfield:Notify({Title = "Pro Loop Activated", Content = "Teleporting to Pro Tower every 0.5s.", Duration = 3})
                task.spawn(startProLoop)
            end
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
            if isProLooping then
                Rayfield:Notify({Title = "Error", Content = "Turn off Pro Tower loop first!", Duration = 3})
            else
                Rayfield:Notify({Title = "Noob Loop Activated", Content = "Teleporting to Noob Tower every 0.5s.", Duration = 3})
                task.spawn(startNoobLoop)
            end
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
                Content = "Will intercept and block idle kicks.",
                Duration = 3
            })
            
            afkConnection = Player.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            if afkConnection then
                afkConnection:Disconnect()
                afkConnection = nil
            end
            
            Rayfield:Notify({
                Title = "Anti-AFK Stopped",
                Content = "Anti-idle sequence paused.",
                Duration = 3
            })
        end
    end,
})
