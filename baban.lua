-- Jester/Mari & Biome Detector - Improved Version
print("=== JESTER/MARI & BIOME DETECTOR LOADED ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdvancedDetector"
screenGui.Parent = game:GetService("CoreGui")

-- Main Container Frame
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 500, 0, 450)
mainContainer.Position = UDim2.new(0.5, -250, 0.5, -225)
mainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainContainer.BorderSizePixel = 0
mainContainer.Parent = screenGui

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 12)
containerCorner.Parent = mainContainer

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainContainer

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.Position = UDim2.new(0.05, 0, 0, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Text = "Jester/Mari & Biome Detector"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 16
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0.93, 0, 0.12, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = titleBar

-- Tab Buttons
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 40)
tabContainer.Position = UDim2.new(0, 0, 0, 40)
tabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
tabContainer.BorderSizePixel = 0
tabContainer.Parent = mainContainer

local merchantTab = Instance.new("TextButton")
merchantTab.Size = UDim2.new(0.5, 0, 1, 0)
merchantTab.Position = UDim2.new(0, 0, 0, 0)
merchantTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
merchantTab.TextColor3 = Color3.fromRGB(255, 255, 255)
merchantTab.Text = "- Merchant"
merchantTab.Font = Enum.Font.GothamBold
merchantTab.TextSize = 14
merchantTab.Parent = tabContainer

local biomeTab = Instance.new("TextButton")
biomeTab.Size = UDim2.new(0.5, 0, 1, 0)
biomeTab.Position = UDim2.new(0.5, 0, 0, 0)
biomeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
biomeTab.Text = "- Biome"
biomeTab.Font = Enum.Font.GothamBold
biomeTab.TextSize = 14
biomeTab.Parent = tabContainer

-- Content Frames
local merchantFrame = Instance.new("Frame")
merchantFrame.Size = UDim2.new(1, 0, 1, -80)
merchantFrame.Position = UDim2.new(0, 0, 0, 80)
merchantFrame.BackgroundTransparency = 1
merchantFrame.Visible = true
merchantFrame.Parent = mainContainer

local biomeFrame = Instance.new("Frame")
biomeFrame.Size = UDim2.new(1, 0, 1, -80)
biomeFrame.Position = UDim2.new(0, 0, 0, 80)
biomeFrame.BackgroundTransparency = 1
biomeFrame.Visible = false
biomeFrame.Parent = mainContainer

-- ===== MERCHANT TAB CONTENT =====
-- Webhook Section
local webhookSection = Instance.new("Frame")
webhookSection.Size = UDim2.new(0.9, 0, 0, 120)
webhookSection.Position = UDim2.new(0.05, 0, 0.05, 0)
webhookSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
webhookSection.Parent = merchantFrame

local webhookLabel = Instance.new("TextLabel")
webhookLabel.Size = UDim2.new(0.9, 0, 0, 25)
webhookLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
webhookLabel.BackgroundTransparency = 1
webhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
webhookLabel.Text = "URL Webhook Discord:"
webhookLabel.Font = Enum.Font.GothamBold
webhookLabel.TextSize = 14
webhookLabel.TextXAlignment = Enum.TextXAlignment.Left
webhookLabel.Parent = webhookSection

local webhookBox = Instance.new("TextBox")
webhookBox.Size = UDim2.new(0.9, 0, 0, 40)
webhookBox.Position = UDim2.new(0.05, 0, 0.3, 0)
webhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
webhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
webhookBox.PlaceholderText = "Tempel URL webhook Anda di sini..."
webhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
webhookBox.Text = ""
webhookBox.Font = Enum.Font.Gotham
webhookBox.TextSize = 12
webhookBox.TextWrapped = true
webhookBox.Parent = webhookSection

-- Server Link Section
local serverSection = Instance.new("Frame")
serverSection.Size = UDim2.new(0.9, 0, 0, 80)
serverSection.Position = UDim2.new(0.05, 0, 0.35, 0)
serverSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
serverSection.Parent = merchantFrame

local serverLabel = Instance.new("TextLabel")
serverLabel.Size = UDim2.new(0.9, 0, 0, 25)
serverLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
serverLabel.BackgroundTransparency = 1
serverLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
serverLabel.Text = "Private Server Link:"
serverLabel.Font = Enum.Font.GothamBold
serverLabel.TextSize = 14
serverLabel.TextXAlignment = Enum.TextXAlignment.Left
serverLabel.Parent = serverSection

local serverBox = Instance.new("TextBox")
serverBox.Size = UDim2.new(0.9, 0, 0, 35)
serverBox.Position = UDim2.new(0.05, 0, 0.5, 0)
serverBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
serverBox.TextColor3 = Color3.fromRGB(255, 255, 255)
serverBox.PlaceholderText = "Link private server (opsional)..."
serverBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
serverBox.Text = ""
serverBox.Font = Enum.Font.Gotham
serverBox.TextSize = 12
serverBox.TextWrapped = true
serverBox.Parent = serverSection

