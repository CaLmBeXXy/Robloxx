local UserInputService = game:GetService("UserInputService")
local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.7  -- Ajuste da velocidade ao agachar

local agachado = false
local tempoAgachado = 0.1  -- Tempo mais rápido de agachar

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

-- Detectar toques no botão de agachar do mobile ou pressionamento de tecla 'C' no PC
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    -- No mobile, alterna ao pressionar o botão de agachar
    if input.UserInputType == Enum.UserInputType.Touch then
        local touchLocation = input.Position
        -- Verifica se o toque foi dentro da área do botão de agachar
        if touchLocation.Y >= 0 and touchLocation.Y <= 100 then  -- Ajuste o valor de Y conforme a posição do botão
            alternarAgachar()
        end
    end

    -- No PC, alterna ao pressionar a tecla 'C'
    if input.KeyCode == Enum.KeyCode.C then
        alternarAgachar()
    end
end)
