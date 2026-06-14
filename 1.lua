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
local Section = MainTab:CreateSection("Fast Teleport Loop")

local isLooping = false
local Player = game.Players.LocalPlayer
local targetCoordinates = Vector3.new(-14.56, 162.22, -442.03)

local function startFastTeleportLoop()
    while isLooping do
        local character = Player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(targetCoordinates)
            task.wait(0.5)
        else
            task.wait(1)
        end
    end
end

local Toggle = MainTab:CreateToggle({
    Name = "0.5s Teleport Loop",
    CurrentValue = false,
    Flag = "FastTpToggle", 
    Callback = function(Value)
        isLooping = Value
        
        if isLooping then
            Rayfield:Notify({
                Title = "Loop Activated",
                Content = "Teleporting to coordinates every 0.5 seconds.",
                Duration = 3
            })
            task.spawn(startFastTeleportLoop)
        else
            Rayfield:Notify({
                Title = "Loop Stopped",
                Content = "Teleportation paused.",
                Duration = 3
            })
        end
    end,
})
