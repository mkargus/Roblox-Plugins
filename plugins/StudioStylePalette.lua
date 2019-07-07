local enabled = false
local button = plugin:CreateToolbar('Fasty48'):CreateButton('Studio Style Palette','','')

local ui = plugin:CreateDockWidgetPluginGui('StudioStylePalette', DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 300, 300, 325, 420))
ui.Title = 'Studio Style Palette'
ui.Name = 'StudioStylePalette'

local BKG = Instance.new('Frame')
BKG.Parent = ui
BKG.Size = UDim2.new(1,0,1,0)

local styleGuideFrame = Instance.new('ScrollingFrame')
styleGuideFrame.ScrollBarThickness = 0
styleGuideFrame.ScrollingEnabled = false
styleGuideFrame.Position = UDim2.new(0,0,0,30)
styleGuideFrame.Size = UDim2.new(0.25,0,1,-30)
styleGuideFrame.Name = 'styleGuideFrame'
styleGuideFrame.Parent = BKG

local ListLayout = Instance.new('UIListLayout')
ListLayout.Parent = styleGuideFrame

for _,enumItem in pairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
  local label = Instance.new('TextLabel')
  label.Name = enumItem.Name
  label.Parent = styleGuideFrame
  label.Size = UDim2.new(1,0,0,30)
  label.Font = 'SourceSans'
  label.Text = ' '..enumItem.Name
  label.TextSize = 16
  label.TextXAlignment = 'Left'
end

styleGuideFrame.CanvasSize = UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)

local ModifierFrame = Instance.new('ScrollingFrame')
ModifierFrame.ScrollBarThickness = 0
ModifierFrame.ScrollingEnabled = false
ModifierFrame.Position = UDim2.new(0.25,0,0,0)
ModifierFrame.Size = UDim2.new(0.75,0,0,30)
ModifierFrame.Parent = BKG

local ModifierListLayout = Instance.new('UIListLayout')
ModifierListLayout.Parent = ModifierFrame
ModifierListLayout.FillDirection = 'Horizontal'

for _,enumItem in pairs(Enum.StudioStyleGuideModifier:GetEnumItems()) do
  local label = Instance.new('TextLabel')
  label.Name = enumItem.Name
  label.Parent = ModifierFrame
  label.Size = UDim2.new(0,250,0,30)
  label.Font = 'SourceSans'
  label.Text = enumItem.Name
  label.TextSize = 16
end

ModifierFrame.CanvasSize = UDim2.new(0,ModifierListLayout.AbsoluteContentSize.X,0,0)

local Main = Instance.new('ScrollingFrame')
Main.ScrollBarThickness = 8
Main.Position = UDim2.new(0.25,0,0,30)
Main.Size = UDim2.new(0.75,0,1,-30)
Main.Parent = BKG
Main.CanvasSize = UDim2.new(0,ModifierListLayout.AbsoluteContentSize.X, 0, ListLayout.AbsoluteContentSize.Y)

local grid = Instance.new('UIGridLayout')
grid.CellPadding = UDim2.new(0,0,0,0)
grid.CellSize = UDim2.new(0,250,0,30)
grid.Parent = Main

Main:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
  styleGuideFrame.CanvasPosition = Vector2.new(0,Main.CanvasPosition.Y)
  ModifierFrame.CanvasPosition = Vector2.new(Main.CanvasPosition.X,0)
end)

for _,StudioStyleGuideItem in pairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
  for _,StudioStyleGuideModifierItem in pairs(Enum.StudioStyleGuideModifier:GetEnumItems()) do
    local Item = Instance.new('Frame')
    Item.BackgroundColor3 = settings().Studio.Theme:GetColor(StudioStyleGuideItem, StudioStyleGuideModifierItem)
    Item.Parent = Main
    settings().Studio.ThemeChanged:connect(function()
      Item.BackgroundColor3 = settings().Studio.Theme:GetColor(StudioStyleGuideItem, StudioStyleGuideModifierItem)
    end)
  end
end

button.Click:connect(function()
  enabled = not enabled
  ui.Enabled = enabled
end)
