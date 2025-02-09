local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Carregar a animação de agachar do Flee the Facility
local agacharAnim = Instance.new("Animation")
agacharAnim.AnimationId = "rbxassetid://507771019"  -- Usando a animação de agachar padrão

local velocidadeOriginal = humanoid.WalkSpeed
local velocidadeAgachado = velocidadeOriginal * 0.5  -- Velocidade reduzida enquanto agacha
local agachado = false

-- Ajuste de HipHeight para garantir que o personagem não vai para o "céu"
local hipHeightOriginal = humanoid.HipHeight

-- Função para alternar entre agachar e levantar
local function alternarAgachar()
    if agachado then
        -- Levanta
        humanoid.WalkSpeed = velocidadeOriginal
        humanoid.HipHeight = hipHeightOriginal  -- Retorna ao valor original
        humanoid:LoadAnimation(agacharAnim):Stop()  -- Para a animação de agachar
        agachado = false
    else
        -- Agacha
        humanoid.WalkSpeed = velocidadeAgachado
        humanoid.HipHeight = hipHeightOriginal - 2  -- Ajuste do agachar
        humanoid:LoadAnimation(agacharAnim):Play()  -- Inicia a animação de agachar
        agachado = true
    end
end

-- Detectar o pressionamento do botão C no mobile ou clicando na tela
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    -- Quando tocar na tela ou pressionar 'C' no PC
    if input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.C then
        alternarAgachar()
    end
end)
