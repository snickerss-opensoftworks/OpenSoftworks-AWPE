--[[
    Made by Snickers (sinfulf3dd on discord)
    Custom Key System using Cloudflare so u can DDOS if u want idrc tbh, yes it uses ur HWID for ur key so u can find a bypass as i dont care lmao. Just try it out and give feedback in the server!
]]

local rf = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local lp = plrs.LocalPlayer
local cam = workspace.CurrentCamera
local lt = game:GetService("Lighting")

if not isfile("logo.png") then
    local img = game:HttpGet("https://raw.githubusercontent.com/snickerss-opensoftworks/OpenSoftworks-AWPE/12c9fe559f50cc607eb0d32b46ee01c3b49ececa/Icons/formFavicon.png")
    writefile("logo.png", img)
end

local logo = getcustomasset("logo.png")

local function intro()
    local bl = Instance.new("BlurEffect")
    bl.Size = 0
    bl.Parent = lt

    local g = Instance.new("ScreenGui")
    g.IgnoreGuiInset = true
    g.DisplayOrder = 999
    g.Parent = game.CoreGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1,1)
    bg.BackgroundColor3 = Color3.fromRGB(12,12,12)
    bg.BorderSizePixel = 0
    bg.BackgroundTransparency = 1
    bg.Parent = g

    local img = Instance.new("ImageLabel")
    img.AnchorPoint = Vector2.new(0.5,0.5)
    img.Position = UDim2.fromScale(0.5,0.45)
    img.Size = UDim2.fromScale(0.16,0.16)
    img.BackgroundTransparency = 1
    img.Image = logo
    img.ImageTransparency = 1
    img.Parent = bg

    local txt = Instance.new("TextLabel")
    txt.AnchorPoint = Vector2.new(0.5,0.5)
    txt.Position = UDim2.fromScale(0.5,0.58)
    txt.Size = UDim2.fromScale(1,0.06)
    txt.BackgroundTransparency = 1
    txt.Text = "AWPE"
    txt.Font = Enum.Font.GothamMedium
    txt.TextScaled = true
    txt.TextColor3 = Color3.fromRGB(220,220,220)
    txt.TextTransparency = 1
    txt.Parent = bg

    local bb = Instance.new("Frame")
    bb.AnchorPoint = Vector2.new(0.5,0.5)
    bb.Position = UDim2.fromScale(0.5,0.66)
    bb.Size = UDim2.fromScale(0.32,0.012)
    bb.BackgroundColor3 = Color3.fromRGB(28,28,28)
    bb.BorderSizePixel = 0
    bb.BackgroundTransparency = 1
    bb.Parent = g
    Instance.new("UICorner", bb).CornerRadius = UDim.new(1,0)

    local bf = Instance.new("Frame")
    bf.Size = UDim2.fromScale(0,1)
    bf.BackgroundColor3 = Color3.fromRGB(200,200,200)
    bf.BorderSizePixel = 0
    bf.Parent = bb
    Instance.new("UICorner", bf).CornerRadius = UDim.new(1,0)

    ts:Create(bl, TweenInfo.new(0.6), {Size = 16}):Play()
    ts:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    ts:Create(bb, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    ts:Create(img, TweenInfo.new(0.6), {ImageTransparency = 0}):Play()
    ts:Create(txt, TweenInfo.new(0.6), {TextTransparency = 0.15}):Play()

    local function step(v,t)
        ts:Create(bf, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.fromScale(v,1)
        }):Play()
        task.wait(t + 0.08)
    end

    step(0.25,0.5)
    step(0.5,0.55)
    step(0.75,0.45)
    step(1,0.4)

    ts:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    ts:Create(bb, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    ts:Create(img, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()
    ts:Create(txt, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    ts:Create(bl, TweenInfo.new(0.5), {Size = 0}):Play()

    task.wait(0.55)
    bl:Destroy()
    g:Destroy()
end

intro()

local w = rf:CreateWindow({
    Name = "AWPE | Premier Hub",
    Theme = "Dark",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
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
    ae = false,
    ap = "Head",
    af = 42,
    as = 2,
    aw = false,
    alk = 0.15,
    ep = false,
    spd = 16,
    jp = 50,
    th = "Dark"
}

local t1 = w:CreateTab("Main", 4483362458)
local t2 = w:CreateTab("Visual", 4483362458)
local t3 = w:CreateTab("Misc", 4483362458)
local t4 = w:CreateTab("Config", 4483362458)
local t5 = w:CreateTab("UI", 4483362458)

t1:CreateSection("Aimbot")
t1:CreateToggle({Name="Active",CurrentValue=false,Callback=function(v) s.ae=v end})
t1:CreateDropdown({Name="Target",Options={"Head","HumanoidRootPart"},CurrentOption={"Head"},Callback=function(v) s.ap=v[1] end})
t1:CreateSlider({Name="Smooth",Range={1,20},Increment=1,CurrentValue=2,Callback=function(v) s.as=v end})
t1:CreateSlider({Name="Lock Power",Range={0,100},Increment=1,CurrentValue=15,Callback=function(v) s.alk=v/100 end})
t1:CreateSlider({Name="FOV",Range={0,800},Increment=1,CurrentValue=42,Callback=function(v) s.af=v end})
t1:CreateToggle({Name="Wall Check",CurrentValue=false,Callback=function(v) s.aw=v end})

t2:CreateSection("Visuals")
t2:CreateToggle({Name="ESP Master",CurrentValue=false,Callback=function(v) s.ep=v end})

t3:CreateSection("Movement")
t3:CreateSlider({Name="Walkspeed",Range={16,250},Increment=1,CurrentValue=16,Callback=function(v) s.spd=v end})
t3:CreateSlider({Name="JumpPower",Range={50,500},Increment=1,CurrentValue=50,Callback=function(v) s.jp=v end})

t4:CreateSection("Settings")
t4:CreateButton({Name="Save Config",Callback=function() rf:SaveConfiguration() end})
t4:CreateButton({Name="Unload",Callback=function() rf:Destroy() end})

t5:CreateSection("Interface")
t5:CreateDropdown({
    Name = "Theme",
    Options = {"Dark","Light","Ocean","Amber","Green","Red"},
    CurrentOption = {"Dark"},
    Callback = function(v)
        s.th = v[1]
        pcall(function()
            rf:ChangeTheme(s.th)
        end)
    end
})

local circ = Drawing.new("Circle")
circ.Thickness = 1
circ.Color = Color3.fromRGB(200,200,200)
circ.Filled = false

local function vis(p)
    if not s.aw then return true end
    local par = RaycastParams.new()
    par.FilterType = Enum.RaycastFilterType.Exclude
    par.FilterDescendantsInstances = {lp.Character, p.Parent}
    local r = workspace:Raycast(cam.CFrame.Position, (p.Position - cam.CFrame.Position), par)
    return r == nil
end

rs.RenderStepped:Connect(function()
    circ.Radius = s.af
    circ.Position = uis:GetMouseLocation()
    circ.Visible = s.ae

    if s.ae and uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local tg = nil
        local d = s.af

        for _,v in pairs(plrs:GetPlayers()) do
            if v ~= lp and v.Character and v.Character:FindFirstChild(s.ap) then
                local p = v.Character[s.ap]
                local pos,ok = cam:WorldToViewportPoint(p.Position)
                if ok then
                    local m = (Vector2.new(pos.X,pos.Y) - uis:GetMouseLocation()).Magnitude
                    if m < d and vis(p) then
                        tg = p
                        d = m
                    end
                end
            end
        end

        if tg then
            local g = CFrame.new(cam.CFrame.Position, tg.Position)
            local pw = (1 / s.as) + s.alk
            cam.CFrame = cam.CFrame:Lerp(g, math.clamp(pw,0,1))
        end
    end

    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = s.spd
        lp.Character.Humanoid.JumpPower = s.jp
    end
end)

rs.Heartbeat:Connect(function()
    for _,p in pairs(plrs:GetPlayers()) do
        if p ~= lp and p.Character then
            local h = p.Character:FindFirstChild("aw_h")
            if s.ep then
                if not h then
                    h = Instance.new("Highlight", p.Character)
                    h.Name = "aw_h"
                    h.FillColor = Color3.fromRGB(35,35,35)
                    h.OutlineColor = Color3.fromRGB(180,180,180)
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            elseif h then
                h:Destroy()
            end
        end
    end
end)
