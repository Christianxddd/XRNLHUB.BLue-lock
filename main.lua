
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({

    Title = "XRNL HUB | INK GAME",

    Icon = "cat",

    Author = "https://www.instagram.com/roseb_astian/",

    Folder = "RONALDO",

})


Window:EditOpenButton({

    Title = "Open XRNL-HUB",

    Icon = "cat",

    CornerRadius = UDim.new(0,20),

    StrokeThickness = 2,

    Color = ColorSequence.new( -- gradient

        Color3.fromHex("FF0F7B"), 

        Color3.fromHex("F89B29")

    ),

    OnlyMobile = false,

    Enabled = true,

    Draggable = true,

})


Window:Tag({

    Title = "v2.8.6",

    Color = Color3.fromHex("#30ff6a")

})


-----------------------------------------------------------
-- 🟦 PESTAÑA: MAIN
-----------------------------------------------------------
local Main = Window:CreateTab("⚡ Main")

Main:CreateButton({
    Name = "Stamina Infinita",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local stamina = char:FindFirstChild("Stamina") or player:FindFirstChild("Stamina")
        if stamina then
            stamina:GetPropertyChangedSignal("Value"):Connect(function()
                stamina.Value = stamina.MaxValue
            end)
            stamina.Value = stamina.MaxValue
        end
    end
})

Main:CreateButton({
    Name = "Stamina Infinita",
    Callback = function()
        local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
local o = C.AbilityCooldown

C.AbilityCooldown = function(s, n, ...)
    return o(s, n, 0, ...)
end
})

Main:CreateButton({
    Name = "Auto Shoot (Mantener clic)",
    Callback = function()
        -- Ejemplo de auto shoot (depende del nombre de la skill en el juego)
        local UIS = game:GetService("UserInputService")
        UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                game:GetService("ReplicatedStorage").Shoot:FireServer()
            end
        end)
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: PLAYER
-----------------------------------------------------------
local PlayerTab = Window:CreateTab("🏃 Player")

PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

PlayerTab:CreateSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

PlayerTab:CreateButton({
    Name = "No Stun",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char:FindFirstChild("Stun") then
            char.Stun:Destroy()
        end
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: TELEPORTS
-----------------------------------------------------------
local TP = Window:CreateTab("📍 Teleports")

TP:CreateButton({
    Name = "TP a la Pelota",
    Callback = function()
        local ball = workspace:FindFirstChild("SoccerBall") or workspace:FindFirstChild("Ball")
        if ball then
            game.Players.LocalPlayer.Character:MoveTo(ball.Position + Vector3.new(0,3,0))
        end
    end
})

TP:CreateDropdown({
    Name = "Teleport a Jugador",
    Options = (function()
        local players = {}
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer then
                table.insert(players, p.Name)
            end
        end
        return players
    end)(),
    Callback = function(selected)
        local target = game.Players:FindFirstChild(selected)
        if target and target.Character then
            game.Players.LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0,3,0))
        end
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: VISUALS
-----------------------------------------------------------
local Visuals = Window:CreateTab("👁 Visuals")

Visuals:CreateToggle({
    Name = "ESP Jugadores",
    Default = false,
    Callback = function(state)
        for _,plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = plr.Character
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
                else
                    if plr.Character:FindFirstChild("Highlight") then
                        plr.Character.Highlight:Destroy()
                    end
                end
            end
        end
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: TROLL
-----------------------------------------------------------
local Troll = Window:CreateTab("🤣 Troll")

Troll:CreateButton({
    Name = "Touch Fling (Probar en balon/players)",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        local humrp = char:WaitForChild("HumanoidRootPart")
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(9999,9999,9999)
        bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        bv.Parent = humrp
        wait(0.2)
        bv:Destroy()
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: CREDITOS
-----------------------------------------------------------
local Credits = Window:CreateTab("❤️ Credits")

Credits:CreateButton({
    Name = "TikTok",
    Callback = function()
        setclipboard("https://www.tiktok.com/@tuusuario")
    end
})

Credits:CreateButton({
    Name = "Instagram",
    Callback = function()
        setclipboard("https://www.instagram.com/tuusuario")
    end
})
