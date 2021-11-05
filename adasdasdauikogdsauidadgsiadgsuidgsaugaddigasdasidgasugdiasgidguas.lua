local Config = {
    WindowName = "Pick Cheat Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightShift
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Pick Cheat Hub")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("Main Mods")
local Section2 = Tab1:CreateSection("Map & Player Mods")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Toggle1 = Section1:CreateToggle("inf Ammo", nil, function(State)
	local mt = getrawmetatable(game)
setreadonly(mt,false)
local nidx = mt.__newindex

mt.__newindex = newcclosure(function(a,b,c)
    if b == 'Text' and tostring(a.Name) == 'AmmoCounter' then
        return nidx(a,b,math.huge..'/3')
    end
   
    return nidx(a,b,c)
end)

local function Ammo()
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "LoadedAmmo") then
            v.LoadedAmmo = math.huge
        end
    end
end

while wait(1) do
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Revolver') then
        spawn(function()
            pcall(function()
                game.Players.LocalPlayer.Character.Revolver.ClientEvent:FireServer("SetVisible", {[1] = false})
               
                wait(0.25)
               
                game.Players.LocalPlayer.Character.Revolver.ClientEvent:FireServer("SetVisible", {[1] = true})
                game.Players.LocalPlayer.Character.Revolver.ClientEvent:FireServer("ReloadUpdate", {[1] = "Start"})
               
                wait(0.25)
               
                game.Players.LocalPlayer.Character.Revolver.ClientEvent:FireServer("ReloadUpdate", {[1] = "AmmoAdded"})
               
                Ammo()
            end)
        end)
    end
end
end)


local Button1 = Section1:CreateButton("Kife Aura", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/hgbCALJw", true))()
end)


local Button1 = Section1:CreateButton("Slient Aim", function()
	local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local mouse = localPlayer:GetMouse()

local function getClosestPlayerToCursor(x, y)
    local closestPlayer = nil
    local shortestDistance = math.huge

    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Torso") then
            local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(x, y)).magnitude

            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
		end
    end

    return closestPlayer
end

local mt = getrawmetatable(game)
local oldIndex = mt.__index
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
local newClose = newcclosure or function(f) return f end

mt.__index = newClose(function(t, k)
    if not checkcaller() and t == mouse and tostring(k) == "X" and string.find(getfenv(2).script.Name, "Client") and getClosestPlayerToCursor() then
    	local closest = getClosestPlayerToCursor(oldIndex(t, k), oldIndex(t, "Y")).Character.Head
    	local pos = currentCamera:WorldToScreenPoint(closest.Position)
    	return pos.X
    end
    if not checkcaller() and t == mouse and tostring(k) == "Y" and string.find(getfenv(2).script.Name, "Client") and getClosestPlayerToCursor() then
    	local closest = getClosestPlayerToCursor(oldIndex(t, "X"), oldIndex(t, k)).Character.Head
    	local pos = currentCamera:WorldToScreenPoint(closest.Position)
    	return pos.Y
    end
    if t == mouse and tostring(k) == "Hit" and string.find(getfenv(2).script.Name, "Client") and getClosestPlayerToCursor() then
        return getClosestPlayerToCursor(mouse.X, mouse.Y).Character.Head.CFrame
    end

    return oldIndex(t, k)
end)

if setreadonly then setreadonly(mt, true) else make_writeable(mt, false) end
end)


