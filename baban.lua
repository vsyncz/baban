-- Jester/Mari & Biome Detector - Simple 2-Tab UI
print("=== JESTER/MARI & BIOME DETECTOR LOADED ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

-- Create Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleDetector"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Container
local MainContainer = Instance.new("Frame")
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainContainer.Size = UDim2.new(0, 400, 0, 450)
MainContainer.Position = UDim2.new(0.5, -200, 0.5, -225)
MainContainer.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainContainer

-- Header
local Header = Instance.new("Frame")
Header.Parent = MainContainer
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
Header.Size = UDim2.new(1, 0, 0, 60)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BorderSizePixel = 0

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Jester/Mari Detector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Tab Buttons
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainContainer
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.Position = UDim2.new(0, 0, 0, 60)
TabContainer.BorderSizePixel = 0

local MerchantTab = Instance.new("TextButton")
MerchantTab.Parent = TabContainer
MerchantTab.Size = UDim2.new(0.5, 0, 1, 0)
MerchantTab.Position = UDim2.new(0, 0, 0, 0)
MerchantTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
MerchantTab.Text = "- Merchant"
MerchantTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MerchantTab.Font = Enum.Font.GothamBold
MerchantTab.TextSize = 14
MerchantTab.BorderSizePixel = 0

local BiomeTab = Instance.new("TextButton")
BiomeTab.Parent = TabContainer
BiomeTab.Size = UDim2.new(0.5, 0, 1, 0)
BiomeTab.Position = UDim2.new(0.5, 0, 0, 0)
BiomeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
BiomeTab.Text = "- Biome"
BiomeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeTab.Font = Enum.Font.Gotham
BiomeTab.TextSize = 14
BiomeTab.BorderSizePixel = 0

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainContainer
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ContentFrame.Size = UDim2.new(1, 0, 1, -100)
ContentFrame.Position = UDim2.new(0, 0, 0, 100)
ContentFrame.BorderSizePixel = 0

-- ===== MERCHANT TAB CONTENT =====
local MerchantContent = Instance.new("Frame")
MerchantContent.Parent = ContentFrame
MerchantContent.BackgroundTransparency = 1
MerchantContent.Size = UDim2.new(1, 0, 1, 0)
MerchantContent.Position = UDim2.new(0, 0, 0, 0)
MerchantContent.Visible = true

-- Webhook Section
local WebhookSection = Instance.new("Frame")
WebhookSection.Parent = MerchantContent
WebhookSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
WebhookSection.Size = UDim2.new(0.9, 0, 0, 120)
WebhookSection.Position = UDim2.new(0.05, 0, 0.05, 0)

local WebhookCorner = Instance.new("UICorner")
WebhookCorner.CornerRadius = UDim.new(0, 6)
WebhookCorner.Parent = WebhookSection

local WebhookLabel = Instance.new("TextLabel")
WebhookLabel.Parent = WebhookSection
WebhookLabel.BackgroundTransparency = 1
WebhookLabel.Size = UDim2.new(0.9, 0, 0, 30)
WebhookLabel.Position = UDim2.new(0.05, 0, 0, 0)
WebhookLabel.Text = "Discord Webhook:"
WebhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookLabel.Font = Enum.Font.GothamBold
WebhookLabel.TextSize = 14
WebhookLabel.TextXAlignment = Enum.TextXAlignment.Left

local WebhookBox = Instance.new("TextBox")
WebhookBox.Parent = WebhookSection
WebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
WebhookBox.Position = UDim2.new(0.05, 0, 0.35, 0)
WebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
WebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookBox.PlaceholderText = "Paste webhook URL here..."
WebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
WebhookBox.Text = ""
WebhookBox.Font = Enum.Font.Gotham
WebhookBox.TextSize = 12
WebhookBox.TextWrapped = true

local WebhookBoxCorner = Instance.new("UICorner")
WebhookBoxCorner.CornerRadius = UDim.new(0, 4)
WebhookBoxCorner.Parent = WebhookBox

-- Server Link Section
local ServerSection = Instance.new("Frame")
ServerSection.Parent = MerchantContent
ServerSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ServerSection.Size = UDim2.new(0.9, 0, 0, 80)
ServerSection.Position = UDim2.new(0.05, 0, 0.35, 0)

local ServerCorner = Instance.new("UICorner")
ServerCorner.CornerRadius = UDim.new(0, 6)
ServerCorner.Parent = ServerSection

local ServerLabel = Instance.new("TextLabel")
ServerLabel.Parent = ServerSection
ServerLabel.BackgroundTransparency = 1
ServerLabel.Size = UDim2.new(0.9, 0, 0, 30)
ServerLabel.Position = UDim2.new(0.05, 0, 0, 0)
ServerLabel.Text = "Private Server Link:"
ServerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerLabel.Font = Enum.Font.GothamBold
ServerLabel.TextSize = 14
ServerLabel.TextXAlignment = Enum.TextXAlignment.Left

local ServerBox = Instance.new("TextBox")
ServerBox.Parent = ServerSection
ServerBox.Size = UDim2.new(0.9, 0, 0, 35)
ServerBox.Position = UDim2.new(0.05, 0, 0.45, 0)
ServerBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
ServerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerBox.PlaceholderText = "Private server link (optional)..."
ServerBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
ServerBox.Text = ""
ServerBox.Font = Enum.Font.Gotham
ServerBox.TextSize = 12
ServerBox.TextWrapped = true

local ServerBoxCorner = Instance.new("UICorner")
ServerBoxCorner.CornerRadius = UDim.new(0, 4)
ServerBoxCorner.Parent = ServerBox

-- Action Buttons
local ActionFrame = Instance.new("Frame")
ActionFrame.Parent = MerchantContent
ActionFrame.BackgroundTransparency = 1
ActionFrame.Size = UDim2.new(0.9, 0, 0, 40)
ActionFrame.Position = UDim2.new(0.05, 0, 0.65, 0)

local ApplyButton = Instance.new("TextButton")
ApplyButton.Parent = ActionFrame
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
TestButton.Parent = ActionFrame
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

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MerchantContent
StatusLabel.BackgroundTransparency = 1
StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
StatusLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
StatusLabel.Text = "Status: Ready to setup"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextWrapped = true

-- ===== BIOME TAB CONTENT =====
local BiomeContent = Instance.new("Frame")
BiomeContent.Parent = ContentFrame
BiomeContent.BackgroundTransparency = 1
BiomeContent.Size = UDim2.new(1, 0, 1, 0)
BiomeContent.Position = UDim2.new(0, 0, 0, 0)
BiomeContent.Visible = false

-- Biome Info Section
local BiomeInfoSection = Instance.new("Frame")
BiomeInfoSection.Parent = BiomeContent
BiomeInfoSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
BiomeInfoSection.Size = UDim2.new(0.9, 0, 0, 200)
BiomeInfoSection.Position = UDim2.new(0.05, 0, 0.05, 0)

local BiomeInfoCorner = Instance.new("UICorner")
BiomeInfoCorner.CornerRadius = UDim.new(0, 6)
BiomeInfoCorner.Parent = BiomeInfoSection

local BiomeTitle = Instance.new("TextLabel")
BiomeTitle.Parent = BiomeInfoSection
BiomeTitle.BackgroundTransparency = 1
BiomeTitle.Size = UDim2.new(0.9, 0, 0, 30)
BiomeTitle.Position = UDim2.new(0.05, 0, 0, 0)
BiomeTitle.Text = "Biome Detection"
BiomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeTitle.Font = Enum.Font.GothamBold
BiomeTitle.TextSize = 16
BiomeTitle.TextXAlignment = Enum.TextXAlignment.Left

local BiomeInfo = Instance.new("TextLabel")
BiomeInfo.Parent = BiomeInfoSection
BiomeInfo.BackgroundTransparency = 1
BiomeInfo.Size = UDim2.new(0.9, 0, 0, 150)
BiomeInfo.Position = UDim2.new(0.05, 0, 0.2, 0)
BiomeInfo.Text = "Auto-detects these biome messages:\n\n⚡ GLITCHED BIOME:\n• [Manager]: Unexpected error occurred. [Code 404]\n• [Manager]: [Code 404] has resolved.\n\n💤 DREAMSPACE BIOME:\n• [Dreamspace]: You begin to feel sleepy...\n• [Dreamspace]: Waking up...\n\nBiome detection starts automatically with merchant detection."
BiomeInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeInfo.Font = Enum.Font.Gotham
BiomeInfo.TextSize = 12
BiomeInfo.TextWrapped = true
BiomeInfo.TextXAlignment = Enum.TextXAlignment.Left

-- Biome Status
local BiomeStatusSection = Instance.new("Frame")
BiomeStatusSection.Parent = BiomeContent
BiomeStatusSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
BiomeStatusSection.Size = UDim2.new(0.9, 0, 0, 80)
BiomeStatusSection.Position = UDim2.new(0.05, 0, 0.65, 0)

local BiomeStatusCorner = Instance.new("UICorner")
BiomeStatusCorner.CornerRadius = UDim.new(0, 6)
BiomeStatusCorner.Parent = BiomeStatusSection

local BiomeStatusLabel = Instance.new("TextLabel")
BiomeStatusLabel.Parent = BiomeStatusSection
BiomeStatusLabel.BackgroundTransparency = 1
BiomeStatusLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
BiomeStatusLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
BiomeStatusLabel.Text = "Biome Monitoring Status:\n• GLITCHED: Ready\n• DREAMSPACE: Ready"
BiomeStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeStatusLabel.Font = Enum.Font.Gotham
BiomeStatusLabel.TextSize = 12
BiomeStatusLabel.TextWrapped = true
BiomeStatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ToggleButton.Text = "🔔"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Visible = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainContainer
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(0.95, -25, 0.02, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

-- ===== VARIABLES & CONFIGURATION =====
local merchantWebhookUrl = ""
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
    MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainContainer.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ===== TAB FUNCTIONS =====
local function switchToTab(tabName)
    MerchantContent.Visible = false
    BiomeContent.Visible = false
    
    MerchantTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    BiomeTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    
    MerchantTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    BiomeTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    
    MerchantTab.Font = Enum.Font.Gotham
    BiomeTab.Font = Enum.Font.Gotham
    
    if tabName == "merchant" then
        MerchantContent.Visible = true
        MerchantTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        MerchantTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        MerchantTab.Font = Enum.Font.GothamBold
    elseif tabName == "biome" then
        BiomeContent.Visible = true
        BiomeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        BiomeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        BiomeTab.Font = Enum.Font.GothamBold
    end
end

-- ===== DETECTION FUNCTIONS =====
local function sendToDiscord(message, playerName, mentionType)
    if merchantWebhookUrl == "" then
        StatusLabel.Text = "Status: Webhook not set"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    local title = "🚨 Detection Alert!"
    local color = 16711680
    
    if mentionType == "Jester" then
        content = "<@&" .. ROLE_IDS.Jester .. "> "
        title = "🎭 Jester Detected!"
        color = 10181046
    elseif mentionType == "Mari" then
        content = "<@&" .. ROLE_IDS.Mari .. "> "
        title = "🌸 Mari Detected!"
        color = 15277667
    elseif mentionType == "Glitched" then
        content = "<@&" .. ROLE_IDS.Glitched .. "> "
        title = "⚡ GLITCHED Biome Active!"
        color = 15105570
    elseif mentionType == "Dreamspace" then
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
                ["name"] = "Source",
                ["value"] = playerName or "System",
                ["inline"] = true
            },
            {
                ["name"] = "Type",
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
            ["text"] = "Jester/Mari Detector"
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
        StatusLabel.Text = "Status: " .. mentionType .. " detected! " .. currentTime
        return true
    else
        StatusLabel.Text = "Status: Failed to send webhook"
        return false
    end
end

local function checkAllMessages(message, speaker)
    local lowerMsg = string.lower(tostring(message))
    
    -- Check merchants
    if string.find(lowerMsg, "jester") then
        local fullMessage = speaker .. ": " .. message
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
            sendToDiscord(fullMessage, speaker, "Jester")
        end
    end
    
    if string.find(lowerMsg, "mari") then
        local fullMessage = speaker .. ": " .. message
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
            sendToDiscord(fullMessage, speaker, "Mari")
        end
    end
    
    -- Check biomes
    for biomeName, patterns in pairs(BIOME_PATTERNS) do
        for _, pattern in ipairs(patterns) do
            if string.find(message, pattern) then
                local fullMessage = speaker .. ": " .. message
                if not table.find(detectedMessages, fullMessage) then
                    table.insert(detectedMessages, fullMessage)
                    if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
                    sendToDiscord(fullMessage, "System", biomeName)
                end
                break
            end
        end
    end
end

local function startMonitoring()
    if isMonitoring then return end
    isMonitoring = true
    StatusLabel.Text = "Status: Monitoring active..."
    
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
end

-- ===== EVENT HANDLERS =====
CloseButton.MouseButton1Click:Connect(function()
    MainContainer.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainContainer.Visible = true
    ToggleButton.Visible = false
end)

MerchantTab.MouseButton1Click:Connect(function() switchToTab("merchant") end)
BiomeTab.MouseButton1Click:Connect(function() switchToTab("biome") end)

ApplyButton.MouseButton1Click:Connect(function()
    merchantWebhookUrl = WebhookBox.Text
    privateServerLink = ServerBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        StatusLabel.Text = "Status: Starting monitor..."
        wait(1)
        startMonitoring()
        MainContainer.Visible = false
        ToggleButton.Visible = true
    else
        StatusLabel.Text = "Status: Invalid webhook URL"
    end
end)

TestButton.MouseButton1Click:Connect(function()
    merchantWebhookUrl = WebhookBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        StatusLabel.Text = "Status: Sending test..."
        local success = sendToDiscord("🧪 Test notification from detector", "TEST", "Jester")
        if success then
            StatusLabel.Text = "Status: Test sent!"
        end
    else
        StatusLabel.Text = "Status: Set webhook first"
    end
end)

-- Initialize
switchToTab("merchant")
print("✅ Simple 2-Tab Detector Loaded!")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jester/Mari Detector",
    Text = "Click the 🔔 button to open",
    Duration = 5
})
