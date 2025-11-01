-- Jester/Mari & Biome Detector - Simple UI Version
print("=== JESTER/MARI & BIOME DETECTOR LOADED ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

-- Create Simple UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.Text = "Jester/Mari Detector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.9, 0, 0.12, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.Position = UDim2.new(0, 0, 0, 40)

-- Webhook Section
local WebhookLabel = Instance.new("TextLabel")
WebhookLabel.Parent = ContentFrame
WebhookLabel.Size = UDim2.new(0.9, 0, 0, 25)
WebhookLabel.Position = UDim2.new(0.05, 0, 0.02, 0)
WebhookLabel.BackgroundTransparency = 1
WebhookLabel.Text = "URL Webhook Discord:"
WebhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookLabel.Font = Enum.Font.GothamBold
WebhookLabel.TextSize = 14
WebhookLabel.TextXAlignment = Enum.TextXAlignment.Left

local WebhookBox = Instance.new("TextBox")
WebhookBox.Parent = ContentFrame
WebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
WebhookBox.Position = UDim2.new(0.05, 0, 0.08, 0)
WebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
WebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookBox.PlaceholderText = "Tempel URL webhook Anda di sini..."
WebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
WebhookBox.Text = ""
WebhookBox.Font = Enum.Font.Gotham
WebhookBox.TextSize = 12
WebhookBox.TextWrapped = true

local WebhookCorner = Instance.new("UICorner")
WebhookCorner.CornerRadius = UDim.new(0, 6)
WebhookCorner.Parent = WebhookBox

-- Separator Line
local Separator1 = Instance.new("Frame")
Separator1.Parent = ContentFrame
Separator1.Size = UDim2.new(0.9, 0, 0, 1)
Separator1.Position = UDim2.new(0.05, 0, 0.2, 0)
Separator1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Separator1.BorderSizePixel = 0

-- Biome Section Title
local BiomeLabel = Instance.new("TextLabel")
BiomeLabel.Parent = ContentFrame
BiomeLabel.Size = UDim2.new(0.9, 0, 0, 25)
BiomeLabel.Position = UDim2.new(0.05, 0, 0.22, 0)
BiomeLabel.BackgroundTransparency = 1
BiomeLabel.Text = "Whitelist Biome (Pilih untuk notifikasi):"
BiomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeLabel.Font = Enum.Font.GothamBold
BiomeLabel.TextSize = 14
BiomeLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Biome Webhook
local BiomeWebhookLabel = Instance.new("TextLabel")
BiomeWebhookLabel.Parent = ContentFrame
BiomeWebhookLabel.Size = UDim2.new(0.9, 0, 0, 20)
BiomeWebhookLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
BiomeWebhookLabel.BackgroundTransparency = 1
BiomeWebhookLabel.Text = "Biome Webhook (Opsional):"
BiomeWebhookLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeWebhookLabel.Font = Enum.Font.Gotham
BiomeWebhookLabel.TextSize = 12
BiomeWebhookLabel.TextXAlignment = Enum.TextXAlignment.Left

local BiomeWebhookBox = Instance.new("TextBox")
BiomeWebhookBox.Parent = ContentFrame
BiomeWebhookBox.Size = UDim2.new(0.9, 0, 0, 35)
BiomeWebhookBox.Position = UDim2.new(0.05, 0, 0.35, 0)
BiomeWebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
BiomeWebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeWebhookBox.PlaceholderText = "Webhook khusus biome (kosongkan jika sama)"
BiomeWebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
BiomeWebhookBox.Text = ""
BiomeWebhookBox.Font = Enum.Font.Gotham
BiomeWebhookBox.TextSize = 12
BiomeWebhookBox.TextWrapped = true

local BiomeWebhookCorner = Instance.new("UICorner")
BiomeWebhookCorner.CornerRadius = UDim.new(0, 6)
BiomeWebhookCorner.Parent = BiomeWebhookBox

-- Separator Line 2
local Separator2 = Instance.new("Frame")
Separator2.Parent = ContentFrame
Separator2.Size = UDim2.new(0.9, 0, 0, 1)
Separator2.Position = UDim2.new(0.05, 0, 0.5, 0)
Separator2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Separator2.BorderSizePixel = 0

-- Server Link Section
local ServerLabel = Instance.new("TextLabel")
ServerLabel.Parent = ContentFrame
ServerLabel.Size = UDim2.new(0.9, 0, 0, 25)
ServerLabel.Position = UDim2.new(0.05, 0, 0.52, 0)
ServerLabel.BackgroundTransparency = 1
ServerLabel.Text = "Private Server Link:"
ServerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerLabel.Font = Enum.Font.GothamBold
ServerLabel.TextSize = 14
ServerLabel.TextXAlignment = Enum.TextXAlignment.Left

local ServerBox = Instance.new("TextBox")
ServerBox.Parent = ContentFrame
ServerBox.Size = UDim2.new(0.9, 0, 0, 35)
ServerBox.Position = UDim2.new(0.05, 0, 0.58, 0)
ServerBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
ServerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerBox.PlaceholderText = "Link private server (opsional)..."
ServerBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
ServerBox.Text = ""
ServerBox.Font = Enum.Font.Gotham
ServerBox.TextSize = 12
ServerBox.TextWrapped = true

local ServerCorner = Instance.new("UICorner")
ServerCorner.CornerRadius = UDim.new(0, 6)
ServerCorner.Parent = ServerBox

-- Status Section
local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = ContentFrame
StatusFrame.Size = UDim2.new(0.9, 0, 0, 60)
StatusFrame.Position = UDim2.new(0.05, 0, 0.7, 0)
StatusFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 6)
StatusCorner.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusFrame
StatusLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
StatusLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Ready to setup"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextWrapped = true
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Buttons
local ButtonFrame = Instance.new("Frame")
ButtonFrame.Parent = ContentFrame
ButtonFrame.Size = UDim2.new(0.9, 0, 0, 40)
ButtonFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
ButtonFrame.BackgroundTransparency = 1

