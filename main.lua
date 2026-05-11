--// NPG HUB | Ready To Use

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Test = Instance.new("TextButton")

ScreenGui.Name = "NPG_HUB"
pcall(function()
    ScreenGui.Parent = game.CoreGui
end)

Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 320, 0, 220)
Main.Position = UDim2.new(0.5, -160, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Title.Parent = Main
Title.Size = UDim2.new(1,0,0,45)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)
Title.BorderSizePixel = 0
Title.Text = "NPG HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

Close.Parent = Main
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-45,0,2)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.BackgroundColor3 = Color3.fromRGB(170,0,0)
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BorderSizePixel = 0

Test.Parent = Main
Test.Size = UDim2.new(0,250,0,50)
Test.Position = UDim2.new(0.5,-125,0.5,-25)
Test.Text = "TEST BUTTON"
Test.TextColor3 = Color3.new(1,1,1)
Test.BackgroundColor3 = Color3.fromRGB(45,45,45)
Test.Font = Enum.Font.GothamBold
Test.TextScaled = true
Test.BorderSizePixel = 0

-- Notification
local function Notify(txt)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "NPG HUB",
        Text = txt,
        Duration = 3
    })
end

Notify("โหลดสำเร็จ")

-- Button
Test.MouseButton1Click:Connect(function()
    Notify("คุณกดปุ่มแล้ว")
end)

-- Close
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