-- Status Section
local statusSection = Instance.new("Frame")
statusSection.Size = UDim2.new(0.9, 0, 0, 60)
statusSection.Position = UDim2.new(0.05, 0, 0.65, 0)
statusSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
statusSection.Parent = merchantFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
statusLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Text = "Status: Ready to setup"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextWrapped = true
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusSection

-- Buttons Section
local buttonSection = Instance.new("Frame")
buttonSection.Size = UDim2.new(0.9, 0, 0, 50)
buttonSection.Position = UDim2.new(0.05, 0, 0.85, 0)
buttonSection.BackgroundTransparency = 1
buttonSection.Parent = merchantFrame

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.48, 0, 1, 0)
saveBtn.Position = UDim2.new(0, 0, 0, 0)
saveBtn.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveBtn.Text = "Apply"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.Parent = buttonSection

local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(0.48, 0, 1, 0)
testBtn.Position = UDim2.new(0.52, 0, 0, 0)
testBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testBtn.Text = "Test"
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 14
testBtn.Parent = buttonSection

-- ===== BIOME TAB CONTENT =====
local biomeInfo = Instance.new("TextLabel")
biomeInfo.Size = UDim2.new(0.9, 0, 0, 150)
biomeInfo.Position = UDim2.new(0.05, 0, 0.05, 0)
biomeInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeInfo.Text = "Biome Detection Settings\n\n• GLITCHED Biome:\n  - [Manager]: Unexpected error occurred. [Code 404]\n  - [Manager]: [Code 404] has resolved.\n\n• DREAMSPACE Biome:\n  - [Dreamspace]: You begin to feel sleepy...\n  - [Dreamspace]: Waking up..."
biomeInfo.Font = Enum.Font.Gotham
biomeInfo.TextSize = 12
biomeInfo.TextWrapped = true
biomeInfo.TextXAlignment = Enum.TextXAlignment.Left
biomeInfo.Parent = biomeFrame

local biomeStatus = Instance.new("TextLabel")
biomeStatus.Size = UDim2.new(0.9, 0, 0, 80)
biomeStatus.Position = UDim2.new(0.05, 0, 0.5, 0)
biomeStatus.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeStatus.Text = "Biome Monitoring Status:\n• GLITCHED: Ready\n• DREAMSPACE: Ready\n\nBiome detection will auto-start with merchant detection."
biomeStatus.Font = Enum.Font.Gotham
biomeStatus.TextSize = 12
biomeStatus.TextWrapped = true
biomeStatus.TextXAlignment = Enum.TextXAlignment.Left
biomeStatus.Parent = biomeFrame

-- Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "🔔"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.Visible = false
toggleBtn.Parent = screenGui

-- ===== VARIABLES & CONFIGURATION =====
local webhookUrl = ""
local privateServerLink = ""
local isMonitoring = false
local detectedMessages = {}

-- DEFAULT ROLE IDs (HIDDEN)
local ROLE_IDS = {
    Jester = "317209347606315008",
    Mari = "1434246462644027403", 
    Dreamspace = "1434261677876056124",
    Glitched = "317209347606315008"
}

-- BIOME MESSAGES PATTERNS
local BIOME_PATTERNS = {
    Glitched = {
        "[Manager]: Unexpected error occurred. [Code 404]",
        "[Manager]: [Code 404] has resolved."
    },
    Dreamspace = {
        "[Dreamspace]: You begin to feel sleepy...",
        "[Dreamspace]: Waking up..."
    }
}

-- ===== FUNCTIONS =====
-- Tab Switching
local function switchToTab(tabName)
    if tabName == "merchant" then
        merchantFrame.Visible = true
        biomeFrame.Visible = false
        merchantTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        biomeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        merchantTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        biomeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    else
        merchantFrame.Visible = false
        biomeFrame.Visible = true
        merchantTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        biomeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        merchantTab.TextColor3 = Color3.fromRGB(200, 200, 200)
        biomeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

