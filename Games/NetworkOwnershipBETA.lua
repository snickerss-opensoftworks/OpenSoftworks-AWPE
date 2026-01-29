local rf=loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local ps=game:GetService("Players")
local rs=game:GetService("RunService")
local ui=game:GetService("UserInputService")
local ts=game:GetService("TweenService")
local ws=game:GetService("Workspace")
local lt=game:GetService("Lighting")
local lp=ps.LocalPlayer
local cam=ws.CurrentCamera
local m=lp:GetMouse()

if not isfile("logo.png") then
	writefile("logo.png",game:HttpGet("https://raw.githubusercontent.com/snickerss-opensoftworks/OpenSoftworks-AWPE/12c9fe559f50cc607eb0d32b46ee01c3b49ececa/Icons/formFavicon.png"))
end
local logo=getcustomasset("logo.png")

local function intro()
	local bl=Instance.new("BlurEffect",lt)
	bl.Size=0
	local g=Instance.new("ScreenGui",game.CoreGui)
	g.IgnoreGuiInset=true
	g.DisplayOrder=999

	local bg=Instance.new("Frame",g)
	bg.Size=UDim2.fromScale(1,1)
	bg.BackgroundColor3=Color3.fromRGB(12,12,12)
	bg.BackgroundTransparency=1

	local im=Instance.new("ImageLabel",bg)
	im.AnchorPoint=Vector2.new(.5,.5)
	im.Position=UDim2.fromScale(.5,.45)
	im.Size=UDim2.fromScale(.16,.16)
	im.BackgroundTransparency=1
	im.Image=logo
	im.ImageTransparency=1

	local tx=Instance.new("TextLabel",bg)
	tx.AnchorPoint=Vector2.new(.5,.5)
	tx.Position=UDim2.fromScale(.5,.58)
	tx.Size=UDim2.fromScale(1,.06)
	tx.BackgroundTransparency=1
	tx.Text="AWPE"
	tx.Font=Enum.Font.GothamMedium
	tx.TextScaled=true
	tx.TextColor3=Color3.fromRGB(220,220,220)
	tx.TextTransparency=1

	local bb=Instance.new("Frame",g)
	bb.AnchorPoint=Vector2.new(.5,.5)
	bb.Position=UDim2.fromScale(.5,.66)
	bb.Size=UDim2.fromScale(.32,.012)
	bb.BackgroundColor3=Color3.fromRGB(28,28,28)
	bb.BackgroundTransparency=1
	Instance.new("UICorner",bb).CornerRadius=UDim.new(1,0)

	local bf=Instance.new("Frame",bb)
	bf.Size=UDim2.fromScale(0,1)
	bf.BackgroundColor3=Color3.fromRGB(200,200,200)
	Instance.new("UICorner",bf).CornerRadius=UDim.new(1,0)

	ts:Create(bl,TweenInfo.new(.6),{Size=16}):Play()
	ts:Create(bg,TweenInfo.new(.5),{BackgroundTransparency=0}):Play()
	ts:Create(bb,TweenInfo.new(.5),{BackgroundTransparency=0}):Play()
	ts:Create(im,TweenInfo.new(.6),{ImageTransparency=0}):Play()
	ts:Create(tx,TweenInfo.new(.6),{TextTransparency=.15}):Play()

	for _,v in ipairs({.25,.5,.75,1}) do
		ts:Create(bf,TweenInfo.new(.45),{Size=UDim2.fromScale(v,1)}):Play()
		task.wait(.48)
	end

	ts:Create(bg,TweenInfo.new(.4),{BackgroundTransparency=1}):Play()
	ts:Create(bb,TweenInfo.new(.4),{BackgroundTransparency=1}):Play()
	ts:Create(im,TweenInfo.new(.35),{ImageTransparency=1}):Play()
	ts:Create(tx,TweenInfo.new(.35),{TextTransparency=1}):Play()
	ts:Create(bl,TweenInfo.new(.45),{Size=0}):Play()
	task.wait(.5)
	g:Destroy()
	bl:Destroy()
end

intro()

local a=1
local r=10
local e=false
local s=2
local y=0
local h=true
local tgt=lp
local st=nil

if not getgenv().net then
	getgenv().net={p={},v=Vector3.new(14.4626,14.4626,14.4626)}
	rs.Heartbeat:Connect(function()
		sethiddenproperty(lp,"SimulationRadius",math.huge)
		for _,v in pairs(getgenv().net.p) do
			if v and v:IsDescendantOf(ws) and not v.Anchored then
				v.Velocity=getgenv().net.v
			end
		end
	end)
end

local function mk()
	local f=Instance.new("Folder",ws)
	local p=Instance.new("Part",f)
	local at=Instance.new("Attachment",p)
	p.Anchored=true
	p.CanCollide=true
	p.CanTouch=false
	p.CanQuery=false
	p.Massless=true
	p.Transparency=1
	p.Size=Vector3.new(2,2,2)
	return p,at
