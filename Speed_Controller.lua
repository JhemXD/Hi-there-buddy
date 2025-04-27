local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Sound Effects
local function playSound(soundId)
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Parent = script
	sound:Play()
	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end

-- GUI Elements
local SpeedGui = Instance.new("ScreenGui")
SpeedGui.Name = "SpeedController"
SpeedGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SpeedGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SpeedGui.ResetOnSpawn = false

local MainFrame = Instance.new("ScrollingFrame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = SpeedGui
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 201, 255)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3318, 0, 0.2889, 0)
MainFrame.Size = UDim2.new(0, 265, 0, 150)
MainFrame.CanvasSize = UDim2.new(0, 0, 0, 300) -- Adjusted CanvasSize for smooth scrolling
MainFrame.ScrollBarThickness = 10
local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.CornerRadius = UDim.new(0, 10)
MainFrameCorner.Parent = MainFrame

local Tittle = Instance.new("TextLabel")
Tittle.Name = "Tittle"
Tittle.Parent = MainFrame
Tittle.BackgroundColor3 = Color3.fromRGB(60, 223, 255)
Tittle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tittle.BorderSizePixel = 0
Tittle.Size = UDim2.new(0, 265, 0, 25)
Tittle.Font = Enum.Font.SourceSans
Tittle.Text = "Speed Controller by JhemXD"
Tittle.TextColor3 = Color3.fromRGB(0, 0, 0)
Tittle.TextSize = 14.000
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Tittle

local Watermark = Instance.new("TextLabel")
Watermark.Name = "Watermark"
Watermark.Parent = MainFrame
Watermark.BackgroundColor3 = Color3.fromRGB(24, 201, 255)
Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
Watermark.BorderSizePixel = 0
Watermark.Position = UDim2.new(0, 0, 0.826388896, 0)
Watermark.Size = UDim2.new(0, 264, 0, 25)
Watermark.Font = Enum.Font.SourceSans
Watermark.Text = "Speed Controller By JhemXD"
Watermark.TextColor3 = Color3.fromRGB(0, 0, 0)
Watermark.TextSize = 14.000
local WatermarkCorner = Instance.new("UICorner")
WatermarkCorner.CornerRadius = UDim.new(0, 10)
WatermarkCorner.Parent = Watermark

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundTransparency = 1.000
MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.894339621, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0, 26, 0, 25)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.TextSize = 51.000
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 10)
MinimizeCorner.Parent = MinimizeButton

-- Minimize functionality
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		MainFrame:TweenSize(UDim2.new(0, 265, 0, 23), "Out", "Quad", 0.3, true)
		MinimizeButton.Text = "+"
		Watermark.Visible = false
	else
		MainFrame:TweenSize(UDim2.new(0, 265, 0, 150), "Out", "Quad", 0.3, true)
		MinimizeButton.Text = "-"
		Watermark.Visible = true
	end
	playSound("12221967")
end)

-- Input Field for Setting Walkspeed
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedLabel.Size = UDim2.new(0, 200, 0, 25)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.Text = "Set Walkspeed:"
SpeedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
SpeedLabel.TextSize = 14.000

local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "SpeedInput"
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.Position = UDim2.new(0.1, 0, 0.3, 0)
SpeedInput.Size = UDim2.new(0, 200, 0, 25)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.Text = ""
SpeedInput.PlaceholderText = "Enter Walkspeed"
SpeedInput.TextColor3 = Color3.fromRGB(0, 0, 0)
SpeedInput.TextSize = 14.000
local SpeedInputCorner = Instance.new("UICorner")
SpeedInputCorner.CornerRadius = UDim.new(0, 10)
SpeedInputCorner.Parent = SpeedInput

local SetSpeedButton = Instance.new("TextButton")
SetSpeedButton.Name = "SetSpeedButton"
SetSpeedButton.Parent = MainFrame
SetSpeedButton.BackgroundColor3 = Color3.fromRGB(39, 205, 255)
SetSpeedButton.Position = UDim2.new(0.1, 0, 0.4, 0)
SetSpeedButton.Size = UDim2.new(0, 200, 0, 25)
SetSpeedButton.Font = Enum.Font.SourceSans
SetSpeedButton.Text = "Set Walkspeed"
SetSpeedButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SetSpeedButton.TextSize = 14.000
local SetSpeedButtonCorner = Instance.new("UICorner")
SetSpeedButtonCorner.CornerRadius = UDim.new(0, 10)
SetSpeedButtonCorner.Parent = SetSpeedButton

-- Input Field for Adding to Walkspeed
local AddSpeedLabel = Instance.new("TextLabel")
AddSpeedLabel.Name = "AddSpeedLabel"
AddSpeedLabel.Parent = MainFrame
AddSpeedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AddSpeedLabel.BackgroundTransparency = 1
AddSpeedLabel.Position = UDim2.new(0.1, 0, 0.55, 0)
AddSpeedLabel.Size = UDim2.new(0, 200, 0, 25)
AddSpeedLabel.Font = Enum.Font.SourceSans
AddSpeedLabel.Text = "Add to Walkspeed:"
AddSpeedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
AddSpeedLabel.TextSize = 14.000

local AddSpeedInput = Instance.new("TextBox")
AddSpeedInput.Name = "AddSpeedInput"
AddSpeedInput.Parent = MainFrame
AddSpeedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AddSpeedInput.Position = UDim2.new(0.1, 0, 0.65, 0)
AddSpeedInput.Size = UDim2.new(0, 200, 0, 25)
AddSpeedInput.Font = Enum.Font.SourceSans
AddSpeedInput.Text = ""
AddSpeedInput.PlaceholderText = "Enter Value to Add"
AddSpeedInput.TextColor3 = Color3.fromRGB(0, 0, 0)
AddSpeedInput.TextSize = 14.000
local AddSpeedInputCorner = Instance.new("UICorner")
AddSpeedInputCorner.CornerRadius = UDim.new(0, 10)
AddSpeedInputCorner.Parent = AddSpeedInput

local AddSpeedButton = Instance.new("TextButton")
AddSpeedButton.Name = "AddSpeedButton"
AddSpeedButton.Parent = MainFrame
AddSpeedButton.BackgroundColor3 = Color3.fromRGB(39, 205, 255)
AddSpeedButton.Position = UDim2.new(0.1, 0, 0.75, 0)
AddSpeedButton.Size = UDim2.new(0, 200, 0, 25)
AddSpeedButton.Font = Enum.Font.SourceSans
AddSpeedButton.Text = "Add to Walkspeed"
AddSpeedButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AddSpeedButton.TextSize = 14.000
local AddSpeedButtonCorner = Instance.new("UICorner")
AddSpeedButtonCorner.CornerRadius = UDim.new(0, 10)
AddSpeedButtonCorner.Parent = AddSpeedButton

-- Button Functionality
SetSpeedButton.MouseButton1Click:Connect(function()
	local newSpeed = tonumber(SpeedInput.Text)
	if newSpeed and Humanoid then
		Humanoid.WalkSpeed = newSpeed
		playSound("12221967")
	end
end)

AddSpeedButton.MouseButton1Click:Connect(function()
	local addSpeed = tonumber(AddSpeedInput.Text)
	if addSpeed and Humanoid then
		Humanoid.WalkSpeed = Humanoid.WalkSpeed + addSpeed
		playSound("12221967")
	end
end)

-- Make GUI draggable
local dragging = false
local dragInput, dragStart, startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

MainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		updateDrag(input)
	end
end)
