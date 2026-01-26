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
local rep = game:GetService("ReplicatedStorage")

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
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    LoadingTitle = "AWPE",
    LoadingSubtitle = "by SoulZXZX",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AWPE_Data",
        FileName = "config"
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
    spd = 16,
    jp = 50
}

local t1 = w:CreateTab("general", 4483362458)
local t2 = w:CreateTab("blocks", 4483362458)
local t3 = w:CreateTab("armor", 4483362458)
local t4 = w:CreateTab("audio", 4483362458)
local t5 = w:CreateTab("misc", 4483362458)

t1:CreateSection("movement")

t1:CreateSlider({
    Name = "walkspeed",
    Range = {16, 250},
    Increment = 1,
    CurrentValue = 16,
    Flag = "ws_flag",
    Callback = function(v)
        s.spd = v
    end
})

t1:CreateSlider({
    Name = "jumppower",
    Range = {50, 500},
    Increment = 1,
    CurrentValue = 50,
    Flag = "jp_flag",
    Callback = function(v)
        s.jp = v
    end
})

t2:CreateSection("spawns")

t2:CreateButton({
    Name = "superblock",
    Callback = function()
        rep.SpawnSuperBlock:FireServer()
    end
})

t2:CreateButton({
    Name = "diamondblock",
    Callback = function()
        rep.SpawnDiamondBlock:FireServer()
    end
})

t2:CreateButton({
    Name = "gayblock <3",
    Callback = function()
        rep.SpawnRainbowBlock:FireServer()
    end
})

t2:CreateButton({
    Name = "galaxyblock",
    Callback = function()
        rep.SpawnGalaxyBlock:FireServer()
    end
})

local function give_armor(p, n)
    local char = lp.Character
    local src = lt.Armor:FindFirstChild(n)
    if not char or not src then return end
    local old = nil
    for _, obj in pairs(char:GetChildren()) do
        if obj.Name == p and obj:IsA("BasePart") then
            old = obj
            break
        end
    end
    if old then
        local new = src:Clone()
        new.Name = p
        new.CFrame = old.CFrame
        new.Parent = char
        for _, m in pairs(char:GetDescendants()) do
            if m:IsA("Motor6D") then
                if m.Part1 == old then
                    m.Part1 = new
                elseif m.Part0 == old then
                    m.Part0 = new
                end
            end
        end
        old:Destroy()
    end
end

t3:CreateSection("purplebot")

local list = {
    {"PurpleBot Left Arm", "Left Arm"},
    {"PurpleBot Right Arm", "Right Arm"},
    {"PurpleBot Left Leg", "Left Leg"},
    {"PurpleBot Right Leg", "Right Leg"},
    {"PurpleBot Torso", "Torso"}
}

for _, v in pairs(list) do
    t3:CreateButton({
        Name = v[1],
        Callback = function()
            give_armor(v[2], v[1])
        end
    })
end

t4:CreateSection("sounds")

t4:CreateButton({
    Name = "ding",
    Callback = function()
        workspace.Ding:Play()
    end
})

t4:CreateButton({
    Name = "hit",
    Callback = function()
        rep.LegacyModules["191816425"].Contents.DeathSummonerStaff.NPCs.GhastlyGhoul.Torso.HitSound:Play()
    end
})

t5:CreateSection("tags")

local tags = {
    {"luckytag", "lucky_tag"},
    {"supertag", "super_tag"},
    {"diamondtag", "diamond_tag"},
    {"rainbowtag", "rainbow_tag"},
    {"galaxytag", "galaxy_tag"}
}

for _, v in pairs(tags) do
    t5:CreateSlider({
        Name = v[1],
        Range = {0, 1000000},
        Increment = 1,
        CurrentValue = 0,
        Flag = "tag_"..v[2],
        Callback = function(val)
            local obj = lp:FindFirstChild(v[2])
            if obj then
                obj.Value = val
            end
        end
    })
end

t5:CreateSection("promos")

t5:CreateButton({
    Name = "autopromo (betaa)",
    Callback = function()
        rf:Notify({
            Title = "promo",
            Content = "checking betaa codes",
            Duration = 3
        })
    end
})

rs.RenderStepped:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = s.spd
        lp.Character.Humanoid.JumpPower = s.jp
    end
end)

rf:LoadConfiguration()
