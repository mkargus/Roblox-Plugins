--Made By Fasty48
local Button = plugin:CreateToolbar('Fastcar48'):CreateButton('Terrain Color Editor','','rbxassetid://1282175967')

local Color={
	Black = Color3.fromRGB(33,33,33),
	Orange = Color3.fromRGB(255,152,0),
	White = Color3.new(1,1,1)
}

local Settings={
	PluginEnabled = false,
	MaterialSelected = 1,

	R = 0,
	G = 0,
	B = 0
}

local UIButtons={}
local Materials={}

--------------------
--UI
--------------------
local UI = Instance.new('ScreenGui',game.CoreGui)

--Color
local MainFrame = Instance.new('Frame',UI)
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color.Black
MainFrame.BackgroundTransparency = .25
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0,5,0,5)
MainFrame.Size = UDim2.new(0,160,0,145)
MainFrame.Visible = false

local header = Instance.new('Frame',MainFrame)
header.BackgroundColor3 = Color.Orange
header.BorderSizePixel = 0
header.Size = UDim2.new(1,0,0,5)

local Title = Instance.new('TextLabel',MainFrame)
Title.BackgroundColor3 = Color.Black
Title.BackgroundTransparency = .6
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0,5,0,10)
Title.Size = UDim2.new(1,-10,0,20)
Title.Font = Enum.Font.SourceSansBold
Title.Text = 'Terrain Color Editor'
Title.TextColor3 = Color.White
Title.TextSize = 15

--Red
local RedTitle = Instance.new('TextLabel',MainFrame)
RedTitle.BackgroundColor3 = Color.Black
RedTitle.BackgroundTransparency = .6
RedTitle.BorderSizePixel = 0
RedTitle.Position = UDim2.new(0,5,0,35)
RedTitle.Size = UDim2.new(.5,-5,0,20)
RedTitle.Font = Enum.Font.SourceSansBold
RedTitle.Text = 'Red'
RedTitle.TextColor3 = Color.White
RedTitle.TextSize = 18
RedTitle.TextXAlignment = Enum.TextXAlignment.Left

local RedValue = Instance.new("TextBox",RedTitle)
RedValue.BackgroundColor3 = Color.Black
RedValue.BackgroundTransparency = .6
RedValue.BorderSizePixel = 0
RedValue.Position = UDim2.new(1,0,0,0)
RedValue.Size = UDim2.new(1,0,0,20)
RedValue.Font = Enum.Font.SourceSans
RedValue.Text = '0'
RedValue.TextColor3 = Color.White
RedValue.TextSize = 18
RedValue.TextXAlignment = Enum.TextXAlignment.Right

local RedSlider = Instance.new('ScrollingFrame',RedTitle)
RedSlider.BackgroundColor3 = Color.Black
RedSlider.BackgroundTransparency = .2
RedSlider.BorderSizePixel = 0
RedSlider.Position = UDim2.new(0,0,0,20)
RedSlider.Size = UDim2.new(0,150,0,10)
RedSlider.BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
RedSlider.CanvasSize = UDim2.new(0,405,0,0)
RedSlider.MidImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
RedSlider.ScrollBarThickness = 10
RedSlider.TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'

--Green
local GreenTitle = Instance.new('TextLabel',MainFrame)
GreenTitle.BackgroundColor3 = Color.Black
GreenTitle.BackgroundTransparency = .6
GreenTitle.BorderSizePixel = 0
GreenTitle.Position = UDim2.new(0,5,0,70)
GreenTitle.Size = UDim2.new(.5,-5,0,20)
GreenTitle.Font = Enum.Font.SourceSansBold
GreenTitle.Text = 'Green'
GreenTitle.TextColor3 = Color.White
GreenTitle.TextSize = 18
GreenTitle.TextXAlignment = Enum.TextXAlignment.Left

local GreenValue = RedValue:Clone()
GreenValue.Parent = GreenTitle

local GreenSlider = RedSlider:Clone()
GreenSlider.Parent = GreenTitle

--Blue
local BlueTitle = Instance.new('TextLabel',MainFrame)
BlueTitle.BackgroundColor3 = Color.Black
BlueTitle.BackgroundTransparency = .6
BlueTitle.BorderSizePixel = 0
BlueTitle.Position = UDim2.new(0,5,0,105)
BlueTitle.Size = UDim2.new(.5,-5,0,20)
BlueTitle.Font = Enum.Font.SourceSansBold
BlueTitle.Text = 'Blue'
BlueTitle.TextColor3 = Color.White
BlueTitle.TextSize = 18
BlueTitle.TextXAlignment = Enum.TextXAlignment.Left

local BlueValue = RedValue:Clone()
BlueValue.Parent = BlueTitle

local BlueSlider = RedSlider:Clone()
BlueSlider.Parent = BlueTitle

--Material Selector
local SelectionFrame = Instance.new('ScrollingFrame',MainFrame)
SelectionFrame.BackgroundColor3 = Color.Black
SelectionFrame.BackgroundTransparency = .25
SelectionFrame.BorderSizePixel = 0
SelectionFrame.Position = UDim2.new(1,10,0,0)
SelectionFrame.Size = UDim2.new(0,150,0,175)
SelectionFrame.BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
SelectionFrame.CanvasSize = UDim2.new(0,0,4.85,0)
SelectionFrame.MidImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
SelectionFrame.ScrollBarThickness = 5
SelectionFrame.TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'

