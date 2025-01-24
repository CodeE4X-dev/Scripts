local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Star X | Build A Boat For Treasure", "DarkTheme")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Misc")
local Tab3 = Window:NewTab("Teleport")

local Section1 = Tab1:NewSection("Main")

Section1:NewToggle("Auto Farm", "ToggleInfo", function(value)
    --// Services
    local players = game:GetService("Players")

    --// Workspace
    local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
    local penguin, gold = workspace:WaitForChild("ChangeCharacter"), workspace:WaitForChild("ClaimRiverResultsGold")

    --// Other
    local client = game.Players.LocalPlayer

    --// Main
    _G.Busy = value
    while _G.Busy do
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = client.Character.HumanoidRootPart

        for i = 1, 9 do
            if not client.Character or not client.Character:FindFirstChild("Humanoid") then
                repeat wait() until client.Character and client.Character:FindFirstChild("Humanoid")
            end

            client.Character.HumanoidRootPart.CFrame = stages["CaveStage"..i].DarknessPart.CFrame wait(0.1)

            if not _G.Busy then
                client.Character.Humanoid.Health = 0
                return -- Fixed "exit(0)" error here
            end

            if i == 1 then
                wait(6)
            else
                wait(3)
            end

            gold:FireServer()
        end

        client.Character:Remove()

        repeat wait() 
        until client.Character and client.Character:FindFirstChild("HumanoidRootPart")
    end
end)







Section1:NewToggle("Auto Open Common Chest", "ToggleInfo", function(value)
    getgenv().Number = 1
    getgenv().Common = value

    game:GetService('RunService').Stepped:Connect(function()
        if getgenv().Common then
            workspace.ItemBoughtFromShop:InvokeServer("Common Chest", getgenv().Number)
        end
    end)
end)

Section1:NewToggle("Auto Open Uncommon Chest", "ToggleInfo", function(value)
    getgenv().UnCommon = value
    getgenv().Number = 1
    game:GetService('RunService').Stepped:Connect(function()
        if getgenv().UnCommon then
            workspace.ItemBoughtFromShop:InvokeServer("Uncommon Chest", getgenv().Number)
        end
    end)
end)

Section1:NewToggle("Auto Open Rare Chest", "ToggleInfo", function(value)
    getgenv().Rare = value
    getgenv().Number = 1
    game:GetService('RunService').Stepped:Connect(function()
        if getgenv().Rare then
            workspace.ItemBoughtFromShop:InvokeServer("Rare Chest", getgenv().Number)
        end
    end)
end)

Section1:NewToggle("Auto Open Epic Chest", "ToggleInfo", function(value)
    getgenv().Epic = value
    getgenv().Number = 1
    game:GetService('RunService').Stepped:Connect(function()
        if getgenv().Epic then
            workspace.ItemBoughtFromShop:InvokeServer("Epic Chest", getgenv().Number)
        end
    end)
end)

Section1:NewToggle("Auto Open Legendary Chest", "ToggleInfo", function(value)
    getgenv().Legendary = value
    getgenv().Number = 1
    game:GetService('RunService').Stepped:Connect(function()
        if getgenv().Legendary then
            workspace.ItemBoughtFromShop:InvokeServer("Legendary Chest", getgenv().Number)
        end
    end)
end)

local Section2 = Tab2:NewSection("Misc")

Section2:NewToggle("Fly", "ToggleInfo", function()
    local FlyingKey = Enum.KeyCode.B
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
end)

Section2:NewToggle("Walk On Water", "ToggleInfo", function(value)
    getgenv().Water = value
    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            if getgenv().Water and game.Players.LocalPlayer.Character:FindFirstChild("WaterDetector") then
                game.Players.LocalPlayer.Character.WaterDetector:Destroy()
            end
        end)
    end)
end)

local Section3 = Tab2:NewSection("Player Adjustment")

Section3:NewSlider("HipHeight", "SliderInfo", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)

Section3:NewSlider("Walkspeed", "SliderInfo", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section3:NewSlider("JumpPower", "SliderInfo", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Section4 = Tab2:NewSection("Morph")

Section4:NewButton("FoxMorph", "ButtonInfo", function()
    workspace.ChangeCharacter:FireServer("FoxCharacter")
end)

Section4:NewButton("PenguinMorph", "ButtonInfo", function()
    workspace.ChangeCharacter:FireServer("PenguinCharacter")
end)

Section4:NewButton("ChickenMorph", "ButtonInfo", function()
    workspace.ChangeCharacter:FireServer("ChickenCharacter")
end)

local Section5 = Tab3:NewSection("Teleport")

Section5:NewButton("Teleport To Blue", "Teleport to the blue zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Really blueZone"].CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To Black", "Teleport to the black zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").BlackZone.CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To Magenta", "Teleport to the magenta zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MagentaZone.CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To Red", "Teleport to the red zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(221.12088, -9.89999676, -64.0851135)
end)

Section5:NewButton("Teleport To Yellow", "Teleport to the yellow zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["New YellerZone"].CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To Green", "Teleport to the green zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").CamoZone.CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To White", "Teleport to the white zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WhiteZone.CFrame * CFrame.new(0, 5, 0)
end)

Section5:NewButton("Teleport To Void", "Teleport to the void.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.huge, math.huge, math.huge)
end)

Section5:NewButton("Rejoin", "Rejoin the current server.", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Section5:NewButton("Server Hop", "Join a new server.", function()
    local HttpService = game:GetService("HttpService")
    local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data

    for _, Server in ipairs(Servers) do
        if Server.id ~= game.JobId and Server.playing < Server.maxPlayers then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Server.id)
            break
        end
    end
end)



--FIX AUTO FARM LIBRARY