end

local anchor,att=mk()

local function nocoll(a,b)
	for _,x in pairs(a:GetDescendants()) do
		if x:IsA("BasePart") then
			for _,y in pairs(b:GetDescendants()) do
				if y:IsA("BasePart") then
					pcall(function() x:CanCollideWith(y,false) end)
				end
			end
		end
	end
end

local function ok(p)
	if p:IsDescendantOf(lp.Character) then return false end
	if st and st.Character and p:IsDescendantOf(st.Character) then return false end
	for _,pl in pairs(ps:GetPlayers()) do
		if pl.Character and p:IsDescendantOf(pl.Character) then return false end
	end
	return p:IsA("BasePart") and not p.Anchored
end

local function inj(p)
	if ok(p) then
		for _,v in pairs(p:GetChildren()) do
			if v:IsA("AlignPosition") or v:IsA("Torque") or v:IsA("Highlight") then v:Destroy() end
		end
		local a0=Instance.new("Attachment",p)
		local tq=Instance.new("Torque",p)
		tq.Torque=Vector3.new(1e6,1e6,1e6)
		tq.Attachment0=a0
		local ap=Instance.new("AlignPosition",p)
		ap.MaxForce=math.huge
		ap.MaxVelocity=math.huge
		ap.Responsiveness=500
		ap.Attachment0=a0
		ap.Attachment1=att
		if h then Instance.new("Highlight",p).FillTransparency=.5 end
		table.insert(getgenv().net.p,p)
	end
end

rs.RenderStepped:Connect(function()
	if not e then return end
	a=a+math.rad(s)
	local rt=tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart")
	if rt then
		att.WorldCFrame=rt.CFrame*CFrame.new(math.cos(a)*r,y,math.sin(a)*r)
	end
end)

local w=rf:CreateWindow({
	Name="AWPE | Premier Hub",
	Theme="Dark",
	ToggleUIKeybind=Enum.KeyCode.RightShift,
	LoadingTitle="AWPE",
	LoadingSubtitle="Authenticated",
	ConfigurationSaving={Enabled=true,FolderName="AWPE_Data"},
	KeySystem=true,
	KeySettings={
		Title="AWPE Auth",
		Subtitle="HWID Lock",
		Note="awpe.monyephoyn.workers.dev",
		FileName="key",
		SaveKey=true,
		GrabKeyFromSite=false,
		Key={"AWPE-995A612F0EC81E7F"}
	}
})

local tb=w:CreateTab("Blackhole",4483362458)
local tv=w:CreateTab("Visuals",4483362458)
local tu=w:CreateTab("Utility",4483362458)
local tc=w:CreateTab("Config",4483362458)
local ti=w:CreateTab("UI",4483362458)

tb:CreateToggle({Name="Enabled",CurrentValue=false,Callback=function(v)
	e=v
	if e then for _,x in pairs(ws:GetDescendants()) do inj(x) end end
end})

tb:CreateSlider({Name="Radius",Range={1,1000000},Increment=1,CurrentValue=10,Callback=function(v) r=v end})
tb:CreateSlider({Name="Orbit Speed",Range={1,1000000},Increment=1,CurrentValue=2,Callback=function(v) s=v end})
tb:CreateSlider({Name="Y Offset",Range={-1000000,1000000},Increment=1,CurrentValue=0,Callback=function(v) y=v end})

tv:CreateToggle({Name="Highlights",CurrentValue=true,Callback=function(v) h=v end})

tu:CreateButton({Name="Rescan Parts",Callback=function()
	for _,x in pairs(ws:GetDescendants()) do inj(x) end
end})

local tp=game:GetService("TeleportService")
local hs=game:GetService("HttpService")
local pid=game.PlaceId
local jid=game.JobId

tu:CreateButton({Name="Rejoin",Callback=function()
	tp:TeleportToPlaceInstance(pid,jid,lp)
end})

tu:CreateButton({Name="Serverhop",Callback=function()
	local r=hs:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..pid.."/servers/Public?sortOrder=Asc&limit=100"))
	for _,v in pairs(r.data) do
		if v.playing<v.maxPlayers and v.id~=jid then
			tp:TeleportToPlaceInstance(pid,v.id,lp)
			break
		end
	end
end})

tc:CreateButton({Name="Save Config",Callback=function() rf:SaveConfiguration() end})
tc:CreateButton({Name="Unload",Callback=function() rf:Destroy() end})

ti:CreateDropdown({
	Name="Theme",
	Options={"Dark","Light","Ocean","Amber","Green","Red"},
	CurrentOption={"Dark"},
	Callback=function(v) pcall(function() rf:ChangeTheme(v[1]) end) end
})
