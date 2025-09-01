--// Blue Lock Rivals HUB (WindUI)
--// Corregido: Sintaxis de WindUI (Toggle, Slider, Button, Dropdown)

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


local PlayerTab = Window:Tab({

    Title = "Tab Player",

    Icon = "person-standing",

    Locked = false,

})



local RandomTab = Window:Tab({

    Title = "Random Features",

    Icon = "dices",

    Locked = false,

})


local RedTab = Window:Tab({

    Title = "Red Light, Green light",

    Icon = "lightbulb",

    Locked = false,

})


local DalgonaTab = Window:Tab({

    Title = "Dalgona",

    Icon = "cookie",

    Locked = false,

})

local Window = WindUI:Window({
    Name = "Blue Lock Rivals HUB",
    Size = UDim2.new(0, 500, 0, 400)
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: MAIN
-----------------------------------------------------------
local Main = Window:Tab({
    Name = "⚡ Main"
})

Main:Button({
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

Main:Button({
    Name = "Auto Shoot (Mantener clic)",
    Callback = function()
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
local PlayerTab = Window:Tab({
    Name = "🏃 Player"
})

PlayerTab:Slider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

PlayerTab:Slider({
    Name = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

PlayerTab:Button({
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
local TP = Window:Tab({
    Name = "📍 Teleports"
})

TP:Button({
    Name = "TP a la Pelota",
    Callback = function()
        local ball = workspace:FindFirstChild("SoccerBall") or workspace:FindFirstChild("Ball")
        if ball then
            game.Players.LocalPlayer.Character:MoveTo(ball.Position + Vector3.new(0,3,0))
        end
    end
})

TP:Dropdown({
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
local Visuals = Window:Tab({
    Name = "👁 Visuals"
})

Visuals:Toggle({
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
local Troll = Window:Tab({
    Name = "🤣 Troll"
})

Troll:Button({
    Name = "Touch Fling",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        local humrp = char:WaitForChild("HumanoidRootPart")
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(9999,9999,9999)
        bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        bv.Parent = humrp
        task.wait(0.2)
        bv:Destroy()
    end
})

-----------------------------------------------------------
-- 🟦 PESTAÑA: CREDITOS
-----------------------------------------------------------
local Credits = Window:Tab({
    Name = "❤️ Credits"
})

Credits:Button({
    Name = "TikTok",
    Callback = function()
        setclipboard("https://www.tiktok.com/@tuusuario")
    end
})

Credits:Button({
    Name = "Instagram",
    Callback = function()
        setclipboard("https://www.instagram.com/tuusuario")
    end
})