-- Discord Webhook Function
local function sendToDiscord(message, playerName, mentionType)
    if webhookUrl == "" or not string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Invalid webhook URL"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🚨 Detection Alert!"
    local color = 16711680 -- Red
    
    -- Set role mention and customize message based on type
    if mentionType == "Jester" then
        content = "<@&" .. ROLE_IDS.Jester .. "> "
        title = "🎭 Jester Detected!"
        color = 10181046 -- Purple
    elseif mentionType == "Mari" then
        content = "<@&" .. ROLE_IDS.Mari .. "> "
        title = "🌸 Mari Detected!"
        color = 15277667 -- Pink
    elseif mentionType == "Glitched" then
        content = "<@&" .. ROLE_IDS.Glitched .. "> "
        title = "⚡ GLITCHED Biome Active!"
        color = 15105570 -- Orange
    elseif mentionType == "Dreamspace" then
        content = "<@&" .. ROLE_IDS.Dreamspace .. "> "
        title = "💤 DREAMSPACE Biome Active!"
        color = 3447003 -- Blue
    end
    
    local embedData = {
        ["title"] = title,
        ["description"] = message,
        ["color"] = color,
        ["fields"] = {
            {
                ["name"] = "Player",
                ["value"] = playerName or "System",
                ["inline"] = true
            },
            {
                ["name"] = "Detection Type",
                ["value"] = mentionType or "Unknown",
                ["inline"] = true
            },
            {
                ["name"] = "Time",
                ["value"] = currentTime,
                ["inline"] = true
            }
        },
        ["footer"] = {
            ["text"] = "Advanced Detector"
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
        ["content"] = content,
        ["embeds"] = {embedData},
        ["username"] = "ROBLOX Detector"
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
        statusLabel.Text = "Status: " .. mentionType .. " detected! " .. currentTime
        return true
    else
        statusLabel.Text = "Status: Failed to send webhook"
        return false
    end
end

-- Message Detection for Merchants
local function checkMerchantMessage(message, speaker)
    local lowerMsg = string.lower(tostring(message))
    
    -- Check for Jester (case insensitive)
    if string.find(lowerMsg, "jester") then
        local fullMessage = speaker .. ": " .. message
        
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            
            if #detectedMessages > 20 then
                table.remove(detectedMessages, 1)
            end
            
            sendToDiscord(fullMessage, speaker, "Jester")
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Jester Detected!",
                Text = speaker .. " mentioned Jester",
                Duration = 5
            })
            
            print("[MERCHANT] Jester mentioned by: " .. speaker)
        end
    end
    
    -- Check for Mari (case insensitive)  
    if string.find(lowerMsg, "mari") then
        local fullMessage = speaker .. ": " .. message
        
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            
            if #detectedMessages > 20 then
                table.remove(detectedMessages, 1)
            end
            
            sendToDiscord(fullMessage, speaker, "Mari")
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Mari Detected!",
                Text = speaker .. " mentioned Mari", 
                Duration = 5
            })
            
            print("[MERCHANT] Mari mentioned by: " .. speaker)
        end
    end
end

-- Biome Detection
local function checkBiomeMessage(message, speaker)
    for biomeName, patterns in pairs(BIOME_PATTERNS) do
        for _, pattern in ipairs(patterns) do
            if string.find(message, pattern) then
                local fullMessage = speaker .. ": " .. message
                
                if not table.find(detectedMessages, fullMessage) then
                    table.insert(detectedMessages, fullMessage)
                    
                    if #detectedMessages > 20 then
                        table.remove(detectedMessages, 1)
                    end
                    
                    sendToDiscord(fullMessage, "System", biomeName)
                    
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = biomeName .. " Biome!",
                        Text = pattern,
                        Duration = 5
                    })
                    
                    print("[BIOME] " .. biomeName .. " detected: " .. pattern)
                end
                break
            end
        end
    end
end

-- Combined Message Check
local function checkAllMessages(message, speaker)
    checkMerchantMessage(message, speaker)
    checkBiomeMessage(message, speaker)
end

-- Start Monitoring
local function startMonitoring()
    if isMonitoring then return end
    
    isMonitoring = true
    statusLabel.Text = "Status: Monitoring for Jester, Mari & Biomes..."
    
    -- Monitor all players
    for _, player in pairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            checkAllMessages(message, player.Name)
        end)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            checkAllMessages(message, player.Name)
        end)
    end)
    
    print("✅ Started monitoring for Jester, Mari & Biomes")
end

-- ===== EVENT HANDLERS =====
closeBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    toggleBtn.Visible = true
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = true
    toggleBtn.Visible = false
end)

merchantTab.MouseButton1Click:Connect(function()
    switchToTab("merchant")
end)

biomeTab.MouseButton1Click:Connect(function()
    switchToTab("biome")
end)

saveBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    privateServerLink = serverBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Settings applied! Starting monitor..."
        wait(1)
        startMonitoring()
        mainContainer.Visible = false
        toggleBtn.Visible = true
    else
        statusLabel.Text = "Status: Please enter valid Discord webhook"
    end
end)

testBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Sending test notification..."
        
        local success = sendToDiscord("🧪 Test message for Jester detection", "TEST BOT", "Jester")
        
        if success then
            statusLabel.Text = "Status: Test sent successfully!"
        end
    else
        statusLabel.Text = "Status: Enter valid webhook first"
    end
end)

print("✅ Advanced Detector Loaded!")
print("🎯 Monitoring for: 'Jester', 'Mari', GLITCHED & DREAMSPACE Biomes")
print("📊 Features: Merchant detection + Biome detection")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Advanced Detector",
    Text = "Click 🔔 to configure settings",
    Duration = 5
})