local Button1 = Section1:CreateButton("Custom Cursor", function()
    local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

if not getgenv().CursorConfig then
    getgenv().CursorConfig = {
        Color = Color3.fromRGB(255,255,255),
        OutlineColor = Color3.fromRGB(0,0,0),
        CrosshairColor = Color3.fromRGB(255,64,64),
        CrosshairSize = 4,
        CrosshairGap = 2,
        CrosshairThickness = 1.5,
        CrosshairEnabled = true,

        Transparency = 1,
        OutlineTransparency = 1,
        CrosshairTransparency = 1,

        Rainbow = false,
        OutlineRainbow = false,

        DeleteCursor = false
    }
end

local CursorOutline = Drawing.new("Triangle")
CursorOutline.Visible = true
CursorOutline.Transparency = CursorConfig.OutlineTransparency
CursorOutline.Color = CursorConfig.OutlineColor
CursorOutline.Thickness = 1
CursorOutline.Filled = true

local Cursor = Drawing.new("Triangle")
Cursor.Visible = true
Cursor.Transparency = CursorConfig.Transparency
Cursor.Color = CursorConfig.Color
Cursor.Thickness = 1
Cursor.Filled = true

local CrosshairL = Drawing.new("Line")
CrosshairL.Visible = true
CrosshairL.Transparency = CursorConfig.CrosshairTransparency
CrosshairL.Color = CursorConfig.CrosshairColor
CrosshairL.Thickness = CursorConfig.CrosshairThickness

local CrosshairR = Drawing.new("Line")
CrosshairR.Visible = true
CrosshairR.Transparency = CursorConfig.CrosshairTransparency
CrosshairR.Color = CursorConfig.CrosshairColor
CrosshairR.Thickness = CursorConfig.CrosshairThickness

local CrosshairT = Drawing.new("Line")
CrosshairT.Visible = true
CrosshairT.Transparency = CursorConfig.CrosshairTransparency
CrosshairT.Color = CursorConfig.CrosshairColor
CrosshairT.Thickness = CursorConfig.CrosshairThickness

local CrosshairB = Drawing.new("Line")
CrosshairB.Visible = true
CrosshairB.Transparency = CursorConfig.CrosshairTransparency
CrosshairB.Color = CursorConfig.CrosshairColor
CrosshairB.Thickness = CursorConfig.CrosshairThickness

Render = RunService.RenderStepped:Connect(function()
    if UserInputService.MouseBehavior == Enum.MouseBehavior.Default then
        local Mouse = UserInputService:GetMouseLocation()
        UserInputService.MouseIconEnabled = false

        CursorOutline.PointA = Vector2.new(Mouse.X,Mouse.Y + 16)
        CursorOutline.PointB = Vector2.new(Mouse.X,Mouse.Y)
        CursorOutline.PointC = Vector2.new(Mouse.X + 11,Mouse.Y + 10)

        CursorOutline.Color = CursorConfig.OutlineColor
        CursorOutline.Transparency = CursorConfig.OutlineTransparency

        Cursor.PointA = Vector2.new(Mouse.X,Mouse.Y + 15)
        Cursor.PointB = Vector2.new(Mouse.X,Mouse.Y)
        Cursor.PointC = Vector2.new(Mouse.X + 10,Mouse.Y + 10)

        Cursor.Color = CursorConfig.Color
        Cursor.Transparency = CursorConfig.Transparency

        CrosshairL.Transparency = 0
        CrosshairR.Transparency = 0
        CrosshairT.Transparency = 0
        CrosshairB.Transparency = 0
    else
        local Mouse = UserInputService:GetMouseLocation()
        UserInputService.MouseIconEnabled = false
        
        CursorOutline.Transparency = 0
        Cursor.Transparency = 0

        if CursorConfig.CrosshairEnabled then
            CrosshairL.Color = CursorConfig.CrosshairColor
            CrosshairL.Transparency = CursorConfig.CrosshairTransparency
            CrosshairL.Thickness = CursorConfig.CrosshairThickness
            CrosshairL.From = Vector2.new(Mouse.X - CursorConfig.CrosshairGap,Mouse.Y)
            CrosshairL.To = Vector2.new(Mouse.X - (CursorConfig.CrosshairSize + CursorConfig.CrosshairGap),Mouse.Y)

            CrosshairR.Color = CursorConfig.CrosshairColor
            CrosshairR.Transparency = CursorConfig.CrosshairTransparency
            CrosshairR.Thickness = CursorConfig.CrosshairThickness
            CrosshairR.From = Vector2.new(Mouse.X + (CursorConfig.CrosshairGap + 1),Mouse.Y)
            CrosshairR.To = Vector2.new(Mouse.X + (CursorConfig.CrosshairSize + (CursorConfig.CrosshairGap + 1)),Mouse.Y)

            CrosshairT.Color = CursorConfig.CrosshairColor
            CrosshairT.Transparency = CursorConfig.CrosshairTransparency
            CrosshairT.Thickness = CursorConfig.CrosshairThickness
            CrosshairT.From = Vector2.new(Mouse.X,Mouse.Y - CursorConfig.CrosshairGap)
            CrosshairT.To = Vector2.new(Mouse.X,Mouse.Y - (CursorConfig.CrosshairSize + CursorConfig.CrosshairGap))

            CrosshairB.Color = CursorConfig.CrosshairColor
            CrosshairB.Transparency = CursorConfig.CrosshairTransparency
            CrosshairB.Thickness = CursorConfig.CrosshairThickness
            CrosshairB.From = Vector2.new(Mouse.X,Mouse.Y + (CursorConfig.CrosshairGap + 1))
            CrosshairB.To = Vector2.new(Mouse.X,Mouse.Y + (CursorConfig.CrosshairSize + (CursorConfig.CrosshairGap + 1)))
        else
            CrosshairL.Transparency = 0
            CrosshairR.Transparency = 0
            CrosshairT.Transparency = 0
            CrosshairB.Transparency = 0
        end
    end

    if CursorConfig.DeleteCursor then
        Render:Disconnect()

        CursorOutline:Remove()
        Cursor:Remove()

        CrosshairL:Remove()
        CrosshairR:Remove()
        CrosshairT:Remove()
        CrosshairB:Remove()

        UserInputService.MouseIconEnabled = true
        CursorConfig.DeleteCursor = false
    end

    if CursorConfig.OutlineRainbow then
        local Hue, Saturation, Value = CursorConfig.OutlineColor:ToHSV()
        if Hue == 1 then
            Hue = 0
        end
        CursorConfig.OutlineColor = Color3.fromHSV(Hue + 0.001, 1, 1)
    end
    if CursorConfig.Rainbow then
        local Hue, Saturation, Value = CursorCondfig.Color:ToHSV()
        if Hue == 1 then
            Hue = 0
        end
        CursorConfig.Color = Color3.fromHSV(Hue + 0.001, 1, 1)
    end
end)
end)


