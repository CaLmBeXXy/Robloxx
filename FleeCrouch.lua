-- Variáveis de controle
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local UIS = game:GetService("UserInputService")
local isCrouching = false

-- Função para a animação de agachar
local function playCrouchAnimation()
    -- Coloque a animação de agachar aqui, exemplo:
    local crouchAnim = Instance.new("Animation")
    crouchAnim.AnimationId = "rbxassetid://animação_de_agachar" -- Substitua pelo ID da animação de agachar do Flee The Facility
    local animTrack = Humanoid:LoadAnimation(crouchAnim)
    animTrack:Play()
end

-- Função para fazer o personagem agachar ou levantar
local function toggleCrouch()
    if isCrouching then
        -- Levantar
        Humanoid.HipWidth = 2 -- Padrão para personagem de pé
        Humanoid.HipHeight = 2
        isCrouching = false
        -- Parar animação
        Humanoid:MoveTo(Character.HumanoidRootPart.Position) -- Ajuste se necessário para "levantar"
    else
        -- Agachar
        Humanoid.HipWidth = 1 -- Padrão para agachado
        Humanoid.HipHeight = 0.5
        isCrouching = true
        playCrouchAnimation()
    end
end

-- Detecção de pressionamento de tecla (PC)
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        toggleCrouch()
    end
end)

-- Detecção de clique no botão 'C' (Mobile)
UIS.TouchStarted:Connect(function(input)
    -- Detectando toque na tela
    if input.UserInputType == Enum.UserInputType.Touch then
        toggleCrouch()
    end
end)

-- Detecção de 'C' no mobile (botão de toque)
UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.C then
        toggleCrouch()
    end
end)
