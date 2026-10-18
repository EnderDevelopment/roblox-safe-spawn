-- Spawn Protection Script

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    
    local function onCharacterAdded(character)
            -- Spawn protection logic
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local spawnLocation = Vector3.new(0, 10, 0) -- Set your spawn location here
    
    -- Check if the player is spawning in a protected area
    if humanoidRootPart.Position.Y < 5 then
        humanoidRootPart.CFrame = CFrame.new(spawnLocation)
    end
    end
    
    character:WaitForChild("Humanoid").Died:Connect(function()
        onCharacterAdded(character)
    end)
    
    onCharacterAdded(character)
end

Players.PlayerAdded:Connect(onPlayerAdded)
