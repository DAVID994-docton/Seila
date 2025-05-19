
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
    "Raids",
    "Itens",
    "Visual",
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

-- Exemplo de botão em Auto Farm
local function createButton(text, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 280, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, #parent:GetChildren() * 45)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextScaled = true
    btn.Parent = parent

    btn.MouseButton1Click:Connect(function()
        print(text .. " ativado")
    end)
end

-- Adicionando botões de exemplo
createButton("Auto Farm Level", panels["Auto Farm"])
createButton("Auto Farm Boss", panels["Auto Farm"])
createButton("Auto Raid", panels["Raids"])
createButton("Comprar Estilo de Luta", panels["Itens"])
createButton("Fake Beli", panels["Visual"])
createButton("Auto Shoot", panels["Extras"])
