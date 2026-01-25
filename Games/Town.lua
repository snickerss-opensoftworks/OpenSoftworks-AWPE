--[[
	Made by Snickers (sinfulf3dd on discord)
	Custom Key System using Cloudflare so u can DDOS if u want idrc tbh, yes it uses ur HWID for ur key so u can find a bypass as i dont care lmao. Just try it out and give feedback in the server!
]]

local rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local lp = plrs.LocalPlayer
local cam = workspace.CurrentCamera

local function play_intro()
    local Lighting = game:GetService("Lighting")

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local g = Instance.new("ScreenGui")
    g.IgnoreGuiInset = true
    g.DisplayOrder = 999
    g.Parent = game.CoreGui

    local main = Instance.new("Frame")
    main.Size = UDim2.fromScale(1, 1)
    main.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    main.BorderSizePixel = 0
    main.Parent = g

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15,15,15)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35,0,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,10))
    })
    grad.Rotation = 0
    grad.Parent = main

    local title = Instance.new("TextLabel")
    title.AnchorPoint = Vector2.new(0.5, 0.5)
    title.Position = UDim2.fromScale(0.5, 0.42)
    title.Size = UDim2.fromScale(1, 0.15)
    title.BackgroundTransparency = 1
    title.Text = "AWPE"
    title.TextColor3 = Color3.fromRGB(220, 40, 40)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBlack
    title.TextTransparency = 1
    title.Parent = main

    local sub = Instance.new("TextLabel")
    sub.AnchorPoint = Vector2.new(0.5, 0.5)
    sub.Position = UDim2.fromScale(0.5, 0.53)
    sub.Size = UDim2.fromScale(1, 0.06)
    sub.BackgroundTransparency = 1
    sub.Text = "Premier Script Hub"
    sub.TextColor3 = Color3.fromRGB(200, 200, 200)
    sub.TextScaled = true
    sub.Font = Enum.Font.Gotham
    sub.TextTransparency = 1
    sub.Parent = main

    local barBack = Instance.new("Frame")
    barBack.AnchorPoint = Vector2.new(0.5, 0.5)
    barBack.Position = UDim2.fromScale(0.5, 0.63)
    barBack.Size = UDim2.fromScale(0.35, 0.012)
    barBack.BackgroundColor3 = Color3.fromRGB(25,25,25)
    barBack.BorderSizePixel = 0
    barBack.Parent = main
    Instance.new("UICorner", barBack).CornerRadius = UDim.new(1,0)

    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.fromScale(0, 1)
    barFill.BackgroundColor3 = Color3.fromRGB(220,40,40)
    barFill.BorderSizePixel = 0
    barFill.Parent = barBack
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1,0)

    local spinner = Instance.new("ImageLabel")
    spinner.AnchorPoint = Vector2.new(0.5,0.5)
    spinner.Position = UDim2.fromScale(0.5,0.70)
    spinner.Size = UDim2.fromScale(0.04,0.04)
    spinner.BackgroundTransparency = 1
    spinner.Image = "rbxassetid://3926305904"
    spinner.ImageRectOffset = Vector2.new(764,244)
    spinner.ImageRectSize = Vector2.new(36,36)
    spinner.ImageTransparency = 1
    spinner.Parent = main

    ts:Create(blur, TweenInfo.new(0.8), {Size = 18}):Play()
    ts:Create(title, TweenInfo.new(1), {TextTransparency = 0}):Play()
    ts:Create(sub, TweenInfo.new(1), {TextTransparency = 0.15}):Play()
    ts:Create(spinner, TweenInfo.new(1), {ImageTransparency = 0}):Play()

    local rotConn
    rotConn = rs.RenderStepped:Connect(function(dt)
        grad.Rotation += dt * 20
        spinner.Rotation += dt * 180
    end)

    local function loadStep(pct, t)
        ts:Create(barFill, TweenInfo.new(t, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.fromScale(pct, 1)
        }):Play()
        task.wait(t + 0.1)
    end

    loadStep(0.25, 0.6)
    loadStep(0.55, 0.7)
    loadStep(0.85, 0.6)
    loadStep(1, 0.5)

    ts:Create(main, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    ts:Create(title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    ts:Create(sub, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    ts:Create(spinner, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
    ts:Create(blur, TweenInfo.new(0.8), {Size = 0}):Play()

    task.wait(0.9)

    if rotConn then rotConn:Disconnect() end
    blur:Destroy()
    g:Destroy()
end

play_intro()

local w = rayfield:CreateWindow({
    Name = "AWPE | Premier Hub",
    LoadingTitle = "AWPE",
    LoadingSubtitle = "by SoulZXZX",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AWPE_Data"
    },
    KeySystem = true,
    KeySettings = {
        Title = "AWPE Auth",
        Subtitle = "HWID Lock",
        Note = "awpe.monyephoyn.workers.dev",
        FileName = "key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"AWPE-995A612F0EC81E7F"}
    }
})

local s = {
    a_en = false,
    a_p = "Head",
    a_f = 42,
    a_s = 2,
    a_w = false,
    a_lk = 0.15,
    e_en = false,
    spd = 16,
    jp = 50
}

local t1 = w:CreateTab("Main", 4483362458)
local t2 = w:CreateTab("Visual", 4483362458)
local t3 = w:CreateTab("Misc", 4483362458)
local t4 = w:CreateTab("Config", 4483362458)

t1:CreateSection("Aimbot")

t1:CreateToggle({
    Name = "Active",
    CurrentValue = false,
    Callback = function(v) s.a_en = v end,
})

t1:CreateDropdown({
    Name = "Target",
    Options = {"Head", "HumanoidRootPart"},
    CurrentOption = {"Head"},
    Callback = function(v) s.a_p = v[1] end,
})

t1:CreateSlider({
    Name = "Smooth",
    Range = {1, 20},
    Increment = 1,
    CurrentValue = 2,
    Callback = function(v) s.a_s = v end,
})

t1:CreateSlider({
    Name = "Lock Power",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 15,
    Callback = function(v) s.a_lk = v / 100 end,
})

t1:CreateSlider({
    Name = "FOV",
    Range = {0, 800},
    Increment = 1,
    CurrentValue = 42,
    Callback = function(v) s.a_f = v end,
})

t1:CreateToggle({
    Name = "Wall Check",
    CurrentValue = false,
    Callback = function(v) s.a_w = v end,
})

t2:CreateSection("Visuals")

t2:CreateToggle({
    Name = "ESP Master",
    CurrentValue = false,
    Callback = function(v) s.e_en = v end,
})

t3:CreateSection("Movement")

t3:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v) s.spd = v end,
})