local ApplyButton = Instance.new("TextButton")
ApplyButton.Parent = ButtonFrame
ApplyButton.Size = UDim2.new(0.48, 0, 1, 0)
ApplyButton.Position = UDim2.new(0, 0, 0, 0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
ApplyButton.Text = "Apply"
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.Font = Enum.Font.GothamBold
ApplyButton.TextSize = 14

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplyButton

local TestButton = Instance.new("TextButton")
TestButton.Parent = ButtonFrame
TestButton.Size = UDim2.new(0.48, 0, 1, 0)
TestButton.Position = UDim2.new(0.52, 0, 0, 0)
TestButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
TestButton.Text = "Test"
TestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TestButton.Font = Enum.Font.GothamBold
TestButton.TextSize = 14

local TestCorner = Instance.new("UICorner")
TestCorner.CornerRadius = UDim.new(0, 6)
TestCorner.Parent = TestButton

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ToggleButton.Text = "🔔"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Visible = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = ToggleButton

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

-- ===== DRAGGING FUNCTIONALITY =====
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ===== FUNCTIONS =====
-- Merchant Discord Webhook Function
local function sendMerchantToDiscord(message, playerName, mentionType)
    local webhookToUse = merchantWebhookUrl
    if webhookToUse == "" then
        StatusLabel.Text = "Status: Webhook not set"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🚨 Merchant Detected!"
    local color = 16711680
    
    if mentionType == "Jester" then
        content = "<@&" .. ROLE_IDS.Jester .. "> "
        title = "🎭 Jester Detected!"
        color = 10181046
    elseif mentionType == "Mari" then
        content = "<@&" .. ROLE_IDS.Mari .. "> "
        title = "🌸 Mari Detected!"
        color = 15277667
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
            Url = webhookToUse,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
        return response
    end)
    
    if success then
        StatusLabel.Text = "Status: " .. mentionType .. " detected! " .. currentTime
        return true
    else
        StatusLabel.Text = "Status: Failed to send webhook"
        return false
    end
end

-- Biome Discord Webhook Function
local function sendBiomeToDiscord(message, biomeName)
    local webhookToUse = biomeWebhookUrl ~= "" and biomeWebhookUrl or merchantWebhookUrl
    if webhookToUse == "" then
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🌍 Biome Activated!"
    local color = 3447003
    
    if biomeName == "Glitched" then
        content = "<@&" .. ROLE_IDS.Glitched .. "> "
        title = "⚡ GLITCHED Biome Active!"
        color = 15105570
    elseif biomeName == "Dreamspace" then
        content = "<@&" .. ROLE_IDS.Dreamspace .. "> "
        title = "💤 DREAMSPACE Biome Active!"
        color = 10181046
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
    
    local data = {
        ["content"] = content,
        ["embeds"] = {embedData},
        ["username"] = "ROBLOX Biome Alert"
    }
    
    local success, result = pcall(function()
        local response = request({
            Url = webhookToUse,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
        return response
    end)
    
    return success
end

-- Message Detection for Merchants
local function checkMerchantMessage(message, speaker)
    local lowerMsg = string.lower(tostring(message))
    
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
        end
    end
    
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
    StatusLabel.Text = "Status: Monitoring for Jester, Mari & Biomes..."
    
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
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)

ApplyButton.MouseButton1Click:Connect(function()
    merchantWebhookUrl = WebhookBox.Text
    biomeWebhookUrl = BiomeWebhookBox.Text
    privateServerLink = ServerBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        StatusLabel.Text = "Status: Settings applied! Starting monitor..."
        wait(1)
        startMonitoring()
        MainFrame.Visible = false
        ToggleButton.Visible = true
    else
        StatusLabel.Text = "Status: Please enter valid Discord webhook"
    end
end)

TestButton.MouseButton1Click:Connect(function()
    merchantWebhookUrl = WebhookBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        StatusLabel.Text = "Status: Sending test notification..."
        
        local success = sendMerchantToDiscord("🧪 Test message for Jester detection", "TEST BOT", "Jester")
        
        if success then
            StatusLabel.Text = "Status: Test sent successfully!"
        end
    else
        StatusLabel.Text = "Status: Enter valid webhook first"
    end
end)

print("✅ Jester/Mari & Biome Detector Loaded!")
print("🔔 Click the bell button to open settings")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Detector Loaded",
    Text = "Click the 🔔 button to setup",
    Duration = 5
})