local ListLayout = Instance.new('UIListLayout',SelectionFrame)
ListLayout.Padding = UDim.new(0,2)

--------------------
--Functions
--------------------
function Activate(bool)
	Settings.PluginEnabled = bool
	Button:SetActive(bool)
	MainFrame.Visible = bool
end

function CheckMaterialColor(Material)
	local GetColor

	if Material == 'Water' then
		GetColor = workspace.Terrain.WaterColor
	else
		GetColor = workspace.Terrain:GetMaterialColor(Enum.Material[Material])
	end

	Settings.R = math.floor(GetColor.r*255)
	Settings.G = math.floor(GetColor.g*255)
	Settings.B = math.floor(GetColor.b*255)

	RedValue.Text = Settings.R
	RedSlider.CanvasPosition = Vector2.new(Settings.R,0)

	GreenValue.Text = Settings.G
	GreenSlider.CanvasPosition = Vector2.new(Settings.G,0)

	BlueValue.Text = Settings.B
	BlueSlider.CanvasPosition = Vector2.new(Settings.B,0)
end

function CreateBtn(Name,Material)
	local Btn = Instance.new('TextButton',SelectionFrame)
	Btn.BackgroundColor3 = Color.Black
	Btn.BackgroundTransparency = .6
	Btn.BorderSizePixel = 0
	Btn.Name = Name
	Btn.Size = UDim2.new(1,-5,0,30)
	table.insert(UIButtons,Btn)
	if not Material then
		table.insert(Materials,Name)
	else
		table.insert(Materials,Material)
	end
	Btn.LayoutOrder = #UIButtons
	Btn.Font = Enum.Font.SourceSans
	Btn.Text = Name
	Btn.TextColor3 = Color.White
	Btn.TextSize = 20
	Btn.MouseButton1Click:connect(function() UISelect(Btn.LayoutOrder) end)
	return Btn
end

function SetMaterialColor()
	local Material = Enum.Material[Materials[Settings.MaterialSelected]]
	local Color = Color3.fromRGB(Settings.R,Settings.G,Settings.B)
	if Material == Enum.Material.Water then
		workspace.Terrain.WaterColor = Color
	else
		workspace.Terrain:SetMaterialColor(Material,Color)
	end
end

function UISelect(number)
	for _,v in ipairs(UIButtons) do
		v.BackgroundColor3 = Color.Black
	end
	UIButtons[number].BackgroundColor3 = Color.White
	Settings.MaterialSelected = number
	CheckMaterialColor(Materials[number])
end

--------------------
--Material List
--------------------
CreateBtn('Asphalt')
CreateBtn('Basalt','Basalt')
CreateBtn('Brick','Brick')
CreateBtn('Cobblestone')
CreateBtn('Concrete')
CreateBtn('Cracked Lava','CrackedLava')
CreateBtn('Glacier')
CreateBtn('Grass')
CreateBtn('Ground')
CreateBtn('Ice')
CreateBtn('Leafy Grass','LeafyGrass')
CreateBtn('Limestone')
CreateBtn('Mud')
CreateBtn('Pavement')
CreateBtn('Rock')
CreateBtn('Salt')
CreateBtn('Sand')
CreateBtn('Sandstone')
CreateBtn('Slate')
CreateBtn('Snow')
CreateBtn('Water')
CreateBtn('Wooden Planks','WoodPlanks')

--------------------
--Textbox events
--------------------
RedValue.FocusLost:connect(function()
	if tonumber(RedValue.Text) then
		RedSlider.CanvasPosition = Vector2.new(RedValue.Text,0)
	else
		RedValue.Text = Settings.R
	end
end)

GreenValue.FocusLost:connect(function()
	if tonumber(GreenValue.Text) then
		GreenSlider.CanvasPosition = Vector2.new(GreenValue.Text,0)
	else
		GreenValue.Text = Settings.G
	end
end)

BlueValue.FocusLost:connect(function()
	if tonumber(BlueValue.Text) then
		BlueSlider.CanvasPosition = Vector2.new(BlueValue.Text,0)
	else
		BlueValue.Text = Settings.B
	end
end)

--------------------
--Slider events
--------------------
RedSlider.Changed:connect(function(property)
	if property == 'CanvasPosition' then
		Settings.R = RedSlider.CanvasPosition.X
		RedValue.Text = RedSlider.CanvasPosition.X
		SetMaterialColor()
	end
end)

GreenSlider.Changed:connect(function(property)
	if property == 'CanvasPosition' then
		Settings.G = GreenSlider.CanvasPosition.X
		GreenValue.Text = GreenSlider.CanvasPosition.X
		SetMaterialColor()
	end
end)

BlueSlider.Changed:connect(function(property)
	if property == 'CanvasPosition' then
		Settings.B = BlueSlider.CanvasPosition.X
		BlueValue.Text = BlueSlider.CanvasPosition.X
		SetMaterialColor()
	end
end)

--------------------
--Plugin Events
--------------------
Button.Click:connect(function()
	if Settings.PluginEnabled then
		Activate(false)
	else
		Activate(true)
	end
end)

plugin.Deactivation:connect(function()
	if Settings.PluginEnabled and MainFrame.Visible then
		Activate(false)
	end
end)