t3:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(v) s.jp = v end,
})

t4:CreateSection("Settings Management")

t4:CreateButton({
    Name = "Save Config",
    Callback = function() rayfield:SaveConfiguration() end,
})

t4:CreateButton({
    Name = "Unload",
    Callback = function() rayfield:Destroy() end,
})

local circ = Drawing.new("Circle")
circ.Thickness = 1
circ.Color = Color3.fromRGB(200, 200, 200)
circ.Filled = false

local function get_v(p)
    if not s.a_w then return true end
    local par = RaycastParams.new()
    par.FilterType = Enum.RaycastFilterType.Exclude
    par.FilterDescendantsInstances = {lp.Character, p.Parent}
    local r = workspace:Raycast(cam.CFrame.Position, (p.Position - cam.CFrame.Position), par)
    return r == nil
end

rs.RenderStepped:Connect(function()
    circ.Radius = s.a_f
    circ.Position = uis:GetMouseLocation()
    circ.Visible = s.a_en

    if s.a_en and uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = nil
        local dist = s.a_f
        
        for _, v in pairs(plrs:GetPlayers()) do
            if v ~= lp and v.Character and v.Character:FindFirstChild(s.a_p) then
                local p = v.Character[s.a_p]
                local pos, vis = cam:WorldToViewportPoint(p.Position)
                
                if vis then
                    local m = (Vector2.new(pos.X, pos.Y) - uis:GetMouseLocation()).Magnitude
                    if m < dist and get_v(p) then 
                        target = p
                        dist = m 
                    end
                end
            end
        end

        if target then
            local goal = CFrame.new(cam.CFrame.Position, target.Position)
            local pwr = (1 / s.a_s) + s.a_lk
            cam.CFrame = cam.CFrame:Lerp(goal, math.clamp(pwr, 0, 1))
        end
    end

    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = s.spd
        lp.Character.Humanoid.JumpPower = s.jp
    end
end)

rs.Heartbeat:Connect(function()
    for _, p in pairs(plrs:GetPlayers()) do
        if p ~= lp and p.Character then
            local h = p.Character:FindFirstChild("AW_H")
            if s.e_en then
                if not h then
                    h = Instance.new("Highlight", p.Character)
                    h.Name = "AW_H"
                    h.FillColor = Color3.fromRGB(30, 30, 30)
                    h.OutlineColor = Color3.fromRGB(200, 0, 0)
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            elseif h then
                h:Destroy()
            end
        end
    end
end)
