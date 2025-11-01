-- Jester/Mari & Biome Detector - amba Hub Style
print("=== JESTER/MARI & BIOME DETECTOR LOADED ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ambaHubStyle"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Container
local MainContainer = Instance.new("Frame")
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainContainer.Size = UDim2.new(0, 450, 0, 500)
MainContainer.Position = UDim2.new(0.5, -225, 0.5, -250)
MainContainer.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

-- Header
local Header = Instance.new("Frame")
Header.Parent = MainContainer
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Header.Size = UDim2.new(1, 0, 0, 80)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BorderSizePixel = 0

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.6, 0)
Title.Position = UDim2.new(0, 0, 0.1, 0)
Title.Text = "Jester/Mari Detector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextStrokeTransparency = 0.8

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = Header
Subtitle.BackgroundTransparency = 1
Subtitle.Size = UDim2.new(1, 0, 0.4, 0)
Subtitle.Position = UDim2.new(0, 0, 0.6, 0)
Subtitle.Text = "Monitor & Alert System"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 14

-- Tab Buttons Container
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainContainer
TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TabContainer.Size = UDim2.new(1, 0, 0, 50)
TabContainer.Position = UDim2.new(0, 0, 0, 80)
TabContainer.BorderSizePixel = 0

-- Tab Buttons
local MainTab = Instance.new("TextButton")
MainTab.Parent = TabContainer
MainTab.Size = UDim2.new(0.25, 0, 1, 0)
MainTab.Position = UDim2.new(0, 0, 0, 0)
MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MainTab.Text = "Main"
MainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTab.Font = Enum.Font.GothamBold
MainTab.TextSize = 14
MainTab.BorderSizePixel = 0

local EasyWayTab = Instance.new("TextButton")
EasyWayTab.Parent = TabContainer
EasyWayTab.Size = UDim2.new(0.25, 0, 1, 0)
EasyWayTab.Position = UDim2.new(0.25, 0, 0, 0)
EasyWayTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
EasyWayTab.Text = "Easy-way"
EasyWayTab.TextColor3 = Color3.fromRGB(200, 200, 200)
EasyWayTab.Font = Enum.Font.Gotham
EasyWayTab.TextSize = 14
EasyWayTab.BorderSizePixel = 0

local BetaTab = Instance.new("TextButton")
BetaTab.Parent = TabContainer
BetaTab.Size = UDim2.new(0.25, 0, 1, 0)
BetaTab.Position = UDim2.new(0.5, 0, 0, 0)
BetaTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
BetaTab.Text = "Biome"
BetaTab.TextColor3 = Color3.fromRGB(200, 200, 200)
BetaTab.Font = Enum.Font.Gotham
BetaTab.TextSize = 14
BetaTab.BorderSizePixel = 0

local InfoTab = Instance.new("TextButton")
InfoTab.Parent = TabContainer
InfoTab.Size = UDim2.new(0.25, 0, 1, 0)
InfoTab.Position = UDim2.new(0.75, 0, 0, 0)
InfoTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
InfoTab.Text = "INFO"
InfoTab.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoTab.Font = Enum.Font.Gotham
InfoTab.TextSize = 14
InfoTab.BorderSizePixel = 0

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainContainer
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ContentFrame.Size = UDim2.new(1, 0, 1, -130)
ContentFrame.Position = UDim2.new(0, 0, 0, 130)
ContentFrame.BorderSizePixel = 0

-- ===== MAIN TAB CONTENT =====
local MainContent = Instance.new("Frame")
MainContent.Parent = ContentFrame
MainContent.BackgroundTransparency = 1
MainContent.Size = UDim2.new(1, 0, 1, 0)
MainContent.Position = UDim2.new(0, 0, 0, 0)
MainContent.Visible = true

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Parent = MainContent
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Size = UDim2.new(1, 0, 0, 40)
WelcomeLabel.Position = UDim2.new(0, 0, 0, 20)
WelcomeLabel.Text = "Welcome to Jester/Mari Detector!"
WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextSize = 18

-- Webhook Section
local WebhookSection = Instance.new("Frame")
WebhookSection.Parent = MainContent
WebhookSection.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
WebhookSection.Size = UDim2.new(0.9, 0, 0, 120)
WebhookSection.Position = UDim2.new(0.05, 0, 0.15, 0)

local WebhookCorner = Instance.new("UICorner")
WebhookCorner.CornerRadius = UDim.new(0, 8)
WebhookCorner.Parent = WebhookSection

