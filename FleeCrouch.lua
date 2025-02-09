local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.5  -- Reduz a velocidade enquanto agachado
local agachado = false

-- Função para alternar entre agachar e levantar
local function alternarAgachar()
    if agachado then
        -- Levanta
        humanoid.WalkSpeed = velocidadeOriginal
        humanoid.HipHeight = humanoid.HipHeight + 2
        agachado = false
    else
        -- Agacha
        humanoid.WalkSpeed = velocidadeAgachado
        humanoid.HipHeight = humanoid.HipHeight - 2
        agachado = true
    end
end

-- Detecta o toque na tela ou pressionamento de 'C' no PC
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    -- No mobile, alterna ao tocar na tela
    if input.UserInputType == Enum.UserInputType.Touch then
        alternarAgachar()
    end

    -- No PC, alterna ao pressionar a tecla 'C'
    if input.KeyCode == Enum.KeyCode.C then
        alternarAgachar()
    end
end)
