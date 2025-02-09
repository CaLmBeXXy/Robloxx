local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Carregar animação de agachar
local agacharAnim = Instance.new("Animation")
agacharAnim.AnimationId = "rbxassetid://507771019"  -- ID da animação do Flee the Facility

local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.5
local agachado = false

-- Criar o botão
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local agacharButton = Instance.new("TextButton")
agacharButton.Size = UDim2.new(0, 200, 0, 50)  -- Tamanho do botão
agacharButton.Position = UDim2.new(0.5, -100, 0.9, -25)  -- Posição do botão
agacharButton.Text = "Agachar"  -- Texto do botão
agacharButton.Parent = screenGui

-- Função para alternar entre agachar e levantar
local function alternarAgachar()
    if agachado then
        humanoid.WalkSpeed = velocidadeOriginal
        humanoid:LoadAnimation(agacharAnim):Stop()  -- Para a animação
        agachado = false
    else
        humanoid.WalkSpeed = velocidadeAgachado
        humanoid:LoadAnimation(agacharAnim):Play()  -- Toca a animação
        agachado = true
    end
end

-- Detecta o clique no botão
agacharButton.MouseButton1Click:Connect(function()
    alternarAgachar()
end)
