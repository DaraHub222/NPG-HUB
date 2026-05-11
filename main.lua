--// NPG HUB AUTO FARM UI

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

_G.AutoFarm = false

--========================
-- UI
--========================

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local Close = Instance.new("TextButton")

pcall(function()
    ScreenGui.Parent = game.CoreGui
end)

ScreenGui.Name = "NPG_HUB"

Main.Parent = ScreenGui
Main.Size = UDim2.new(0,320,0,180)
Main.Position = UDim2.new(0.5,-160,0.5,-90)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Title.Parent = Main
Title.Size = UDim2.new(1,0,0,45)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)
Title.BorderSizePixel = 0
Title.Text = "NPG AUTO FARM"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

Toggle.Parent = Main
Toggle.Size = UDim2.new(0,250,0,50)
Toggle.Position = UDim2.new(0.5,-125,0.5,-25)
Toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextScaled = true
Toggle.Text = "AUTO FARM : OFF"
Toggle.BorderSizePixel = 0

Close.Parent = Main
Close.Size = UDim2.new(0,35,0,35)
Close.Position = UDim2.new(1,-40,0,5)
Close.BackgroundColor3 = Color3.fromRGB(170,0,0)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BorderSizePixel = 0

--========================
-- Notification
--========================

local function Notify(txt)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "NPG HUB",
        Text = txt,
        Duration = 3
    })
end

Notify("โหลดสำเร็จ")

--========================
-- หา Mob ใกล้สุด
--========================

function GetNearestMob()
    local nearest = nil
    local distance = math.huge

    for _, mob in pairs(workspace.Mobs:GetChildren()) do
        if mob:FindFirstChild("Humanoid")
        and mob:FindFirstChild("HumanoidRootPart")
        and mob.Humanoid.Health > 0 then

            local dist = (
                char.HumanoidRootPart.Position
                - mob.HumanoidRootPart.Position
            ).Magnitude

            if dist < distance then
                distance = dist
                nearest = mob
            end
        end
    end

    return nearest
end

--========================
-- Toggle
--========================

Toggle.MouseButton1Click:Connect(function()
    _G.AutoFarm = not _G.AutoFarm

    if _G.AutoFarm then
        Toggle.Text = "AUTO FARM : ON"
        Notify("เปิด Auto Farm")
    else
        Toggle.Text = "AUTO FARM : OFF"
        Notify("ปิด Auto Farm")
    end
end)

--========================
-- Close UI
--========================

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

--========================
-- Auto Farm Loop
--========================

task.spawn(function()
    while task.wait() do
        pcall(function()

            if _G.AutoFarm then

                local mob = GetNearestMob()

                if mob then

                    char.HumanoidRootPart.CFrame =
                        mob.HumanoidRootPart.CFrame * CFrame.new(0,0,3)

                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(
                        0,0,0,true,game,0
                    )

                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(
                        0,0,0,false,game,0
                    )

                end
            end

        end)
    end
end)
