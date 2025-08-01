-- Vaper Z - Hub básico para Roblox
-- Autor: Você
-- Data: 2025

repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Função para criar o GUI principal
local function criarMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VaperZGui"
    screenGui.Parent = PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local titulo = Instance.new("TextLabel")
    titulo.Size = UDim2.new(1, 0, 0, 40)
    titulo.BackgroundTransparency = 1
    titulo.Text = "Vaper Z Hub"
    titulo.Font = Enum.Font.GothamBold
    titulo.TextSize = 24
    titulo.TextColor3 = Color3.new(1,1,1)
    titulo.Parent = frame

    -- Função para criar botões
    local function criarBotao(nome, posY, callback)
        local botao = Instance.new("TextButton")
        botao.Size = UDim2.new(0.8, 0, 0, 30)
        botao.Position = UDim2.new(0.1, 0, 0, posY)
        botao.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        botao.BorderSizePixel = 0
        botao.Text = nome
        botao.Font = Enum.Font.Gotham
        botao.TextSize = 18
        botao.TextColor3 = Color3.new(1,1,1)
        botao.Parent = frame

        botao.MouseButton1Click:Connect(callback)
    end

    -- Módulos com nomes descolados e URLs (substitua as URLs pelos seus arquivos)
    local modulos = {
        ["Início Vaper"] = "https://raw.githubusercontent.com/seuusuario/seurepo/main/Aula1.lua",
        ["Potência Máxima"] = "https://raw.githubusercontent.com/seuusuario/seurepo/main/Aula2.lua",
        ["Modo Ninja"] = "https://raw.githubusercontent.com/seuusuario/seurepo/main/Aula3.lua",
        ["Segredos Avançados"] = "https://raw.githubusercontent.com/seuusuario/seurepo/main/Aula4.lua",
    }

    local y = 50
    for nomeModulo, url in pairs(modulos) do
        criarBotao(nomeModulo, y, function()
            print("[Vaper Z] Carregando módulo: " .. nomeModulo)
            local success, err = pcall(function()
                local codigo = game:HttpGet(url)
                local func = loadstring(codigo)
                func()
            end)
            if success then
                print("[Vaper Z] Módulo " .. nomeModulo .. " carregado com sucesso!")
            else
                warn("[Vaper Z] Falha ao carregar módulo " .. nomeModulo .. ": " .. tostring(err))
            end
        end)
        y = y + 40
    end
end

criarMenu()

