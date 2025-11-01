-- Jester/Mari & Biome Detector - Separate Webhooks
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
mainContainer.Size = UDim2.new(0, 500, 0, 500)
mainContainer.Position = UDim2.new(0.5, -250, 0.5, -250)
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
webhookLabel.Text = "Merchant Webhook Discord:"
webhookLabel.Font = Enum.Font.GothamBold
webhookLabel.TextSize = 14
webhookLabel.TextXAlignment = Enum.TextXAlignment.Left
webhookLabel.Parent = webhookSection

local merchantWebhookBox = Instance.new("TextBox")
merchantWebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
merchantWebhookBox.Position = UDim2.new(0.05, 0, 0.3, 0)
merchantWebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
merchantWebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
merchantWebhookBox.PlaceholderText = "Webhook untuk Jester & Mari..."
merchantWebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
merchantWebhookBox.Text = ""
merchantWebhookBox.Font = Enum.Font.Gotham
merchantWebhookBox.TextSize = 12
merchantWebhookBox.TextWrapped = true
merchantWebhookBox.Parent = webhookSection

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

local merchantStatusLabel = Instance.new("TextLabel")
merchantStatusLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
merchantStatusLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
merchantStatusLabel.BackgroundTransparency = 1
merchantStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
merchantStatusLabel.Text = "Status: Ready to setup Merchant detection"
merchantStatusLabel.Font = Enum.Font.Gotham
merchantStatusLabel.TextSize = 12
merchantStatusLabel.TextWrapped = true
merchantStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
merchantStatusLabel.Parent = statusSection

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
saveBtn.Text = "Apply All"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.Parent = buttonSection

local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(0.48, 0, 1, 0)
testBtn.Position = UDim2.new(0.52, 0, 0, 0)
testBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testBtn.Text = "Test Merchant"
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 14
testBtn.Parent = buttonSection

-- ===== BIOME TAB CONTENT =====
-- Biome Webhook Section
local biomeWebhookSection = Instance.new("Frame")
biomeWebhookSection.Size = UDim2.new(0.9, 0, 0, 120)
biomeWebhookSection.Position = UDim2.new(0.05, 0, 0.05, 0)
biomeWebhookSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeWebhookSection.Parent = biomeFrame

local biomeWebhookLabel = Instance.new("TextLabel")
biomeWebhookLabel.Size = UDim2.new(0.9, 0, 0, 25)
biomeWebhookLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
biomeWebhookLabel.BackgroundTransparency = 1
biomeWebhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeWebhookLabel.Text = "Biome Webhook Discord:"
biomeWebhookLabel.Font = Enum.Font.GothamBold
biomeWebhookLabel.TextSize = 14
biomeWebhookLabel.TextXAlignment = Enum.TextXAlignment.Left
biomeWebhookLabel.Parent = biomeWebhookSection

local biomeWebhookBox = Instance.new("TextBox")
biomeWebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
biomeWebhookBox.Position = UDim2.new(0.05, 0, 0.3, 0)
biomeWebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
biomeWebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeWebhookBox.PlaceholderText = "Webhook khusus untuk Biome alerts..."
biomeWebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
biomeWebhookBox.Text = ""
biomeWebhookBox.Font = Enum.Font.Gotham
biomeWebhookBox.TextSize = 12
biomeWebhookBox.TextWrapped = true
biomeWebhookBox.Parent = biomeWebhookSection

-- Biome Info Section
local biomeInfo = Instance.new("TextLabel")
biomeInfo.Size = UDim2.new(0.9, 0, 0, 120)
biomeInfo.Position = UDim2.new(0.05, 0, 0.35, 0)
biomeInfo.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeInfo.Text = "Biome Detection Patterns:\n\n• GLITCHED Biome:\n  - [Manager]: Unexpected error occurred. [Code 404]\n  - [Manager]: [Code 404] has resolved.\n\n• DREAMSPACE Biome:\n  - [Dreamspace]: You begin to feel sleepy...\n  - [Dreamspace]: Waking up..."
biomeInfo.Font = Enum.Font.Gotham
biomeInfo.TextSize = 11
biomeInfo.TextWrapped = true
biomeInfo.TextXAlignment = Enum.TextXAlignment.Left
biomeInfo.Parent = biomeFrame

