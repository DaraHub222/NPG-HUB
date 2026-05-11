--// NPG HUB | VELOCITY SUPPORT

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

_G.AutoFarm = false

--========================
-- GUI
--========================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NPG_HUB"

pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
end)

ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,320,0,190)
Main.Position = UDim2.new(0.5,-160,0.5,-95)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local UICorner = Instance.new("UICorner", Main)

--========================
-- TITLE
--========================

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,45)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)
Title.BorderSizePixel = 0
Title.Text = "NPG AUTO FARM"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

local TitleCorner = Instance.new("UICorner", Title)

--========================
-- TOGGLE
--========================

local Toggle = Instance.new("TextButton")
Toggle.Parent = Main
Toggle.Size = UDim2.new(0,250,0,50)
Toggle.Position = UDim2.new(0.5,-125,0.5,-25)
Toggle.BackgroundColor3 = Color3.fromRGB(45,45,45)
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextScaled = true
Toggle.Text = "AUTO FARM : OFF"
Toggle.BorderSizePixel = 0

local ToggleCorner = Instance.new("UICorner", Toggle)

--========================
-- CLOSE BUTTON
--========================

local Close = Instance.new("TextButton")
Close.Parent = Main
Close.Size = UDim2.new(0,35,0,35)
Close.Position = UDim2.new(1,-40,0,5)
Close.BackgroundColor3 = Color3.fromRGB(170,0,0)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner", Close)

--========================
-- OPEN BUTTON
--========================

local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0,60,0,60)
OpenButton.Position = UDim2.new(0,20,0.5,-30)
OpenButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
OpenButton.Text = "NPG"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.Font = Enum.Font.GothamBold
OpenButton.TextScaled = true
OpenButton.BorderSizePixel = 0
OpenButton.Active = true
OpenButton.Draggable = true

local OpenCorner = Instance.new("UICorner", OpenButton)

--========================
-- NOTIFY
--========================

local function Notify(txt)
    pcall(function()
        StarterGui:SetCore("SendNotification",{
            Title = "NPG HUB",
            Text = txt,
            Duration = 3
        })
    end)
end

Notify("โหลดสำเร็จ")

--========================
-- GET NEAREST MOB
--========================

function GetNearestMob()

    local nearest = nil
    local distance = math.huge

    if workspace:FindFirstChild("Mobs") then

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
    end

    return nearest
end

--========================
-- TOGGLE BUTTON
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
-- CLOSE UI
--========================

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

--========================
-- OPEN UI
--========================

OpenButton.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

--========================
-- AUTO FARM LOOP
--========================

task.spawn(function()

    while task.wait() do

        pcall(function()

            if _G.AutoFarm then

                char = player.Character or player.CharacterAdded:Wait()

                local mob = GetNearestMob()

                if mob then

                    char.HumanoidRootPart.CFrame =
                        mob.HumanoidRootPart.CFrame * CFrame.new(0,0,3)

                    -- Attack
                    pcall(function()

                        game:GetService("VirtualInputManager")
                        :SendMouseButtonEvent(
                            0,0,0,true,game,0
                        )

                        game:GetService("VirtualInputManager")
                        :SendMouseButtonEvent(
                            0,0,0,false,game,0
                        )

                    end)

                end
            end

        end)
    end
end)
