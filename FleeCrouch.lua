local UserInputService = game:GetService("UserInputService")
local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local agachado = false
local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.7

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftControl then
        if not agachado then
            humanoid.WalkSpeed = velocidadeAgachado
            humanoid.HipHeight = humanoid.HipHeight - 2
            agachado = true
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftControl then
        if agachado then
            humanoid.WalkSpeed = velocidadeOriginal
            humanoid.HipHeight = humanoid.HipHeight + 2
            agachado = false
        end
    end
end)