-- Biome Status Section
local biomeStatusSection = Instance.new("Frame")
biomeStatusSection.Size = UDim2.new(0.9, 0, 0, 80)
biomeStatusSection.Position = UDim2.new(0.05, 0, 0.7, 0)
biomeStatusSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
biomeStatusSection.Parent = biomeFrame

local biomeStatusLabel = Instance.new("TextLabel")
biomeStatusLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
biomeStatusLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
biomeStatusLabel.BackgroundTransparency = 1
biomeStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeStatusLabel.Text = "Biome Monitoring Status:\n• GLITCHED: Ready\n• DREAMSPACE: Ready\n• Webhook: Not set"
biomeStatusLabel.Font = Enum.Font.Gotham
biomeStatusLabel.TextSize = 12
biomeStatusLabel.TextWrapped = true
biomeStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
biomeStatusLabel.Parent = biomeStatusSection

-- Biome Test Button
local biomeTestBtn = Instance.new("TextButton")
biomeTestBtn.Size = UDim2.new(0.9, 0, 0, 40)
biomeTestBtn.Position = UDim2.new(0.05, 0, 0.9, 0)
biomeTestBtn.BackgroundColor3 = Color3.fromRGB(100, 80, 180)
biomeTestBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
biomeTestBtn.Text = "Test Biome Webhook"
biomeTestBtn.Font = Enum.Font.GothamBold
biomeTestBtn.TextSize = 14
biomeTestBtn.Parent = biomeFrame

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
local merchantWebhookUrl = ""
local biomeWebhookUrl = ""
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

