-- DF MENU Retangular com Abas e Botões Adaptados

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DF_MENU"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local menu = Instance.new("Frame")
menu.Name = "MainMenu"
menu.Size = UDim2.new(0, 420, 0, 280)
menu.Position = UDim2.new(0.5, -210, 0.5, -140)
menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menu.BorderSizePixel = 0
menu.Parent = ScreenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "D_F BY DAVID E FRANCISCO"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = menu

local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "Tabs"
tabsFrame.Size = UDim2.new(0, 100, 0, 240)
tabsFrame.Position = UDim2.new(0, 0, 0, 40)
tabsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tabsFrame.Parent = menu

local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -100, 1, -40)
contentFrame.Position = UDim2.new(0, 100, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
contentFrame.Parent = menu

local tabList = {
    "Auto Farm",
    "Combate",
    "Movimentação",
    "Itens",
    "Extras"
}

local function createTabButton(tabName, position)
    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(1, 0, 0, 40)
    tab.Position = UDim2.new(0, 0, 0, position)
    tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Font = Enum.Font.SourceSansBold
    tab.TextScaled = true
    tab.Name = tabName
    tab.Parent = tabsFrame
    return tab
end

local function createContentPanel(name)
    local panel = Instance.new("ScrollingFrame")
    panel.Size = UDim2.new(1, 0, 1, 0)
    panel.Position = UDim2.new(0, 0, 0, 0)
    panel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    panel.BorderSizePixel = 0
    panel.ScrollBarThickness = 6
    panel.Visible = false
    panel.Name = name
    panel.Parent = contentFrame
    return panel
end

local panels = {}
for i, name in ipairs(tabList) do
    local tab = createTabButton(name, (i - 1) * 40)
    local panel = createContentPanel(name)
    panels[name] = panel

    tab.MouseButton1Click:Connect(function()
        for _, p in pairs(contentFrame:GetChildren()) do
            p.Visible = false
        end
        panel.Visible = true
    end)
end

-- Ativar primeira aba por padrão
if panels[tabList[1]] then
    panels[tabList[1]].Visible = true
end

-- Função para criar switches visuais
local function createSwitch(text, parent, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 40)
    container.Position = UDim2.new(0, 10, 0, #parent:GetChildren() * 45)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.TextScaled = true
    label.Parent = container

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0.3, -10, 0.6, 0)
    toggle.Position = UDim2.new(0.7, 10, 0.2, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggle.Text = ""
    toggle.Parent = container

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0.5, 0, 1, 0)
    circle.Position = UDim2.new(0, 0, 0, 0)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.Parent = toggle

    local enabled = false
    toggle.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            circle.Position = UDim2.new(0.5, 0, 0, 0)
        else
            toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            circle.Position = UDim2.new(0, 0, 0, 0)
        end
        callback(enabled)
    end)
end

-- Variáveis de controle
local AutoClickerEnabled = false
local AutoShootEnabled = false

-- Funções dos switches
createSwitch("Auto Farm Level", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Farm Boss", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Farm Mastery", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Farm Itens / Espadas Lendárias", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto TTK", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Sea 2 / Sea 3", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Elite Hunter", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Bartilo Quest", panels["Auto Farm"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Aimbot NPC e Players", panels["Combate"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Shoot (extremo)", panels["Combate"], function(state)
    AutoShootEnabled = state
end)

createSwitch("Kill Aura", panels["Combate"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Dash Infinito", panels["Combate"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("God Mode", panels["Combate"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Fly", panels["Movimentação"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Noclip", panels["Movimentação"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Infinite Jump", panels["Movimentação"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Controle de velocidade", panels["Movimentação"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Teleporte por nome e dropdown", panels["Movimentação"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Comprar estilos de luta automaticamente", panels["Itens"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Pegar raça Draco", panels["Itens"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Pegar Sanguine Art", panels["Itens"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Dual Flintlock", panels["Itens"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Haki V1 e V2", panels["Itens"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Clicker rápido (NPC only)", panels["Extras"], function(state)
    AutoClickerEnabled = state
end)

createSwitch("ESP (caixas, players)", panels["Extras"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Fake Beli / Fake Status / Fake Level", panels["Extras"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Chuva de Frutas", panels["Extras"], function(state)
    -- Implementar funcionalidade
end)

createSwitch("Auto Comprar Frutas", panels["Extras"], function(state)
    -- Implementar funcionalidade
end)

-- Loop do Auto Clicker
task.spawn(function()
    while true do
        task.wait(math.random(1, 3) / 100) -- Delay entre 0.01s e 0.03s
        if AutoClickerEnabled then
            local Tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if Tool and Tool:FindFirstChild("RemoteEvent") then
                Tool.RemoteEvent:FireServer()
            elseif Tool and Tool:FindFirstChild("RemoteFunction") then
                Tool.RemoteFunction:InvokeServer()
            else
                pcall(function() Tool:Activate() end)
            end
        end
    end
end)

-- Loop do Auto Shoot
task.spawn(function()
    while true do
        task.wait(math.random(5, 15) / 1000) -- Delay entre 0.005s e 00
