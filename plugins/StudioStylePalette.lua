local enabled = false
local button = plugin:CreateToolbar('Fasty48'):CreateButton('Studio Style Palette','','')

local ui = plugin:CreateDockWidgetPluginGui('StudioStylePalette', DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 300, 300, 325, 420))
ui.Title = 'Studio Style Palette'
ui.Name = 'StudioStylePalette'

local scrollFrame = Instance.new('ScrollingFrame')
scrollFrame.Parent = ui
scrollFrame.Size = UDim2.new(1,0,1,0)
scrollFrame.CanvasSize = UDim2.new(0,0,15,0)

local ListLayout = Instance.new('UIListLayout')
ListLayout.Parent = scrollFrame

for _,enumItem in pairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
  local label = Instance.new('TextLabel')
  label.Name = enumItem.Name
  label.Parent = scrollFrame
  label.Size = UDim2.new(1,0,0,50)
  label.Font = 'SourceSans'
  label.Text = ' '..enumItem.Name
  label.TextSize = 16
  label.TextXAlignment = 'Left'

  local frame = Instance.new('Frame')
  frame.Parent = label
  frame.BackgroundColor3 = settings().Studio.Theme:GetColor(enumItem)
  frame.Position = UDim2.new(0.5,0,0,0)
  frame.Size = UDim2.new(.5,0,1,0)

  settings().Studio.ThemeChanged:connect(function()
    frame.BackgroundColor3 = settings().Studio.Theme:GetColor(enumItem)
  end)
end

button.Click:connect(function()
  if enabled then
    ui.Enabled = false
    enabled = false
  else
    ui.Enabled = true
    enabled = true
  end
end)