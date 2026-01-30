local rf = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local ps = game:GetService("Players")
local rs = game:GetService("RunService")
local ui = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local ws = game:GetService("Workspace")
local lt = game:GetService("Lighting")
local lp = ps.LocalPlayer
local cam = ws.CurrentCamera
local m = lp:GetMouse()

if not isfile("logo.png") then
    writefile("logo.png",game:HttpGet("https://raw.githubusercontent.com/snickerss-opensoftworks/OpenSoftworks-AWPE/12c9fe559f50cc607eb0d32b46ee01c3b49ececa/Icons/formFavicon.png"))
end
local logo = getcustomasset("logo.png")

local function play_intro()
    local blur_effect = Instance.new("BlurEffect",lt)
    blur_effect.Size = 0
    local gui = Instance.new("ScreenGui",game.CoreGui)
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999

    local bg_frame = Instance.new("Frame",gui)
    bg_frame.Size = UDim2.fromScale(1,1)
    bg_frame.BackgroundColor3 = Color3.fromRGB(12,12,12)
    bg_frame.BackgroundTransparency = 1

    local logo_img = Instance.new("ImageLabel",bg_frame)
    logo_img.AnchorPoint = Vector2.new(.5,.5)
    logo_img.Position = UDim2.fromScale(.5,.45)
    logo_img.Size = UDim2.fromScale(.16,.16)
    logo_img.BackgroundTransparency = 1
    logo_img.Image = logo
    logo_img.ImageTransparency = 1

    local title_text = Instance.new("TextLabel",bg_frame)
    title_text.AnchorPoint = Vector2.new(.5,.5)
    title_text.Position = UDim2.fromScale(.5,.58)
    title_text.Size = UDim2.fromScale(1,.06)
    title_text.BackgroundTransparency = 1
    title_text.Text = "AWPE"
    title_text.Font = Enum.Font.GothamMedium
    title_text.TextScaled = true
    title_text.TextColor3 = Color3.fromRGB(220,220,220)
    title_text.TextTransparency = 1

    local bar_back = Instance.new("Frame",gui)
    bar_back.AnchorPoint = Vector2.new(.5,.5)
    bar_back.Position = UDim2.fromScale(.5,.66)
    bar_back.Size = UDim2.fromScale(.32,.012)
    bar_back.BackgroundColor3 = Color3.fromRGB(28,28,28)
    bar_back.BackgroundTransparency = 1
    Instance.new("UICorner",bar_back).CornerRadius = UDim.new(1,0)

    local bar_fill = Instance.new("Frame",bar_back)
    bar_fill.Size = UDim2.fromScale(0,1)
    bar_fill.BackgroundColor3 = Color3.fromRGB(200,200,200)
    Instance.new("UICorner",bar_fill).CornerRadius = UDim.new(1,0)

    ts:Create(blur_effect,TweenInfo.new(.6),{Size = 16}):Play()
    ts:Create(bg_frame,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
    ts:Create(bar_back,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
    ts:Create(logo_img,TweenInfo.new(.6),{ImageTransparency = 0}):Play()
    ts:Create(title_text,TweenInfo.new(.6),{TextTransparency = .15}):Play()

    for _,v in ipairs({.25,.5,.75,1}) do
        ts:Create(bar_fill,TweenInfo.new(.45),{Size = UDim2.fromScale(v,1)}):Play()
        task.wait(.48)
    end

    ts:Create(bg_frame,TweenInfo.new(.4),{BackgroundTransparency = 1}):Play()
    ts:Create(bar_back,TweenInfo.new(.4),{BackgroundTransparency = 1}):Play()
    ts:Create(logo_img,TweenInfo.new(.35),{ImageTransparency = 1}):Play()
    ts:Create(title_text,TweenInfo.new(.35),{TextTransparency = 1}):Play()
    ts:Create(blur_effect,TweenInfo.new(.45),{Size = 0}):Play()
    task.wait(.5)
    gui:Destroy()
    blur_effect:Destroy()
end

play_intro()

local angle = 1
local radius = 10
local enabled = false
local speed = 2
local y_offset = 0
local show_highlights = true
local target_obj = lp
local sub_target = nil 

if not getgenv().net then
    getgenv().net = {p = {}, v = Vector3.new(14.4626, 14.4626, 14.4626)}
    rs.Heartbeat:Connect(function()
        sethiddenproperty(lp, "SimulationRadius", math.huge)
        for _, v in pairs(getgenv().net.p) do
            if v and v:IsDescendantOf(ws) and not v.Anchored then
                v.Velocity = getgenv().net.v
                v.CanCollide = false 
            end
        end
    end)
end

local function make_anchor()
    local folder = Instance.new("Folder", ws)
    local part = Instance.new("Part", folder)
    local attach = Instance.new("Attachment", part)
    part.Name = "AWPE_Anchor"
    part.Anchored = true
    part.CanCollide = false
    part.CanTouch = false
    part.CanQuery = false
    part.Massless = true
    part.Transparency = 1
    part.Size = Vector3.new(2, 2, 2)
    return part, attach
end

local anchor_part, anchor_attach = make_anchor()

local function is_valid_part(p)
    if not p:IsA("BasePart") or p.Anchored then return false end
    if p:IsDescendantOf(lp.Character) then return false end
    if sub_target and sub_target.Character and p:IsDescendantOf(sub_target.Character) then return false end
    if p:FindFirstAncestorOfClass("Tool") or p:FindFirstAncestorOfClass("Seat") or p:FindFirstAncestorOfClass("VehicleSeat") then return false end
    if p:IsA("Seat") or p:IsA("VehicleSeat") or p.Name == "Handle" then return false end
    return true
end

local function inject_physics(p)
    if is_valid_part(p) then
        for _, v in pairs(p:GetChildren()) do
            if v:IsA("AlignPosition") or v:IsA("Torque") or v:IsA("Highlight") then v:Destroy() end
        end
        p.CanCollide = false
        local att0 = Instance.new("Attachment", p)
        local torque = Instance.new("Torque", p)
        torque.Torque = Vector3.new(1e6, 1e6, 1e6)
        torque.Attachment0 = att0
        local align_pos = Instance.new("AlignPosition", p)
        align_pos.MaxForce = math.huge
        align_pos.MaxVelocity = math.huge
        align_pos.Responsiveness = 500
        align_pos.Attachment0 = att0
        align_pos.Attachment1 = anchor_attach
        if show_highlights then 
            local high = Instance.new("Highlight", p)
            high.FillTransparency = .5
        end
        table.insert(getgenv().net.p, p)
    end
end

local function get_player(str)
    for _, v in pairs(ps:GetPlayers()) do
        if v.Name:lower():sub(1, #str) == str:lower() or v.DisplayName:lower():sub(1, #str) == str:lower() then
            return v
        end
    end
end

lp.Chatted:Connect(function(msg)
    local args = msg:split(" ")
    if args[1] == "/bring" then
        target_obj = lp
        sub_target = nil
        rf:Notify({Title = "Blackhole", Content = "Bringing parts to self", Duration = 2})
    elseif args[1] == "/transfer" and args[2] then
        local p = get_player(args[2])
        if p then
            target_obj = p
            sub_target = p
            rf:Notify({Title = "Blackhole", Content = "Transferred to " .. p.Name, Duration = 2})
        end
    elseif args[1] == "/bringp" and args[2] then
        local p = get_player(args[2])
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local my_hrp = lp.Character.HumanoidRootPart
            local body_vel = Instance.new("BodyVelocity", hrp)
            body_vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            body_vel.Velocity = (my_hrp.Position - hrp.Position).Unit * 150
            task.wait(0.5)
            body_vel:Destroy()
            rf:Notify({Title = "Utility", Content = "Bringing Player: " .. p.Name, Duration = 2})
        end
    end
end)

m.Button1Down:Connect(function()
    if m.Target then
        local character_model = m.Target:FindFirstAncestorOfClass("Model")
        local player_found = character_model and ps:GetPlayerFromCharacter(character_model)
        if player_found and player_found ~= lp then
            target_obj = player_found
            sub_target = player_found
            task.delay(3, function()
                if target_obj == player_found then
                    target_obj = lp
                    sub_target = nil
                end
            end)
        end
    end
end)

rs.RenderStepped:Connect(function()
    if not enabled then return end
    angle = angle + math.rad(speed)
    local root = target_obj.Character and target_obj.Character:FindFirstChild("HumanoidRootPart")
    if root then
        anchor_attach.WorldCFrame = root.CFrame * CFrame.new(math.cos(angle) * radius, y_offset, math.sin(angle) * radius)
    end
end)

local win = rf:CreateWindow({
    Name = "AWPE | Premier Hub",
    Theme = "Dark",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    LoadingTitle = "AWPE",
    LoadingSubtitle = "Authenticated",
    ConfigurationSaving = {Enabled = true, FolderName = "AWPE_Data"},
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

local tab_blackhole = win:CreateTab("Blackhole", 4483362458)
local tab_utility = win:CreateTab("Utility", 4483362458)

tab_blackhole:CreateToggle({
    Name = "Enabled",
    CurrentValue = false,
    Callback = function(v)
        enabled = v
        if enabled then for _, x in pairs(ws:GetDescendants()) do inject_physics(x) end end
    end
})

tab_blackhole:CreateInput({Name = "Radius", PlaceholderText = "10", RemoveTextAfterFocusLost = false, Callback = function(v) radius = tonumber(v) or radius end})
tab_blackhole:CreateInput({Name = "Orbit Speed", PlaceholderText = "2", RemoveTextAfterFocusLost = false, Callback = function(v) speed = tonumber(v) or speed end})
tab_blackhole:CreateInput({Name = "Y Offset", PlaceholderText = "0", RemoveTextAfterFocusLost = false, Callback = function(v) y_offset = tonumber(v) or y_offset end})

tab_utility:CreateSection("Commands (Chat)")
tab_utility:CreateLabel("/bring - Bring parts to you")
tab_utility:CreateLabel("/transfer [user] - Orbit player")
tab_utility:CreateLabel("/bringp [user] - Pull player to you")

tab_utility:CreateButton({Name = "Rescan Parts", Callback = function() for _, x in pairs(ws:GetDescendants()) do inject_physics(x) end end})
tab_utility:CreateButton({Name = "Rejoin", Callback = function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp) end})
