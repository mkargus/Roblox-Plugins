--Made By Fasty48
local Button = plugin:CreateToolbar('Fasty48'):CreateButton('Terrain Color Editor','','rbxassetid://2041394144')

local Color={
	Black = Color3.fromRGB(33,33,33),
	Orange = Color3.fromRGB(255,152,0),
	White = Color3.new(1,1,1)
}

local MaterialList={
	{Name='Asphalt',Enum='Asphalt',Default=Color3.fromRGB(115,123,107)},
	{Name='Basalt',Enum='Basalt',Default=Color3.fromRGB(30,30,37)},
	{Name='Brick',Enum='Brick',Default=Color3.fromRGB(138,86,62)},
	{Name='Cobblestone',Enum='Cobblestone',Default=Color3.fromRGB(132,123,90)},
	{Name='Concrete',Enum='Concrete',Default=Color3.fromRGB(127,102,63)},
	{Name='Cracked Lava',Enum='CrackedLava',Default=Color3.fromRGB(232,156,74)},
	{Name='Glacier',Enum='Glacier',Default=Color3.fromRGB(101,176,234)},
	{Name='Grass',Enum='Grass',Default=Color3.fromRGB(106,127,63)},
	{Name='Ground',Enum='Ground',Default=Color3.fromRGB(102,92,59)},
	{Name='Ice',Enum='Ice',Default=Color3.fromRGB(129,194,224)},
	{Name='Leafy Grass',Enum='LeafyGrass',Default=Color3.fromRGB(115,132,74)},
	{Name='Limestone',Enum='Limestone',Default=Color3.fromRGB(206,173,148)},
	{Name='Mud',Enum='Mud',Default=Color3.fromRGB(58,46,36)},
	{Name='Pavement',Enum='Pavement',Default=Color3.fromRGB(148,148,140)},
	{Name='Rock',Enum='Rock',Default=Color3.fromRGB(102,108,111),},
	{Name='Salt',Enum='Salt',Default=Color3.fromRGB(198,189,181)},
	{Name='Sand',Enum='Sand',Default=Color3.fromRGB(143,126,95)},
	{Name='Sandstone',Enum='Sandstone',Default=Color3.fromRGB(137,90,71)},
	{Name='Slate',Enum='Slate',Default=Color3.fromRGB(63,127,107)},
	{Name='Snow',Enum='Snow',Default=Color3.fromRGB(195,199,218)},
	{Name='Water',Enum='Water',Default=Color3.fromRGB(12,84,91)},
	{Name='Wooden Planks',Enum='WoodPlanks',Default=Color3.fromRGB(139,109,79)}
}

local Settings={
	MaterialSelected = 1,
	PluginEnabled = false,
	R = 0,
	G = 0,
	B = 0
}

local UIButtons={}

--------------------
--UI
--------------------
local UI = Instance.new('ScreenGui',game.CoreGui)
UI.Enabled = false

--Color
local MainFrame = Instance.new('Frame',UI)
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color.Black
MainFrame.BackgroundTransparency = .5
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0,5,0,5)
MainFrame.Size = UDim2.new(0,160,0,165)

local header = Instance.new('Frame',MainFrame)
header.BackgroundColor3 = Color.Orange
header.BorderSizePixel = 0
header.Size = UDim2.new(1,0,0,5)

local Title = Instance.new('TextLabel',MainFrame)
Title.BackgroundColor3 = Color.Black
Title.BackgroundTransparency = .5
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0,5,0,10)
Title.Size = UDim2.new(1,-10,0,20)
Title.Font = Enum.Font.SourceSansBold
Title.Text = 'Terrain Color Editor'
Title.TextColor3 = Color.White
Title.TextSize = 14

--Red
local RedTitle = Instance.new('TextLabel',MainFrame)
RedTitle.BackgroundColor3 = Color.Black
RedTitle.BackgroundTransparency = .5
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
RedValue.BackgroundTransparency = .5
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
RedSlider.BackgroundTransparency = .5
RedSlider.BorderSizePixel = 0
RedSlider.Position = UDim2.new(0,0,0,20)
RedSlider.Size = UDim2.new(0,150,0,10)
RedSlider.BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
RedSlider.CanvasSize = UDim2.new(5,30,0,0)
RedSlider.MidImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
RedSlider.ScrollBarThickness = 10
RedSlider.TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'

--Green
local GreenTitle = Instance.new('TextLabel',MainFrame)
GreenTitle.BackgroundColor3 = Color.Black
GreenTitle.BackgroundTransparency = .5
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
BlueTitle.BackgroundTransparency = .5
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

