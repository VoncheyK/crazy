
local Window

local Module = {
	
}

local Objects = {

}

function Module:Win(Player, Name)
	local Name = Name or "Untitled"
	
	if not Player then warn("Error!") end
	if not Player:IsA("Player") then print("Player object is not a Player!") end
	
	local PlayerGui = Player:FindFirstChild("PlayerGui")
	
	local WindowUI = Instance.new("ScreenGui", PlayerGui)
	WindowUI.IgnoreGuiInset = true
	WindowUI.Name = Name.."Thread"
	
	local Frame = Instance.new("Frame", WindowUI)
	Frame.Draggable = true
	Frame.Selectable = true
	Frame.ClipsDescendants = true
	Frame.Active = true
	Frame.BorderSizePixel = 0
	Frame.BackgroundColor3 = Color3.new(0.0823529, 0.0784314, 0.0980392)
	Frame.Size = UDim2.new(0.25,0,0.35,0)
	Frame.Position = UDim2.new((1-Frame.Size.X.Scale)/2,0,(1-Frame.Size.Y.Scale)/2,0)
	Frame.Name = "FrameThread"
	

	
	local TopbarFrame = Instance.new("TextLabel", Frame)
	TopbarFrame.Draggable = true
	TopbarFrame.BorderSizePixel = 0
	TopbarFrame.BackgroundColor3 = Color3.new(0.113725, 0.105882, 0.133333)
	TopbarFrame.Size = UDim2.new(1,0,0.1,0)
	TopbarFrame.TextSize = 14
	TopbarFrame.Text = Name
	TopbarFrame.TextColor3 = Color3.new(1,1,1)
	TopbarFrame.Name = "TopBarThread"
	
	local Outline = Instance.new("UIStroke", TopbarFrame)
	Outline.Thickness = 2
	
	local ContentFrame = Instance.new("ScrollingFrame", Frame)
	--ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ContentFrame.ScrollBarThickness = 0
	ContentFrame.BorderSizePixel = 0
	ContentFrame.BackgroundTransparency = 1
	ContentFrame.Position = UDim2.new(0,0,0.125,0)
	ContentFrame.Size = UDim2.new(1,0,0.875,0)
	ContentFrame.Name = "ContentFrameThread"
	
	local Sort = Instance.new("UIListLayout", ContentFrame)
	--Sort.Name = "ContentSortThread"
	
	Window = {
		Flags = {},
		Win = WindowUI
	}
	
	
	Window.Toggle = function(Title:string, Flag:string)
		table.insert(Window.Flags, Flag)
		Window.Flags[Flag] = false
		
		local TText = Instance.new("TextButton")
		TText.TextSize = 17
		TText.TextColor3 = Color3.new(1,1,1)
		TText.Text = (Title .. "  ["..tostring(Window.Flags[Flag]).."]")
		TText.BorderSizePixel = 0
		TText.BackgroundTransparency = 1
		TText.Size = UDim2.new(1,0,0.05,0)
		TText.Name = "ToggleThread"	
		TText.Parent = ContentFrame
		
		TText.MouseButton1Down:Connect(function()
			Window.Flags[Flag] = not Window.Flags[Flag]
			TText.Text = (Title .. "  ["..tostring(Window.Flags[Flag]).."]")
		end)
	end
	
	
	setmetatable(Objects, Window)

	
	return Window
end



return Module