local Button2 = Section2:CreateButton("ESP Menu", function()
	local custom_theme = {}

local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
	inst[i] = v
end
return inst
end
	
local age1 = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='age1', Parent=game.CoreGui})
local p_visuals = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 50, 0, 60),Rotation=0,Selectable=false,Size=UDim2.new(0, 200, 0, 254),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'p_visuals',Parent = age1})
local UIListLayout = CreateInstance('UIListLayout', {Padding = UDim.new(0, 1), FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top, Name = 'UIListLayout', Parent = p_visuals })
local title1 = CreateInstance('TextLabel',{Font=Enum.Font.GothamBlack,FontSize=Enum.FontSize.Size18,Text='Pick Esp Menu',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=18,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, 0, 0, 24),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='title1',Parent = p_visuals})
local b_b = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Bounding box',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_b',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_b})
local b_f = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Fill alpha',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_f',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_f})
local b_rt = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Render team',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_rt',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_rt})
local b_tc = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Use TeamColor',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_tc',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_tc})
local b_sn = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show name',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sn',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sn})
local b_sd = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show distance',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sd',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sd})
local b_sh = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Show health',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_sh',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='OFF',TextColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_sh})
local b_ht = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Health type',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ht',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Text',TextColor3=Color3.new(0, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_ht})
local b_f_t = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Fill transparency',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_f_t',Parent = p_visuals})
local v = CreateInstance('TextLabel',{Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,Text='1',TextColor3=Color3.new(0, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Right,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='v',Parent = b_f_t})
local title1_2 = CreateInstance('TextLabel',{Font=Enum.Font.SourceSansBold,FontSize=Enum.FontSize.Size18,Text='ESP',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=18,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, 0, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='title1_2',Parent = p_visuals})
local b_ct = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Team color',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ct',Parent = p_visuals})
local ct_b = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 0, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0, 0, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -2, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_b',Parent = b_ct})
local ct_g = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 1, 0), PlaceholderText='', PlaceholderColor3=Color3.new(0, 1, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -29, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_g',Parent = b_ct})
local ct_r = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 0, 0), PlaceholderText='', PlaceholderColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -56, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ct_r',Parent = b_ct})
local b_ce = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Enemy color',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 0, 0.498039),BackgroundTransparency=1,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(1, -2, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='b_ce',Parent = p_visuals})
local ce_b = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 0, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0, 0, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -2, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_b',Parent = b_ce})
local ce_g = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(0, 1, 0), PlaceholderText='', PlaceholderColor3=Color3.new(0, 1, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -29, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_g',Parent = b_ce})
local ce_r = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.Gotham,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='',TextColor3=Color3.new(1, 0, 0), PlaceholderText='', PlaceholderColor3=Color3.new(1, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(1, 0),BackgroundColor3=Color3.new(0.121569, 0.12549, 0.172549),BackgroundTransparency=0,BorderColor3=Color3.new(1, 0, 0.498039),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1, -56, 0, 2),Rotation=0,Selectable=true,Size=UDim2.new(0, 27, 0, 14),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ce_r',Parent = b_ce})
local watermark = CreateInstance('TextLabel',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Pick Esp v0.01',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=30,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 2, 0, -34),Rotation=0,Selectable=false,Size=UDim2.new(0, 200, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=20,Name='watermark',Parent = age1})
local watermark1 = CreateInstance('TextLabel',{Font=Enum.Font.Code,FontSize=Enum.FontSize.Size14,Text='Pick Esp v0.01',TextColor3=Color3.new(1, 0, 0.498039),TextScaled=false,TextSize=30,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=0,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, -2, 0, -2),Rotation=0,Selectable=false,Size=UDim2.new(0, 200, 0, 20),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=20,Name='watermark1',Parent = watermark})
p_visuals.Draggable = true

title1.LayoutOrder = 0 title1_2.LayoutOrder = 1
b_b.LayoutOrder = 1 b_f.LayoutOrder = 2 b_f_t.LayoutOrder = 3 b_sd.LayoutOrder = 4 b_sn.LayoutOrder = 5 b_sh.LayoutOrder = 6 b_ht.LayoutOrder = 7 b_rt.LayoutOrder = 8 b_tc.LayoutOrder = 9 b_ct.LayoutOrder = 10 b_ce.LayoutOrder = 11

local localplayer = game:GetService"Players".LocalPlayer
local uis = game:GetService"UserInputService"

local cheats = {
	b_b = false;
	b_f = false;
	b_f_t = 1;
	b_sd = false;
	b_sn = false;
	b_sh = false;
	b_ht = "Text";
	b_rt = false;
	b_tc = false;
}

local cheatsf = Instance.new("Folder", game.CoreGui) cheatsf.Name = "cheats"
local espf = Instance.new("Folder", cheatsf) espf.Name = "esp"

function addEsp(player)
	local bbg = Instance.new("BillboardGui", espf)
	bbg.Name = player.Name
	bbg.AlwaysOnTop = true
	bbg.Size = UDim2.new(4,0,5.4,0)
	bbg.ClipsDescendants = false
	
	local outlines = Instance.new("Frame", bbg)
	outlines.Size = UDim2.new(1,0,1,0)
	outlines.BorderSizePixel = 0
	outlines.BackgroundTransparency = 1
	local left = Instance.new("Frame", outlines)
	left.BorderSizePixel = 0
	left.Size = UDim2.new(0,1,1,0)
	local right = left:Clone()
	right.Parent = outlines
	right.Size = UDim2.new(0,-1,1,0)
	right.Position = UDim2.new(1,0,0,0)
	local up = left:Clone()
	up.Parent = outlines
	up.Size = UDim2.new(1,0,0,1)
	local down = left:Clone()
	down.Parent = outlines
	down.Size = UDim2.new(1,0,0,-1)
	down.Position = UDim2.new(0,0,1,0)
	
	local info = Instance.new("BillboardGui", bbg)
	info.Name = "info"
	info.Size = UDim2.new(3,0,0,54)
	info.StudsOffset = Vector3.new(3.6,-3,0)
	info.AlwaysOnTop = true
	info.ClipsDescendants = false
	local namelabel = Instance.new("TextLabel", info)
	namelabel.Name = "namelabel"
	namelabel.BackgroundTransparency = 1
	namelabel.TextStrokeTransparency = 0
	namelabel.TextXAlignment = Enum.TextXAlignment.Left
	namelabel.Size = UDim2.new(0,100,0,18)
	namelabel.Position = UDim2.new(0,0,0,0)
	namelabel.Text = player.Name
	local distancel = Instance.new("TextLabel", info)
	distancel.Name = "distancelabel"
	distancel.BackgroundTransparency = 1
	distancel.TextStrokeTransparency = 0
	distancel.TextXAlignment = Enum.TextXAlignment.Left
	distancel.Size = UDim2.new(0,100,0,18)
	distancel.Position = UDim2.new(0,0,0,18)
	local healthl = Instance.new("TextLabel", info)
	healthl.Name = "healthlabel"
	healthl.BackgroundTransparency = 1
	healthl.TextStrokeTransparency = 0
	healthl.TextXAlignment = Enum.TextXAlignment.Left
	healthl.Size = UDim2.new(0,100,0,18)
	healthl.Position = UDim2.new(0,0,0,36)
	
	local uill = Instance.new("UIListLayout", info)
	
	local forhealth = Instance.new("BillboardGui", bbg)
	forhealth.Name = "forhealth"
	forhealth.Size = UDim2.new(5,0,6,0)
	forhealth.AlwaysOnTop = true
	forhealth.ClipsDescendants = false
	
	local healthbar = Instance.new("Frame", forhealth)
	healthbar.Name = "healthbar"
	healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
	healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
	healthbar.Size = UDim2.new(0.04,0,0.9,0)
	healthbar.Position = UDim2.new(0,0,0.05,0)
	local bar = Instance.new("Frame", healthbar)
	bar.Name = "bar"
	bar.BorderSizePixel = 0
	bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
	bar.AnchorPoint = Vector2.new(0,1)
	bar.Position = UDim2.new(0,0,1,0)
	bar.Size = UDim2.new(1,0,1,0)
	
	local co = coroutine.create(function()
		while wait(0.1) do
			if (player.Character and player.Character:FindFirstChild"HumanoidRootPart") then
				bbg.Adornee = player.Character.HumanoidRootPart
				info.Adornee = player.Character.HumanoidRootPart
				forhealth.Adornee = player.Character.HumanoidRootPart
				
				if (player.Team ~= localplayer.Team) then
					bbg.Enabled = true
					info.Enabled = true
					forhealth.Enabled = true
				end
				if player.Character:FindFirstChild("ForceField") then
					outlines.BackgroundTransparency = 0.4
					left.BackgroundTransparency = 0.4
					right.BackgroundTransparency = 0.4
					up.BackgroundTransparency = 0.4
					down.BackgroundTransparency = 0.4
					healthl.TextTransparency = 0.4
					healthl.TextStrokeTransparency = 0.8
					distancel.TextTransparency = 0.4
					distancel.TextStrokeTransparency = 0.8
					namelabel.TextTransparency = 0.4
					namelabel.TextStrokeTransparency = 0.8
					bar.BackgroundTransparency = 0.4
					healthbar.BackgroundTransparency = 0.8
				else
					outlines.BackgroundTransparency = 0
					left.BackgroundTransparency = 0
					right.BackgroundTransparency = 0
					up.BackgroundTransparency = 0
					down.BackgroundTransparency = 0
					healthl.TextTransparency = 0
					healthl.TextStrokeTransparency = 0
					distancel.TextTransparency = 0
					distancel.TextStrokeTransparency = 0
					namelabel.TextTransparency = 0
					namelabel.TextStrokeTransparency = 0
					bar.BackgroundTransparency = 0
					healthbar.BackgroundTransparency = 0
				end
				if cheats.b_b == true then
					outlines.Visible = true
				else
					outlines.Visible = false
				end
				if cheats.b_f == true then
					if player.Character:FindFirstChild("ForceField") then
						outlines.BackgroundTransparency = 0.9
					else
						outlines.BackgroundTransparency = cheats.b_f_t
					end
				else
					outlines.BackgroundTransparency = 1
				end
				if cheats.b_sh == true then
					if (player.Character:FindFirstChild"Humanoid") then
						healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
						healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
					end
					if cheats.b_ht == "Text" then
						healthbar.Visible = false
						healthl.Visible = true
					end
					if cheats.b_ht == "Bar" then
						healthl.Visible = false
						healthbar.Visible = true
					end
					if cheats.b_ht == "Both" then
						healthl.Visible = true
						healthbar.Visible = true
					end
				else
					healthl.Visible = false
					healthbar.Visible = false
				end
				if cheats.b_sn then
					namelabel.Visible = true
				else
					namelabel.Visible = false
				end
				if cheats.b_sd == true then
					distancel.Visible = true
					if (localplayer.Character and localplayer.Character:FindFirstChild"HumanoidRootPart") then
						distancel.Text = "Distance: "..math.floor(0.5+(localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
					end
				else
					distancel.Visible = false
				end
				if cheats.b_rt == true then
					if (player.Team == localplayer.Team) then
						bbg.Enabled = true
						info.Enabled = true
						forhealth.Enabled = true
					end
				else
					if (player.Team == localplayer.Team) then
						bbg.Enabled = false
						info.Enabled = false
						forhealth.Enabled = false
					end
				end
				if cheats.b_tc == true then
					outlines.BackgroundColor3 = player.TeamColor.Color
					left.BackgroundColor3 = player.TeamColor.Color
					right.BackgroundColor3 = player.TeamColor.Color
					up.BackgroundColor3 = player.TeamColor.Color
					down.BackgroundColor3 = player.TeamColor.Color
					healthl.TextColor3 = player.TeamColor.Color
					distancel.TextColor3 = player.TeamColor.Color
					namelabel.TextColor3 = player.TeamColor.Color
				else
					if (player.Team == localplayer.Team) then
						outlines.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						left.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						right.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						up.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						down.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						healthl.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						distancel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
						namelabel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
					else
						outlines.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						left.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						right.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						up.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						down.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						healthl.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						distancel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
						namelabel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
					end
				end
			end
			if not (game:GetService"Players":FindFirstChild(player.Name)) then
				print(player.Name.." has left. Clearing esp.")
				espf:FindFirstChild(player.Name):Destroy()
				coroutine.yield()
			end
		end
	end)
	coroutine.resume(co)
end

--main
do
	wait(2)
	for _,button in pairs(age1:GetDescendants()) do
		if button:IsA"TextButton" then
			button.MouseButton1Click:connect(function()
				if button.Name == "b_f_t" then
					if cheats.b_f_t >= 0 then
						cheats.b_f_t = cheats.b_f_t+0.1
						if cheats.b_f_t > 1 then
							cheats.b_f_t = 0
						end
					end
					button.v.Text = cheats.b_f_t
				elseif button.Name == "b_ht" then
					if cheats.b_ht == "Text" then
						cheats.b_ht = "Bar"
					elseif cheats.b_ht == "Bar" then
						cheats.b_ht = "Both"
					else
						cheats.b_ht = "Text"
					end
					button.v.Text = cheats.b_ht
				else
					if cheats[button.Name] == true then
						cheats[button.Name] = false
						button.v.Text = "OFF"
						button.v.TextColor3 = Color3.fromRGB(255,0,0)
					else
						cheats[button.Name] = true
						button.v.Text = "ON"
						button.v.TextColor3 = Color3.fromRGB(0,255,0)
					end
				end	
			end)
		end
	end
	
	for _,v in pairs(game:GetService("Players"):GetChildren()) do
		if not (v.Name == localplayer.Name) then
			if not (espf:FindFirstChild(v.Name)) then
				addEsp(v)
			end
		end
	end
	
	game:GetService("UserInputService").InputBegan:connect(function(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.KeypadOne then
			if not gameProcessed then
				age1.Enabled = not age1.Enabled
			end
		end
	end)
	
	while wait(10) do
		for _,v in pairs(game:GetService("Players"):GetChildren()) do
			if not (v.Name == localplayer.Name) then
				if not (espf:FindFirstChild(v.Name)) then
					addEsp(v)
				end
			end
		end
	end
end
end)


local Button1 = Section1:CreateButton("Auto Farm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/slimethefemboy/scripts/main/kat%20autofarm", true))()
end)

local Button1 = Section1:CreateButton("No Kife Cool Down", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/NfB4Ws53", true))()
end)

local Button2 = Section2:CreateButton("Remove Water", function()
    local children = game:GetService("Workspace").WorldIgnore.DamageParts:GetChildren()

for i,v in pairs(children) do
   v:Destroy()
end


local descendants = game:GetService("Workspace").WorldIgnore.Ignore:GetDescendants()

for i,v in pairs(descendants) do
   if v.Name == "Water" then
       v:Destroy()
 
   end
   
local Descendants = game:GetService("Workspace").WorldIgnore.MapEffects:GetDescendants()
   
   for i,v in pairs(Descendants) do
       if v.Name == "WaterPosition" then
           v:Destroy()
           
       end
       
   end
end
end)

local Button2 = Section2:CreateButton("FPS Watcher ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Arth795-scripts/Luashit/main/fps"))()
end)



local Button2 = Section2:CreateButton("Speed ", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/433Sitz6", true))()
end)


local Button2 = Section2:CreateButton("No Clip", function()
   noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "e" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
end)

local Button2 = Section2:CreateButton("Fly", function()
    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 400 
local speed = 5000 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.10+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "f" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)


local Button2 = Section2:CreateButton("Chat Spam ", function()
    while true do
wait(1)
local A_1 = "Best Script Hub is Mine pick 6653 Add Me  "
local A_2 = "All"
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
Event:FireServer(A_1, A_2)
end
end)


local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)


local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)
