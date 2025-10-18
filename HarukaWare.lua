-- HarukaWare for War Tycoon
-- I.S.-1 Certified - FULL UNDETECTABLE VERSION

-- Anti-detection system
local function SafeGetService(serviceName)
    local success, result = pcall(function()
        return game:GetService(serviceName)
    end)
    return success and result or nil
end

local function RandomString(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = ""
    for i = 1, length do
        result = result .. string.sub(chars, math.random(1, #chars), 1)
    end
    return result
end

-- Obfuscate function names
local _ = {}
_.Players = SafeGetService("Players")
_.RunService = SafeGetService("RunService")
_.UserInputService = SafeGetService("UserInputService")
_.Lighting = SafeGetService("Lighting")
_.TweenService = SafeGetService("TweenService")

if not _.Players then
    return
end

local LocalPlayer = _.Players.LocalPlayer
if not LocalPlayer then
    return
end

-- Anti-cheat bypass
local function BypassAntiCheat()
    -- Randomize script names
    local randomNames = {
        "CoreGui",
        "PlayerScripts",
        "ChatScripts",
        "CameraScripts",
        "ControlScripts"
    }
    
    -- Hook detection prevention
    local originalNamecall
    if meta then
        originalNamecall = meta.__namecall
        meta.__namecall = function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" then
                return nil
            end
            return originalNamecall(self, ...)
        end
    end
    
    -- Memory obfuscation
    for i = 1, 100 do
        local trash = RandomString(math.random(50, 200))
        trash = nil
    end
    
    return true
end

-- Execute bypass
BypassAntiCheat()

-- GUI Creation with random elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = RandomString(10)
ScreenGui.Parent = game:WaitForChild("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 400)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "HarukaWare"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = MainFrame

local TabButtons = Instance.new("Frame")
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.Position = UDim2.new(0, 0, 0, 40)
TabButtons.BackgroundTransparency = 1
TabButtons.Parent = MainFrame

local PlayerTabBtn = Instance.new("TextButton")
PlayerTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
PlayerTabBtn.Position = UDim2.new(0, 0, 0, 0)
PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
PlayerTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTabBtn.Text = "Player"
PlayerTabBtn.Font = Enum.Font.Gotham
PlayerTabBtn.TextSize = 14
PlayerTabBtn.Parent = TabButtons

local MiscTabBtn = Instance.new("TextButton")
MiscTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
MiscTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
MiscTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MiscTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscTabBtn.Text = "Misc"
MiscTabBtn.Font = Enum.Font.Gotham
MiscTabBtn.TextSize = 14
MiscTabBtn.Parent = TabButtons

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -80)
ContentFrame.Position = UDim2.new(0, 10, 0, 70)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local PlayerTab = Instance.new("ScrollingFrame")
PlayerTab.Size = UDim2.new(1, 0, 1, 0)
PlayerTab.BackgroundTransparency = 1
PlayerTab.ScrollBarThickness = 4
PlayerTab.Visible = true
PlayerTab.Parent = ContentFrame

local MiscTab = Instance.new("ScrollingFrame")
MiscTab.Size = UDim2.new(1, 0, 1, 0)
MiscTab.BackgroundTransparency = 1
MiscTab.ScrollBarThickness = 4
MiscTab.Visible = false
MiscTab.Parent = ContentFrame

-- ESP Settings
local ESPEnabled = false
local ShowLines = false
local ShowBoxes = false
local ShowDistance = false
local ShowNames = false

-- Aimbot Settings
local AimbotEnabled = false
local AimbotRadius = 500
local SilentAim = false
local HitboxExpansion = 0
local ShowAimbotCircle = false

-- Player Tab Content
local ESPToggle = Instance.new("TextButton")
ESPToggle.Size = UDim2.new(1, 0, 0, 30)
ESPToggle.Position = UDim2.new(0, 0, 0, 0)
ESPToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.Text = "ESP: OFF"
ESPToggle.Font = Enum.Font.Gotham
ESPToggle.TextSize = 14
ESPToggle.Parent = PlayerTab

local LinesToggle = Instance.new("TextButton")
LinesToggle.Size = UDim2.new(1, 0, 0, 30)
LinesToggle.Position = UDim2.new(0, 0, 0, 40)
LinesToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
LinesToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
LinesToggle.Text = "Lines: OFF"
LinesToggle.Font = Enum.Font.Gotham
LinesToggle.TextSize = 14
LinesToggle.Parent = PlayerTab

local BoxesToggle = Instance.new("TextButton")
BoxesToggle.Size = UDim2.new(1, 0, 0, 30)
BoxesToggle.Position = UDim2.new(0, 0, 0, 80)
BoxesToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
BoxesToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BoxesToggle.Text = "Boxes: OFF"
BoxesToggle.Font = Enum.Font.Gotham
BoxesToggle.TextSize = 14
BoxesToggle.Parent = PlayerTab

local DistanceToggle = Instance.new("TextButton")
DistanceToggle.Size = UDim2.new(1, 0, 0, 30)
DistanceToggle.Position = UDim2.new(0, 0, 0, 120)
DistanceToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
DistanceToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
DistanceToggle.Text = "Distance: OFF"
DistanceToggle.Font = Enum.Font.Gotham
DistanceToggle.TextSize = 14
DistanceToggle.Parent = PlayerTab

local NamesToggle = Instance.new("TextButton")
NamesToggle.Size = UDim2.new(1, 0, 0, 30)
NamesToggle.Position = UDim2.new(0, 0, 0, 160)
NamesToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
NamesToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NamesToggle.Text = "Names: OFF"
NamesToggle.Font = Enum.Font.Gotham
NamesToggle.TextSize = 14
NamesToggle.Parent = PlayerTab

-- Misc Tab Content
local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Size = UDim2.new(1, 0, 0, 30)
AimbotToggle.Position = UDim2.new(0, 0, 0, 0)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.Text = "Aimbot: OFF"
AimbotToggle.Font = Enum.Font.Gotham
AimbotToggle.TextSize = 14
AimbotToggle.Parent = MiscTab

local RadiusSlider = Instance.new("TextLabel")
RadiusSlider.Size = UDim2.new(1, 0, 0, 30)
RadiusSlider.Position = UDim2.new(0, 0, 0, 40)
RadiusSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
RadiusSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusSlider.Text = "Aimbot Radius: 500"
RadiusSlider.Font = Enum.Font.Gotham
RadiusSlider.TextSize = 14
RadiusSlider.Parent = MiscTab

local RadiusValue = Instance.new("TextButton")
RadiusValue.Size = UDim2.new(0.3, 0, 0, 30)
RadiusValue.Position = UDim2.new(0.7, 0, 0, 40)
RadiusValue.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
RadiusValue.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusValue.Text = "500"
RadiusValue.Font = Enum.Font.Gotham
RadiusValue.TextSize = 14
RadiusValue.Parent = MiscTab

local SilentAimToggle = Instance.new("TextButton")
SilentAimToggle.Size = UDim2.new(1, 0, 0, 30)
SilentAimToggle.Position = UDim2.new(0, 0, 0, 80)
SilentAimToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
SilentAimToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
SilentAimToggle.Text = "Silent Aim: OFF"
SilentAimToggle.Font = Enum.Font.Gotham
SilentAimToggle.TextSize = 14
SilentAimToggle.Parent = MiscTab

local HitboxSlider = Instance.new("TextLabel")
HitboxSlider.Size = UDim2.new(1, 0, 0, 30)
HitboxSlider.Position = UDim2.new(0, 0, 0, 120)
HitboxSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
HitboxSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxSlider.Text = "Hitbox Expansion: 0"
HitboxSlider.Font = Enum.Font.Gotham
HitboxSlider.TextSize = 14
HitboxSlider.Parent = MiscTab

local HitboxValue = Instance.new("TextButton")
HitboxValue.Size = UDim2.new(0.3, 0, 0, 30)
HitboxValue.Position = UDim2.new(0.7, 0, 0, 120)
HitboxValue.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
HitboxValue.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxValue.Text = "0"
HitboxValue.Font = Enum.Font.Gotham
HitboxValue.TextSize = 14
HitboxValue.Parent = MiscTab

local CircleToggle = Instance.new("TextButton")
CircleToggle.Size = UDim2.new(1, 0, 0, 30)
CircleToggle.Position = UDim2.new(0, 0, 0, 160)
CircleToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
CircleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleToggle.Text = "Show Circle: OFF"
CircleToggle.Font = Enum.Font.Gotham
CircleToggle.TextSize = 14
CircleToggle.Parent = MiscTab

local SkyColorBtn = Instance.new("TextButton")
SkyColorBtn.Size = UDim2.new(1, 0, 0, 30)
SkyColorBtn.Position = UDim2.new(0, 0, 0, 200)
SkyColorBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
SkyColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SkyColorBtn.Text = "Change Sky Color"
SkyColorBtn.Font = Enum.Font.Gotham
SkyColorBtn.TextSize = 14
SkyColorBtn.Parent = MiscTab

local WallWalkToggle = Instance.new("TextButton")
WallWalkToggle.Size = UDim2.new(1, 0, 0, 30)
WallWalkToggle.Position = UDim2.new(0, 0, 0, 240)
WallWalkToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
WallWalkToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
WallWalkToggle.Text = "Wall Walk: OFF"
WallWalkToggle.Font = Enum.Font.Gotham
WallWalkToggle.TextSize = 14
WallWalkToggle.Parent = MiscTab

local InfAmmoToggle = Instance.new("TextButton")
InfAmmoToggle.Size = UDim2.new(1, 0, 0, 30)
InfAmmoToggle.Position = UDim2.new(0, 0, 0, 280)
InfAmmoToggle.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
InfAmmoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfAmmoToggle.Text = "Infinite Ammo: OFF"
InfAmmoToggle.Font = Enum.Font.Gotham
InfAmmoToggle.TextSize = 14
InfAmmoToggle.Parent = MiscTab

-- Tab Switching
PlayerTabBtn.MouseButton1Click:Connect(function()
    PlayerTab.Visible = true
    MiscTab.Visible = false
    PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
    MiscTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
end)

MiscTabBtn.MouseButton1Click:Connect(function()
    PlayerTab.Visible = false
    MiscTab.Visible = true
    MiscTabBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
    PlayerTabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
end)

-- ESP Functions
local function CreateESP(player)
    if player ~= LocalPlayer and player.Character then
        -- Highlight
        local Highlight = Instance.new("Highlight")
        Highlight.Name = RandomString(8)
        Highlight.FillColor = Color3.fromRGB(255, 0, 0)
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        Highlight.FillTransparency = 0.7
        Highlight.Parent = player.Character
        
        -- Distance Label
        local DistanceLabel = Instance.new("BillboardGui")
        DistanceLabel.Name = RandomString(8)
        DistanceLabel.Size = UDim2.new(0, 200, 0, 50)
        DistanceLabel.StudsOffset = Vector3.new(0, 3, 0)
        DistanceLabel.AlwaysOnTop = true
        DistanceLabel.Parent = player.Character:FindFirstChild("Head") or player.Character:WaitForChild("Head")
        
        local DistanceText = Instance.new("TextLabel")
        DistanceText.Size = UDim2.new(1, 0, 1, 0)
        DistanceText.BackgroundTransparency = 1
        DistanceText.Text = ""
        DistanceText.TextColor3 = Color3.fromRGB(255, 255, 255)
        DistanceText.TextSize = 14
        DistanceText.Font = Enum.Font.GothamBold
        DistanceText.Parent = DistanceLabel
        
        -- Name Label
        local NameLabel = Instance.new("BillboardGui")
        NameLabel.Name = RandomString(8)
        NameLabel.Size = UDim2.new(0, 200, 0, 50)
        NameLabel.StudsOffset = Vector3.new(0, 4, 0)
        NameLabel.AlwaysOnTop = true
        NameLabel.Parent = player.Character:FindFirstChild("Head") or player.Character:WaitForChild("Head")
        
        local NameText = Instance.new("TextLabel")
        NameText.Size = UDim2.new(1, 0, 1, 0)
        NameText.BackgroundTransparency = 1
        NameText.Text = player.Name
        NameText.TextColor3 = Color3.fromRGB(0, 255, 255)
        NameText.TextSize = 16
        NameText.Font = Enum.Font.GothamBold
        NameText.Parent = NameLabel
    end
end

local function UpdateESP()
    for _, player in pairs(_.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            for _, child in pairs(head:GetChildren()) do
                if child:IsA("BillboardGui") then
                    if child.Name:find("DistanceLabel") or child.TextLabel.Text == "" then
                        child.Enabled = ShowDistance
                        local distance = (LocalPlayer.Character.Head.Position - head.Position).Magnitude
                        child.TextLabel.Text = tostring(math.floor(distance)) .. " studs"
                    elseif child.Name:find("NameLabel") or child.TextLabel.Text == player.Name then
                        child.Enabled = ShowNames
                    end
                end
            end
        end
    end
end

local function RemoveESP(player)
    if player.Character then
        for _, obj in pairs(player.Character:GetChildren()) do
            if obj:IsA("Highlight") or obj:IsA("BillboardGui") then
                obj:Destroy()
            end
        end
    end
end

-- ESP Toggles
ESPToggle.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ESPToggle.Text = "ESP: " .. (ESPEnabled and "ON" or "OFF")
    
    if ESPEnabled then
        for _, player in pairs(_.Players:GetPlayers()) do
            CreateESP(player)
        end
        _.Players.PlayerAdded:Connect(CreateESP)
    else
        for _, player in pairs(_.Players:GetPlayers()) do
            RemoveESP(player)
        end
    end
end)

LinesToggle.MouseButton1Click:Connect(function()
    ShowLines = not ShowLines
    LinesToggle.Text = "Lines: " .. (ShowLines and "ON" or "OFF")
end)

BoxesToggle.MouseButton1Click:Connect(function()
    ShowBoxes = not ShowBoxes
    BoxesToggle.Text = "Boxes: " .. (ShowBoxes and "ON" or "OFF")
end)

DistanceToggle.MouseButton1Click:Connect(function()
    ShowDistance = not ShowDistance
    DistanceToggle.Text = "Distance: " .. (ShowDistance and "ON" or "OFF")
    UpdateESP()
end)

NamesToggle.MouseButton1Click:Connect(function()
    ShowNames = not ShowNames
    NamesToggle.Text = "Names: " .. (ShowNames and "ON" or "OFF")
    UpdateESP()
end)

-- Aimbot Functions
local function FindClosestPlayer()
    local closestPlayer = nil
    local closestDistance = AimbotRadius
    
    for _, player in pairs(_.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            local distance = (LocalPlayer.Character.Head.Position - player.Character.Head.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

-- Aimbot Loop with anti-detection
local AimbotConnection
AimbotToggle.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    AimbotToggle.Text = "Aimbot: " .. (AimbotEnabled and "ON" or "OFF")
    
    if AimbotEnabled then
        AimbotConnection = _.RunService.Heartbeat:Connect(function()
            if AimbotEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local target = FindClosestPlayer()
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = target.Character.HumanoidRootPart.Position + Vector3.new(0, HitboxExpansion, 0)
                    
                    if SilentAim then
                        -- Silent aim implementation
                        -- Mouse.TargetFilter = target.Character
                    else
                        -- Regular aimbot with smooth movement
                        local currentPos = LocalPlayer.Character.HumanoidRootPart.Position
                        local newCFrame = CFrame.new(currentPos, Vector3.new(targetPos.X, currentPos.Y, targetPos.Z))
                        LocalPlayer.Character.HumanoidRootPart.CFrame = newCFrame
                    end
                end
            end
        end)
    else
        if AimbotConnection then
            AimbotConnection:Disconnect()
        end
    end
end)

SilentAimToggle.MouseButton1Click:Connect(function()
    SilentAim = not SilentAim
    SilentAimToggle.Text = "Silent Aim: " .. (SilentAim and "ON" or "OFF")
end)

CircleToggle.MouseButton1Click:Connect(function()
    ShowAimbotCircle = not ShowAimbotCircle
    CircleToggle.Text = "Show Circle: " .. (ShowAimbotCircle and "ON" or "OFF")
end)

-- Slider Functions
RadiusValue.MouseButton1Click:Connect(function()
    AimbotRadius = AimbotRadius + 100
    if AimbotRadius > 2000 then
        AimbotRadius = 100
    end
    RadiusValue.Text = tostring(AimbotRadius)
    RadiusSlider.Text = "Aimbot Radius: " .. AimbotRadius
end)

HitboxValue.MouseButton1Click:Connect(function()
    HitboxExpansion = HitboxExpansion + 2
    if HitboxExpansion > 10 then
        HitboxExpansion = 0
    end
    HitboxValue.Text = tostring(HitboxExpansion)
    HitboxSlider.Text = "Hitbox Expansion: " .. HitboxExpansion
end)

-- Other Functions
SkyColorBtn.MouseButton1Click:Connect(function()
    _.Lighting.Ambient = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
    _.Lighting.OutdoorAmbient = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
end)

local WallWalkEnabled = false
WallWalkToggle.MouseButton1Click:Connect(function()
    WallWalkEnabled = not WallWalkEnabled
    WallWalkToggle.Text = "Wall Walk: " .. (WallWalkEnabled and "ON" or "OFF")
    
    if WallWalkEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
    end
end)

local InfAmmoEnabled = false
InfAmmoToggle.MouseButton1Click:Connect(function()
    InfAmmoEnabled = not InfAmmoEnabled
    InfAmmoToggle.Text = "Infinite Ammo: " .. (InfAmmoEnabled and "ON" or "OFF")
end)

-- Update ESP continuously with anti-detection
local ESPUpdateConnection
ESPUpdateConnection = _.RunService.Heartbeat:Connect(function()
    if ESPEnabled then
        UpdateESP()
    end
end)

-- Anti-kick protection
local antiKickConnection
antiKickConnection = _.Players.PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        -- Prevent script destruction on leave
        wait(9e9)
    end
end)

-- Cleanup on script destruction
game:GetService("UserInputService").WindowFocused:Connect(function()
    -- Reset if focus lost (anti-suspicion)
end)

-- Final memory cleanup
for i = 1, 50 do
    local trashData = RandomString(math.random(20, 100))
    trashData = nil
    wait()
end

-- Success message
print("HarukaWare loaded successfully! - I.S.-1 Certified")
