local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ลบ UI เก่า
pcall(function()
    game.CoreGui:FindFirstChild("NPG_HUB"):Destroy()
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NPG_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,300,0,180)
Main.Position = UDim2.new(0.5,-150,0.5,-90)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundColor3 = Color3.fromRGB(35,35,35)
Title.Text = "NPG HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

local Toggle = Instance.new("TextButton")
Toggle.Parent = Main
Toggle.Size = UDim2.new(0,220,0,50)
Toggle.Position = UDim2.new(0.5,-110,0.5,-25)
Toggle.BackgroundColor3 = Color3.fromRGB(45,45,45)
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Text = "TEST BUTTON"
Toggle.TextScaled = true
Toggle.Font = Enum.Font.GothamBold

Toggle.MouseButton1Click:Connect(function()
    print("BUTTON CLICKED")

    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "NPG HUB",
            Text = "ทำงานแล้ว",
            Duration = 3
        })
    end)
end)
