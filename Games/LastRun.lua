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
local tps = game:GetService("TeleportService")
local hs = game:GetService("HttpService")

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
    ag = false,
    gm = false,
    th = "Dark"
}

local t1 = w:CreateTab("Auto Gold", "coins")
local t2 = w:CreateTab("Gun Mod", "crosshair")
local t3 = w:CreateTab("Settings", "settings")

t1:CreateSection("Farming")
t1:CreateToggle({
    Name = "Enable Auto Gold",
    CurrentValue = false,
    Callback = function(v) s.ag = v end
})

t2:CreateSection("Weapon Mods")
t2:CreateToggle({
    Name = "Enable OP Gun Mod",
    CurrentValue = false,
    Callback = function(v) s.gm = v end
})

t3:CreateSection("Interface")
t3:CreateDropdown({
    Name = "Theme",
    Options = {"Dark","Light","Ocean","Amber","Green","Red"},
    CurrentOption = {"Dark"},
    Callback = function(v)
        s.th = v[1]
        pcall(function() rf:ChangeTheme(s.th) end)
    end
})
t3:CreateButton({Name = "Save Config", Callback = function() rf:SaveConfiguration() end})
t3:CreateButton({Name = "Unload Hub", Callback = function() rf:Destroy() end})

local function jump()
    local h = lp.Character and lp.Character:FindFirstChildWhichIsA("Humanoid")
    if h and h.Sit then h.Jump = true end
end

local function hop()
    local ok, res = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    end)
    if ok then
        local d = hs:JSONDecode(res)
        local srvs = {}
        for _, v in pairs(d.data) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                table.insert(srvs, v.id)
            end
        end
        if #srvs > 0 then
            tps:TeleportToPlaceInstance(game.PlaceId, srvs[math.random(1, #srvs)])
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        if s.gm then
            jump()
            local function mod(t)
                if t:IsA("Tool") then
                    t:SetAttribute("ammo", math.huge)
                    t:SetAttribute("damage", math.huge)
                    t:SetAttribute("fireMode", "Auto")
                    t:SetAttribute("recoilMax", Vector2.new(0, 0))
                    t:SetAttribute("recoilMin", Vector2.new(0, 0))
                    t:SetAttribute("rateOfFire", 0)
                end
            end
            if lp.Character then for _, t in pairs(lp.Character:GetChildren()) do mod(t) end end
            if lp:FindFirstChild("Backpack") then for _, t in pairs(lp.Backpack:GetChildren()) do mod(t) end end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if s.ag then
            local g_f = workspace:FindFirstChild("GoldBars")
            if g_f then
                for _, b in ipairs(g_f:GetChildren()) do
                    if not s.ag then break end
                    local cf = nil
                    if b:IsA("BasePart") then cf = b.CFrame
                    elseif b:IsA("Model") then cf = b:GetModelCFrame() end
                    
                    if cf and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                        jump()
                        local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
                        local tw = ts:Create(lp.Character.HumanoidRootPart, ti, {CFrame = cf})
                        tw:Play()
                        tw.Completed:Wait()
                        task.wait(0.1)
                        local p = b:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if p then fireproximityprompt(p) end
                        jump()
                        task.wait(0.4)
                    end
                end
            end
            if s.ag then hop() end
        end
    end
end)