local WebhookLabel = Instance.new("TextLabel")
WebhookLabel.Parent = WebhookSection
WebhookLabel.BackgroundTransparency = 1
WebhookLabel.Size = UDim2.new(0.9, 0, 0, 30)
WebhookLabel.Position = UDim2.new(0.05, 0, 0, 0)
WebhookLabel.Text = "Discord Webhook URL:"
WebhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookLabel.Font = Enum.Font.GothamBold
WebhookLabel.TextSize = 14
WebhookLabel.TextXAlignment = Enum.TextXAlignment.Left

local WebhookBox = Instance.new("TextBox")
WebhookBox.Parent = WebhookSection
WebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
WebhookBox.Position = UDim2.new(0.05, 0, 0.3, 0)
WebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
WebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookBox.PlaceholderText = "Paste Discord webhook URL here..."
WebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
WebhookBox.Text = ""
WebhookBox.Font = Enum.Font.Gotham
WebhookBox.TextSize = 12
WebhookBox.TextWrapped = true

local WebhookBoxCorner = Instance.new("UICorner")
WebhookBoxCorner.CornerRadius = UDim.new(0, 6)
WebhookBoxCorner.Parent = WebhookBox

-- Server Link Section
local ServerSection = Instance.new("Frame")
ServerSection.Parent = MainContent
ServerSection.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ServerSection.Size = UDim2.new(0.9, 0, 0, 80)
ServerSection.Position = UDim2.new(0.05, 0, 0.45, 0)

local ServerCorner = Instance.new("UICorner")
ServerCorner.CornerRadius = UDim.new(0, 8)
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
ServerBoxCorner.CornerRadius = UDim.new(0, 6)
ServerBoxCorner.Parent = ServerBox

-- Action Buttons
local ActionFrame = Instance.new("Frame")
ActionFrame.Parent = MainContent
ActionFrame.BackgroundTransparency = 1
ActionFrame.Size = UDim2.new(0.9, 0, 0, 50)
ActionFrame.Position = UDim2.new(0.05, 0, 0.75, 0)

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
ApplyCorner.CornerRadius = UDim.new(0, 8)
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
TestCorner.CornerRadius = UDim.new(0, 8)
TestCorner.Parent = TestButton

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainContent
StatusLabel.BackgroundTransparency = 1
StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
StatusLabel.Position = UDim2.new(0.05, 0, 0.9, 0)
StatusLabel.Text = "Status: Ready to setup"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextWrapped = true

-- ===== EASY-WAY TAB CONTENT =====
local EasyWayContent = Instance.new("Frame")
EasyWayContent.Parent = ContentFrame
EasyWayContent.BackgroundTransparency = 1
EasyWayContent.Size = UDim2.new(1, 0, 1, 0)
EasyWayContent.Position = UDim2.new(0, 0, 0, 0)
EasyWayContent.Visible = false

local EasyWayTitle = Instance.new("TextLabel")
EasyWayTitle.Parent = EasyWayContent
EasyWayTitle.BackgroundTransparency = 1
EasyWayTitle.Size = UDim2.new(1, 0, 0, 40)
EasyWayTitle.Position = UDim2.new(0, 0, 0, 20)
EasyWayTitle.Text = "Quick Setup"
EasyWayTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EasyWayTitle.Font = Enum.Font.GothamBold
EasyWayTitle.TextSize = 18

local QuickInfo = Instance.new("TextLabel")
QuickInfo.Parent = EasyWayContent
QuickInfo.BackgroundTransparency = 1
QuickInfo.Size = UDim2.new(0.9, 0, 0, 150)
QuickInfo.Position = UDim2.new(0.05, 0, 0.15, 0)
QuickInfo.Text = "Simply paste your Discord webhook and click 'Apply' to start monitoring.\n\n• Detects 'Jester' and 'Mari' in chat\n• Auto-sends Discord notifications\n• Includes role mentions\n• Works in background"
QuickInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
QuickInfo.Font = Enum.Font.Gotham
QuickInfo.TextSize = 12
QuickInfo.TextWrapped = true
QuickInfo.TextXAlignment = Enum.TextXAlignment.Left

-- ===== BIOME TAB CONTENT =====
local BiomeContent = Instance.new("Frame")
BiomeContent.Parent = ContentFrame
BiomeContent.BackgroundTransparency = 1
BiomeContent.Size = UDim2.new(1, 0, 1, 0)
BiomeContent.Position = UDim2.new(0, 0, 0, 0)
BiomeContent.Visible = false

local BiomeTitle = Instance.new("TextLabel")
BiomeTitle.Parent = BiomeContent
BiomeTitle.BackgroundTransparency = 1
BiomeTitle.Size = UDim2.new(1, 0, 0, 40)
BiomeTitle.Position = UDim2.new(0, 0, 0, 20)
BiomeTitle.Text = "Biome Detection"
BiomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeTitle.Font = Enum.Font.GothamBold
BiomeTitle.TextSize = 18

