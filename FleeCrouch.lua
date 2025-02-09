local UserInputService = game:GetService("UserInputService")
local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.7

local function agacharLevantar()
    -- Agacha
    humanoid.WalkSpeed = velocidadeAgachado
    humanoid.HipHeight = humanoid.HipHeight - 2
    
    -- Espera um tempo curto
    wait(0.1)
    
    -- Levanta
    humanoid.WalkSpeed = velocidadeOriginal
    humanoid.HipHeight = humanoid.HipHeight + 2
end

-- Detecção do clique no mobile ou pressionamento da tecla no PC
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- No mobile, agacha e levanta no toque
    if input.UserInputType == Enum.UserInputType.Touch then
        agacharLevantar()
    end
    
    -- No PC, agacha e levanta ao pressionar 'C'
    if input.KeyCode == Enum.KeyCode.C then
        agacharLevantar()
    end
end)
