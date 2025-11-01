-- Discord Notifier for Jester/Mari - Fixed Version
print("=== DISCORD NOTIFIER LOADING ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DiscordNotifier"
screenGui.Parent = game:GetService("CoreGui")

-- Main Frame (awalnya hidden)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Toggle Button (selalu visible)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
toggleBtn.Text = "🔔"
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "Jester/Mari Detector"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = mainFrame

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = mainFrame

-- Webhook Input
local webhookBox = Instance.new("TextBox")
webhookBox.Size = UDim2.new(0.9, 0, 0, 40)
webhookBox.Position = UDim2.new(0.05, 0, 0.2, 0)
webhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
webhookBox.TextColor3 = Color3.new(1, 1, 1)
webhookBox.PlaceholderText = "Paste Discord webhook URL here..."
webhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
webhookBox.Text = ""
webhookBox.Font = Enum.Font.Gotham
webhookBox.TextSize = 12
webhookBox.Parent = mainFrame

-- Server Link (Optional)
local serverBox = Instance.new("TextBox")
serverBox.Size = UDim2.new(0.9, 0, 0, 40)
serverBox.Position = UDim2.new(0.05, 0, 0.4, 0)
serverBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
serverBox.TextColor3 = Color3.new(1, 1, 1)
serverBox.PlaceholderText = "Private server link (optional)..."
serverBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
serverBox.Text = ""
serverBox.Font = Enum.Font.Gotham
serverBox.TextSize = 12
serverBox.Parent = mainFrame

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
statusLabel.Position = UDim2.new(0.05, 0, 0.6, 0)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Text = "Status: Ready to setup"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextWrapped = true
statusLabel.Parent = mainFrame

-- Buttons
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.43, 0, 0, 35)
saveBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
saveBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.Text = "SAVE & START"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 13
saveBtn.Parent = mainFrame

local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(0.43, 0, 0, 35)
testBtn.Position = UDim2.new(0.52, 0, 0.8, 0)
testBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
testBtn.TextColor3 = Color3.new(1, 1, 1)
testBtn.Text = "TEST"
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 13
testBtn.Parent = mainFrame

-- Variables
local webhookUrl = ""
local privateServerLink = ""
local isMonitoring = false
local detectedMessages = {}

-- Function to send Discord webhook
local function sendToDiscord(message, playerName)
    if webhookUrl == "" or not string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Invalid webhook URL"
        statusLabel.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    
    local embedData = {
        ["title"] = "🚨 Jester/Mari Detected!",
        ["description"] = message,
        ["color"] = 16711680, -- Red
        ["fields"] = {
            {
                ["name"] = "Player",
                ["value"] = playerName or "Unknown",
                ["inline"] = true
            },
            {
                ["name"] = "Time",
                ["value"] = currentTime,
                ["inline"] = true
            },
            {
                ["name"] = "Game ID",
                ["value"] = tostring(game.PlaceId),
                ["inline"] = true
            }
        },
        ["footer"] = {
            ["text"] = "Delta Mobile Notifier"
        }
    }
    
    if privateServerLink ~= "" then
        table.insert(embedData.fields, {
            ["name"] = "Private Server",
            ["value"] = privateServerLink,
            ["inline"] = false
        })
    end
    
    local data = {
        ["embeds"] = {embedData},
        ["username"] = "ROBLOX Monitor"
    }
    
    local success, result = pcall(function()
        local response = request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
        return response
    end)
    
    if success then
        statusLabel.Text = "Status: Notification sent! " .. currentTime
        statusLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        return true
    else
        statusLabel.Text = "Status: Failed to send webhook"
        statusLabel.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        return false
    end
end

-- Function to check messages
local function checkMessage(message, speaker)
    local lowerMsg = string.lower(tostring(message))
    
    if string.find(lowerMsg, "jester") or string.find(lowerMsg, "mari") then
        local fullMessage = speaker .. ": " .. message
        
        -- Prevent spam
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            
            if #detectedMessages > 10 then
                table.remove(detectedMessages, 1)
            end
            
            -- Send to Discord
            sendToDiscord(fullMessage, speaker)
            
            -- Show in-game notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Target Mentioned!",
                Text = speaker .. " said: " .. string.sub(message, 1, 50),
                Duration = 5
            })
            
            print("[DETECTOR] Found: " .. fullMessage)
        end
    end
end

-- Start monitoring function
local function startMonitoring()
    if isMonitoring then return end
    
    isMonitoring = true
    statusLabel.Text = "Status: Monitoring chat for Jester/Mari..."
    statusLabel.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    
    -- Monitor existing players
    for _, player in pairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            checkMessage(message, player.Name)
        end)
    end
    
    -- Monitor new players
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            checkMessage(message, player.Name)
        end)
    end)
    
    print("[DETECTOR] Started monitoring for Jester/Mari")
end

-- Button Events
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

saveBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    privateServerLink = serverBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Settings saved! Starting monitor..."
        statusLabel.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
        wait(1)
        startMonitoring()
        mainFrame.Visible = false
    else
        statusLabel.Text = "Status: Please enter valid Discord webhook"
        statusLabel.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    end
end)

testBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Sending test notification..."
        statusLabel.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
        
        local success = sendToDiscord("🧪 Test message from Delta Mobile Notifier. System is working!", "TEST BOT")
        
        if success then
            statusLabel.Text = "Status: Test sent successfully!"
        end
    else
        statusLabel.Text = "Status: Enter valid webhook first"
        statusLabel.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    end
end)

print("✅ Discord Notifier Loaded!")
print("🔔 Click the bell button to setup")
print("🎯 Monitoring for: 'Jester' and 'Mari'")

-- Show confirmation
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Discord Notifier",
    Text = "Click the 🔔 button to setup",
    Duration = 5
})