local BiomeInfo = Instance.new("TextLabel")
BiomeInfo.Parent = BiomeContent
BiomeInfo.BackgroundTransparency = 1
BiomeInfo.Size = UDim2.new(0.9, 0, 0, 200)
BiomeInfo.Position = UDim2.new(0.05, 0, 0.15, 0)
BiomeInfo.Text = "Auto-detects these biome messages:\n\n⚡ GLITCHED BIOME:\n• [Manager]: Unexpected error occurred. [Code 404]\n• [Manager]: [Code 404] has resolved.\n\n💤 DREAMSPACE BIOME:\n• [Dreamspace]: You begin to feel sleepy...\n• [Dreamspace]: Waking up...\n\nBiome detection starts automatically with merchant detection."
BiomeInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeInfo.Font = Enum.Font.Gotham
BiomeInfo.TextSize = 12
BiomeInfo.TextWrapped = true
BiomeInfo.TextXAlignment = Enum.TextXAlignment.Left

-- ===== INFO TAB CONTENT =====
local InfoContent = Instance.new("Frame")
InfoContent.Parent = ContentFrame
InfoContent.BackgroundTransparency = 1
InfoContent.Size = UDim2.new(1, 0, 1, 0)
InfoContent.Position = UDim2.new(0, 0, 0, 0)
InfoContent.Visible = false

local InfoTitle = Instance.new("TextLabel")
InfoTitle.Parent = InfoContent
InfoTitle.BackgroundTransparency = 1
InfoTitle.Size = UDim2.new(1, 0, 0, 40)
InfoTitle.Position = UDim2.new(0, 0, 0, 20)
InfoTitle.Text = "Information"
InfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.TextSize = 18

local InfoText = Instance.new("TextLabel")
InfoText.Parent = InfoContent
InfoText.BackgroundTransparency = 1
InfoText.Size = UDim2.new(0.9, 0, 0, 200)
InfoText.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoText.Text = "Jester/Mari Detector v2.0\n\nFEATURES:\n• Real-time chat monitoring\n• Discord webhook integration\n• Role mention system\n• Biome detection\n• Private server support\n\nHOW TO USE:\n1. Paste Discord webhook\n2. Click 'Apply'\n3. Start monitoring!"
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 12
InfoText.TextWrapped = true
InfoText.TextXAlignment = Enum.TextXAlignment.Left

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ToggleButton.Text = "🔔"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.Visible = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

-- Close Button (Small X on top right)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainContainer
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(0.95, -25, 0.02, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 12
CloseButton.ZIndex = 2

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
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
    MainContent.Visible = false
    EasyWayContent.Visible = false
    BiomeContent.Visible = false
    InfoContent.Visible = false
    
    MainTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    EasyWayTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    BetaTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    InfoTab.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    
    MainTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    EasyWayTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    BetaTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    InfoTab.TextColor3 = Color3.fromRGB(200, 200, 200)
    
    MainTab.Font = Enum.Font.Gotham
    EasyWayTab.Font = Enum.Font.Gotham
    BetaTab.Font = Enum.Font.Gotham
    InfoTab.Font = Enum.Font.Gotham
    
    if tabName == "main" then
        MainContent.Visible = true
        MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        MainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        MainTab.Font = Enum.Font.GothamBold
    elseif tabName == "easyway" then
        EasyWayContent.Visible = true
        EasyWayTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        EasyWayTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        EasyWayTab.Font = Enum.Font.GothamBold
    elseif tabName == "biome" then
        BiomeContent.Visible = true
        BetaTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        BetaTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        BetaTab.Font = Enum.Font.GothamBold
    elseif tabName == "info" then
        InfoContent.Visible = true
        InfoTab.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        InfoTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        InfoTab.Font = Enum.Font.GothamBold
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
            ["text"] = "amba Hub Detector"
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

MainTab.MouseButton1Click:Connect(function() switchToTab("main") end)
EasyWayTab.MouseButton1Click:Connect(function() switchToTab("easyway") end)
BetaTab.MouseButton1Click:Connect(function() switchToTab("biome") end)
InfoTab.MouseButton1Click:Connect(function() switchToTab("info") end)

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
        local success = sendToDiscord("🧪 Test notification from amba Hub", "TEST", "Jester")
        if success then
            StatusLabel.Text = "Status: Test sent!"
        end
    else
        StatusLabel.Text = "Status: Set webhook first"
    end
end)

-- Initialize
switchToTab("main")
print("✅ amba Hub Style Detector Loaded!")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "amba Hub Detector",
    Text = "Click the 🔔 button to open",
    Duration = 5
})
