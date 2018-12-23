--Made By Fasty48
local Toolbar = plugin:CreateToolbar('Fastcar48')
local Button = Toolbar:CreateButton('Brick Counter','Counts the amount of parts inside the Workspace','rbxassetid://167300717')

local PluginEnabled = false
local Parts = 0

local Color={
	Black = Color3.fromRGB(33,33,33),
	Purple = Color3.fromRGB(156,39,176),
	White = Color3.new(1,1,1)
}

--------------------
--UI
--------------------
local UI = Instance.new('ScreenGui',game.CoreGui)

local MainFrame = Instance.new('Frame',UI)
MainFrame.BackgroundColor3 = Color.Black
MainFrame.BackgroundTransparency = .3
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(.5,-100,0,5)
MainFrame.Size = UDim2.new(0,200,0,80)
MainFrame.Visible = false

local Header = Instance.new('Frame',MainFrame)
Header.BackgroundColor3 = Color.Purple
Header.BorderSizePixel = 0
Header.Size = UDim2.new(1,0,0,5)

local Title = Instance.new('TextLabel',MainFrame)
Title.BackgroundColor3 = Color.Black
Title.BackgroundTransparency = .5
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0,5,0,10)
Title.Size = UDim2.new(0,190,0,25)
Title.Font = Enum.Font.SourceSans
Title.Text = 'Brick Counter'
Title.TextColor3 = Color.White
Title.TextSize = 18

local Counter = Instance.new('TextLabel',MainFrame)
Counter.BackgroundColor3 = Color.Black
Counter.BackgroundTransparency = .5
Counter.BorderSizePixel = 0
Counter.Position = UDim2.new(0,5,0,40)
Counter.Size = UDim2.new(0,190,0,35)
Counter.Font = Enum.Font.SourceSansBold
Counter.Text = ''
Counter.TextColor3 = Color.White
Counter.TextSize = 35

--------------------
--Functions
--------------------
function Activate(bool)
	PluginEnabled = bool
	Button:SetActive(bool)
	MainFrame.Visible = bool
end

function Scan(part,value)
	if part:IsA('BasePart') and part.ClassName ~= 'Terrain' then
		if value == 'add' then
			Parts = Parts + 1
		elseif value == 'remove' then
			Parts = Parts - 1
		end
		Counter.Text = Parts
	end
end

--------------------
--Plugin Events
--------------------
Button.Click:connect(function()
	if not PluginEnabled then
		Activate(true)
	else
		Activate(false)
	end
end)

--------------------
--Workspace Events
--------------------
workspace.DescendantAdded:connect(function(desc)
	Scan(desc,'add')
end)

workspace.DescendantRemoving:connect(function(desc)
	Scan(desc,'remove')
end)