local DefaultBtn = Instance.new('TextButton',MainFrame)
DefaultBtn.BackgroundColor3 = Color.Black
DefaultBtn.BackgroundTransparency = .5
DefaultBtn.BorderSizePixel = 0
DefaultBtn.Position = UDim2.new(0,5,0,140)
DefaultBtn.Size = UDim2.new(1,-10,0,20)
DefaultBtn.Font = Enum.Font.SourceSans
DefaultBtn.Text = 'Reset material to default'
DefaultBtn.TextColor3 = Color.White
DefaultBtn.TextSize = 14

--Material Selector
local SelectionFrame = Instance.new('ScrollingFrame',MainFrame)
SelectionFrame.BackgroundColor3 = Color.Black
SelectionFrame.BackgroundTransparency = .5
SelectionFrame.BorderSizePixel = 0
SelectionFrame.Position = UDim2.new(1,10,0,0)
SelectionFrame.Size = UDim2.new(0,150,0,175)
SelectionFrame.BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
SelectionFrame.CanvasSize = UDim2.new(0,0,4,45)
SelectionFrame.MidImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
SelectionFrame.ScrollBarThickness = 5
SelectionFrame.TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'

local ListLayout = Instance.new('UIListLayout',SelectionFrame)
ListLayout.Padding = UDim.new(0,2)

local Selected = Instance.new('Frame')
Selected.BackgroundColor3 = Color.Orange
Selected.BorderSizePixel = 0
Selected.Size = UDim2.new(0,5,1,0)

--------------------
--Functions
--------------------
function Activate(bool)
	Settings.PluginEnabled = bool
	Button:SetActive(bool)
	UI.Enabled = bool
end

function CheckMaterialColor(Material)
	local GetColor

	if Material == 'Water' then
		GetColor = workspace.Terrain.WaterColor
	else
		GetColor = workspace.Terrain:GetMaterialColor(Enum.Material[Material])
	end

	Settings.R = math.floor(GetColor.r*255)
	RedValue.Text = Settings.R
	RedSlider.CanvasPosition = Vector2.new(Settings.R,0)

	Settings.G = math.floor(GetColor.g*255)
	GreenValue.Text = Settings.G
	GreenSlider.CanvasPosition = Vector2.new(Settings.G,0)

	Settings.B = math.floor(GetColor.b*255)
	BlueValue.Text = Settings.B
	BlueSlider.CanvasPosition = Vector2.new(Settings.B,0)
end

function CreateBtn(Name)
	local Btn = Instance.new('TextButton',SelectionFrame)
	Btn.BackgroundColor3 = Color.Black
	Btn.BackgroundTransparency = .5
	Btn.BorderSizePixel = 0
	Btn.Name = Name
	Btn.Size = UDim2.new(1,-5,0,30)
	table.insert(UIButtons,Btn)
	Btn.LayoutOrder = #UIButtons
	Btn.Font = Enum.Font.SourceSans
	Btn.Text = Name
	Btn.TextColor3 = Color.White
	Btn.TextSize = 18
	Btn.MouseButton1Click:connect(function()
		Selected.Parent = UIButtons[Btn.LayoutOrder]
		Settings.MaterialSelected = Btn.LayoutOrder
		CheckMaterialColor(MaterialList[Settings.MaterialSelected].Enum)
	end)
	return Btn
end

function SetBackToDefault()
	local Material = Enum.Material[MaterialList[Settings.MaterialSelected].Enum]
	if Material == Enum.Material.Water then
		workspace.Terrain.WaterColor = Color3.fromRGB(12,84,91)
	else
		workspace.Terrain:SetMaterialColor(Material,MaterialList[Settings.MaterialSelected].Default)
	end
	CheckMaterialColor(MaterialList[Settings.MaterialSelected].Enum)
end

function SetMaterialColor()
	local Material = Enum.Material[MaterialList[Settings.MaterialSelected].Enum]
	local Color = Color3.fromRGB(Settings.R,Settings.G,Settings.B)
	if Material == Enum.Material.Water then
		workspace.Terrain.WaterColor = Color
	else
		workspace.Terrain:SetMaterialColor(Material,Color)
	end
end

--------------------
--Material List
--------------------
for _, Material in pairs(MaterialList) do
	CreateBtn(Material.Name)
end

--------------------
--Button events
--------------------
DefaultBtn.MouseButton1Click:connect(function()
	SetBackToDefault()
end)

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
	Activate(not Settings.PluginEnabled)
end)

plugin.Deactivation:connect(function()
	if Settings.PluginEnabled and UI.Enabled then
		Activate(false)
	end
end)