-- Merchant Discord Webhook Function
local function sendMerchantToDiscord(message, playerName, mentionType)
    if merchantWebhookUrl == "" or not string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        merchantStatusLabel.Text = "Status: Merchant webhook not set"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🚨 Merchant Detected!"
    local color = 16711680 -- Red
    
    -- Set role mention based on merchant type
    if mentionType == "Jester" then
        content = "<@&" .. ROLE_IDS.Jester .. "> "
        title = "🎭 Jester Detected!"
        color = 10181046 -- Purple
    elseif mentionType == "Mari" then
        content = "<@&" .. ROLE_IDS.Mari .. "> "
        title = "🌸 Mari Detected!"
        color = 15277667 -- Pink
    end
    
    local embedData = {
        ["title"] = title,
        ["description"] = message,
        ["color"] = color,
        ["fields"] = {
            {
                ["name"] = "Player",
                ["value"] = playerName or "Unknown",
                ["inline"] = true
            },
            {
                ["name"] = "Merchant Type",
                ["value"] = mentionType,
                ["inline"] = true
            },
            {
                ["name"] = "Time",
                ["value"] = currentTime,
                ["inline"] = true
            }
        },
        ["footer"] = {
            ["text"] = "Merchant Detector"
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
        ["username"] = "ROBLOX Merchant Alert"
    }
    
    local success, result = pcall(function()
        local response = request({
            Url = merchantWebhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
        return response
    end)
    
    if success then
        merchantStatusLabel.Text = "Status: " .. mentionType .. " detected! " .. currentTime
        return true
    else
        merchantStatusLabel.Text = "Status: Failed to send merchant webhook"
        return false
    end
end

-- Biome Discord Webhook Function
local function sendBiomeToDiscord(message, biomeName)
    if biomeWebhookUrl == "" or not string.find(biomeWebhookUrl:lower(), "discord.com/api/webhooks") then
        biomeStatusLabel.Text = "Status: Biome webhook not set"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🌍 Biome Activated!"
    local color = 3447003 -- Blue
    
    -- Set role mention and customize for biome type
    if biomeName == "Glitched" then
        content = "<@&" .. ROLE_IDS.Glitched .. "> "
        title = "⚡ GLITCHED Biome Active!"
        color = 15105570 -- Orange
    elseif biomeName == "Dreamspace" then
        content = "<@&" .. ROLE_IDS.Dreamspace .. "> "
        title = "💤 DREAMSPACE Biome Active!"
        color = 10181046 -- Purple
    end
    
    local embedData = {
        ["title"] = title,
        ["description"] = message,
        ["color"] = color,
        ["fields"] = {
            {
                ["name"] = "Biome Type",
                ["value"] = biomeName,
                ["inline"] = true
            },
            {
                ["name"] = "Trigger Message",
                ["value"] = message,
                ["inline"] = true
            },
            {
                ["name"] = "Time",
                ["value"] = currentTime,
                ["inline"] = true
            }
        },
        ["footer"] = {
            ["text"] = "Biome Detector"
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
        ["username"] = "ROBLOX Biome Alert"
    }
    
    local success, result = pcall(function()
        local response = request({
            Url = biomeWebhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
        return response
    end)
    
    if success then
        biomeStatusLabel.Text = "Status: " .. biomeName .. " detected! " .. currentTime
        return true
    else
        biomeStatusLabel.Text = "Status: Failed to send biome webhook"
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
            
            sendMerchantToDiscord(fullMessage, speaker, "Jester")
            
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
            
            sendMerchantToDiscord(fullMessage, speaker, "Mari")
            
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
                    
                    sendBiomeToDiscord(fullMessage, biomeName)
                    
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
    merchantStatusLabel.Text = "Status: Monitoring for Jester & Mari..."
    biomeStatusLabel.Text = "Status: Monitoring for Biomes..."
    
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
    end
    
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
    merchantWebhookUrl = merchantWebhookBox.Text
    biomeWebhookUrl = biomeWebhookBox.Text
    privateServerLink = serverBox.Text
    
    local merchantValid = merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks")
    local biomeValid = biomeWebhookUrl ~= "" and string.find(biomeWebhookUrl:lower(), "discord.com/api/webhooks")
    
    if merchantValid or biomeValid then
        merchantStatusLabel.Text = "Status: Settings applied! Starting monitor..."
        if biomeValid then
            biomeStatusLabel.Text = "Status: Biome webhook set & monitoring..."
        else
            biomeStatusLabel.Text = "Status: Biome webhook not set"
        end
        wait(1)
        startMonitoring()
        mainContainer.Visible = false
        toggleBtn.Visible = true
    else
        merchantStatusLabel.Text = "Status: Set at least one webhook"
    end
end)

testBtn.MouseButton1Click:Connect(function()
    merchantWebhookUrl = merchantWebhookBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        merchantStatusLabel.Text = "Status: Sending merchant test..."
        
        local success = sendMerchantToDiscord("🧪 Test message for Jester detection", "TEST BOT", "Jester")
        
        if success then
            merchantStatusLabel.Text = "Status: Merchant test sent!"
        end
    else
        merchantStatusLabel.Text = "Status: Set merchant webhook first"
    end
end)

biomeTestBtn.MouseButton1Click:Connect(function()
    biomeWebhookUrl = biomeWebhookBox.Text
    
    if biomeWebhookUrl ~= "" and string.find(biomeWebhookUrl:lower(), "discord.com/api/webhooks") then
        biomeStatusLabel.Text = "Status: Sending biome test..."
        
        local success = sendBiomeToDiscord("[Manager]: Unexpected error occurred. [Code 404]", "Glitched")
        
        if success then
            biomeStatusLabel.Text = "Status: Biome test sent!"
        end
    else
        biomeStatusLabel.Text = "Status: Set biome webhook first"
    end
end)

print("✅ Advanced Detector Loaded!")
print("🎯 Monitoring for: 'Jester', 'Mari', GLITCHED & DREAMSPACE Biomes")
print("🌐 Features: Separate webhooks for Merchant & Biome")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Advanced Detector",
    Text = "Click 🔔 to configure settings",
    Duration = 5
})
