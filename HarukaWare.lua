-- REAL WORKING HarukaWare with DRAG, MINIMIZE & WORKING ESP
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Settings
local Settings = {
    Aimbot = false,
    ESP = false,
    TeamCheck = true,
    AimKey = "MouseButton2"
}

-- Simple GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Header for dragging
local Header = Instance.new("TextButton")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.BorderSizePixel = 0
Header.Text = ""
Header.AutoButtonColor = false
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "HarukaWare"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Minimize button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 40, 0, 40)
MinimizeBtn.Position = UDim2.new(1, -80, 0, 0)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Text = "_"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 16
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = Header

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Header

-- Content area
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Aimbot toggle
local AimbotBtn = Instance.new("TextButton")
AimbotBtn.Size = UDim2.new(0.9, 0, 0, 40)
AimbotBtn.Position = UDim2.new(0.05, 0, 0, 10)
AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
AimbotBtn.Text = "AIMBOT: " .. (Settings.Aimbot and "ON" or "OFF")
AimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotBtn.TextSize = 14
AimbotBtn.Font = Enum.Font.GothamBold
AimbotBtn.Parent = Content

-- ESP toggle
local ESPBtn = Instance.new("TextButton")
ESPBtn.Size = UDim2.new(0.9, 0, 0, 40)
ESPBtn.Position = UDim2.new(0.05, 0, 0, 60)
ESPBtn.BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
ESPBtn.Text = "ESP: " .. (Settings.ESP and "ON" or "OFF")
ESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPBtn.TextSize = 14
ESPBtn.Font = Enum.Font.GothamBold
ESPBtn.Parent = Content

-- Team Check toggle
local TeamBtn = Instance.new("TextButton")
TeamBtn.Size = UDim2.new(0.9, 0, 0, 40)
TeamBtn.Position = UDim2.new(0.05, 0, 0, 110)
TeamBtn.BackgroundColor3 = Settings.TeamCheck and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
TeamBtn.Text = "TEAM CHECK: " .. (Settings.TeamCheck and "ON" or "OFF")
TeamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeamBtn.TextSize = 14
TeamBtn.Font = Enum.Font.GothamBold
TeamBtn.Parent = Content

-- Button corners
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = AimbotBtn
Corner:Clone().Parent = ESPBtn
Corner:Clone().Parent = TeamBtn

-- Button functions
AimbotBtn.MouseButton1Click:Connect(function()
    Settings.Aimbot = not Settings.Aimbot
    AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    AimbotBtn.Text = "AIMBOT: " .. (Settings.Aimbot and "ON" or "OFF")
end)

ESPBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    ESPBtn.BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    ESPBtn.Text = "ESP: " .. (Settings.ESP and "ON" or "OFF")
end)

TeamBtn.MouseButton1Click:Connect(function()
    Settings.TeamCheck = not Settings.TeamCheck
    TeamBtn.BackgroundColor3 = Settings.TeamCheck and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    TeamBtn.Text = "TEAM CHECK: " .. (Settings.TeamCheck and "ON" or "OFF")
end)

-- MINIMIZE FUNCTION
local Minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    if Minimized then
        Content.Visible = false
        MainFrame.Size = UDim2.new(0, 300, 0, 40)
        MinimizeBtn.Text = "+"
    else
        Content.Visible = true
        MainFrame.Size = UDim2.new(0, 300, 0, 200)
        MinimizeBtn.Text = "_"
    end
end)

-- CLOSE FUNCTION
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- DRAG FUNCTION
local dragging = false
local dragStart, startPos

Header.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = UserInputService:GetMouseLocation()
    startPos = MainFrame.Position
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local currentPos = UserInputService:GetMouseLocation()
        local delta = currentPos - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- REAL WORKING AIMBOT
function GetClosestEnemy()
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            -- Team check
            if Settings.TeamCheck then
                if player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
                    continue
                end
            end
            
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local head = player.Character:FindFirstChild("Head")
            
            if humanoid and humanoid.Health > 0 and head then
                local distance = (head.Position - Camera.CFrame.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    
    return closestPlayer
end

function SmoothAim()
    if not Settings.Aimbot then return end
    
    -- Check if aim key is pressed
    if Settings.AimKey == "MouseButton2" and not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        return
    end
    
    local target = GetClosestEnemy()
    if not target or not target.Character then return end
    
    local head = target.Character:FindFirstChild("Head")
    if not head then return end
    
    -- Get head position on screen
    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
    
    if onScreen then
        -- Calculate center of screen
        local centerX = Camera.ViewportSize.X / 2
        local centerY = Camera.ViewportSize.Y / 2
        
        -- Calculate distance to move mouse
        local deltaX = headPos.X - centerX
        local deltaY = headPos.Y - centerY
        
        -- Smooth movement
        local smoothness = 0.3
        deltaX = deltaX * smoothness
        deltaY = deltaY * smoothness
        
        -- Move mouse to head position
        mousemoverel(deltaX, deltaY)
    end
end

-- WORKING ESP FUNCTION
local ESPCache = {}

function UpdateESP()
    if not Settings.ESP then 
        -- Clear ESP
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                for _, obj in pairs(player.Character:GetChildren()) do
                    if obj:IsA("Highlight") and obj.Name == "HW_ESP" then
                        obj:Destroy()
                    end
                end
            end
        end
        ESPCache = {}
        return 
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            -- Team check
            if Settings.TeamCheck then
                if player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
                    -- Remove ESP from teammates
                    if ESPCache[player] then
                        ESPCache[player]:Destroy()
                        ESPCache[player] = nil
                    end
                    continue
                end
            end
            
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local head = player.Character:FindFirstChild("Head")
            
            if humanoid and humanoid.Health > 0 and head then
                if not ESPCache[player] then
                    -- Create new ESP
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "HW_ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.Parent = player.Character
                    ESPCache[player] = highlight
                end
            else
                -- Remove ESP if player died
                if ESPCache[player] then
                    ESPCache[player]:Destroy()
                    ESPCache[player] = nil
                end
            end
        else
            -- Remove ESP if player left
            if ESPCache[player] then
                ESPCache[player]:Destroy()
                ESPCache[player] = nil
            end
        end
    end
end

-- Main loop
RunService.Heartbeat:Connect(function()
    SmoothAim()
    UpdateESP()
end)

-- Keybinds
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    elseif input.KeyCode == Enum.KeyCode.Insert then
        Settings.Aimbot = not Settings.Aimbot
        AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        AimbotBtn.Text = "AIMBOT: " .. (Settings.Aimbot and "ON" or "OFF")
    end
end)

print("🎯 HarukaWare LOADED!")
print("📋 Controls: RightControl - Menu, Insert - Aimbot, RMB - Hold to aim")
print("✅ Features: Working Aimbot, ESP, Team Check, Drag, Minimize")
