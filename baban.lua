-- Jester/Mari & Biome Detector - Toggle On/Off Version
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
MainContainer.Size = UDim2.new(0, 400, 0, 500)
MainContainer.Position = UDim2.new(0.5, -200, 0.5, -250)
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

local MerchantWebhookBox = Instance.new("TextBox")
MerchantWebhookBox.Parent = WebhookSection
MerchantWebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
MerchantWebhookBox.Position = UDim2.new(0.05, 0, 0.35, 0)
MerchantWebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
MerchantWebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MerchantWebhookBox.PlaceholderText = "Paste webhook URL for Merchant alerts..."
MerchantWebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
MerchantWebhookBox.Text = ""
MerchantWebhookBox.Font = Enum.Font.Gotham
MerchantWebhookBox.TextSize = 12
MerchantWebhookBox.TextWrapped = true

local WebhookBoxCorner = Instance.new("UICorner")
WebhookBoxCorner.CornerRadius = UDim.new(0, 4)
WebhookBoxCorner.Parent = MerchantWebhookBox

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

local MerchantServerBox = Instance.new("TextBox")
MerchantServerBox.Parent = ServerSection
MerchantServerBox.Size = UDim2.new(0.9, 0, 0, 35)
MerchantServerBox.Position = UDim2.new(0.05, 0, 0.45, 0)
MerchantServerBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
MerchantServerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MerchantServerBox.PlaceholderText = "Private server link (optional)..."
MerchantServerBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
MerchantServerBox.Text = ""
MerchantServerBox.Font = Enum.Font.Gotham
MerchantServerBox.TextSize = 12
MerchantServerBox.TextWrapped = true

local ServerBoxCorner = Instance.new("UICorner")
ServerBoxCorner.CornerRadius = UDim.new(0, 4)
ServerBoxCorner.Parent = MerchantServerBox

-- Action Buttons
local MerchantActionFrame = Instance.new("Frame")
MerchantActionFrame.Parent = MerchantContent
MerchantActionFrame.BackgroundTransparency = 1
MerchantActionFrame.Size = UDim2.new(0.9, 0, 0, 40)
MerchantActionFrame.Position = UDim2.new(0.05, 0, 0.65, 0)

local MerchantToggleButton = Instance.new("TextButton")
MerchantToggleButton.Parent = MerchantActionFrame
MerchantToggleButton.Size = UDim2.new(0.48, 0, 1, 0)
MerchantToggleButton.Position = UDim2.new(0, 0, 0, 0)
MerchantToggleButton.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
MerchantToggleButton.Text = "OFF"
MerchantToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MerchantToggleButton.Font = Enum.Font.GothamBold
MerchantToggleButton.TextSize = 14

local MerchantToggleCorner = Instance.new("UICorner")
MerchantToggleCorner.CornerRadius = UDim.new(0, 6)
MerchantToggleCorner.Parent = MerchantToggleButton

local MerchantTestButton = Instance.new("TextButton")
MerchantTestButton.Parent = MerchantActionFrame
MerchantTestButton.Size = UDim2.new(0.48, 0, 1, 0)
MerchantTestButton.Position = UDim2.new(0.52, 0, 0, 0)
MerchantTestButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
MerchantTestButton.Text = "Test"
MerchantTestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MerchantTestButton.Font = Enum.Font.GothamBold
MerchantTestButton.TextSize = 14

local MerchantTestCorner = Instance.new("UICorner")
MerchantTestCorner.CornerRadius = UDim.new(0, 6)
MerchantTestCorner.Parent = MerchantTestButton

-- Status Label
local MerchantStatusLabel = Instance.new("TextLabel")
MerchantStatusLabel.Parent = MerchantContent
MerchantStatusLabel.BackgroundTransparency = 1
MerchantStatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
MerchantStatusLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
MerchantStatusLabel.Text = "Status: Ready - Set webhook and toggle ON"
MerchantStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
MerchantStatusLabel.Font = Enum.Font.Gotham
MerchantStatusLabel.TextSize = 12
MerchantStatusLabel.TextWrapped = true

-- ===== BIOME TAB CONTENT =====
local BiomeContent = Instance.new("Frame")
BiomeContent.Parent = ContentFrame
BiomeContent.BackgroundTransparency = 1
BiomeContent.Size = UDim2.new(1, 0, 1, 0)
BiomeContent.Position = UDim2.new(0, 0, 0, 0)
BiomeContent.Visible = false

-- Biome Webhook Section
local BiomeWebhookSection = Instance.new("Frame")
BiomeWebhookSection.Parent = BiomeContent
BiomeWebhookSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
BiomeWebhookSection.Size = UDim2.new(0.9, 0, 0, 120)
BiomeWebhookSection.Position = UDim2.new(0.05, 0, 0.05, 0)

local BiomeWebhookCorner = Instance.new("UICorner")
BiomeWebhookCorner.CornerRadius = UDim.new(0, 6)
BiomeWebhookCorner.Parent = BiomeWebhookSection

local BiomeWebhookLabel = Instance.new("TextLabel")
BiomeWebhookLabel.Parent = BiomeWebhookSection
BiomeWebhookLabel.BackgroundTransparency = 1
BiomeWebhookLabel.Size = UDim2.new(0.9, 0, 0, 30)
BiomeWebhookLabel.Position = UDim2.new(0.05, 0, 0, 0)
BiomeWebhookLabel.Text = "Discord Webhook:"
BiomeWebhookLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeWebhookLabel.Font = Enum.Font.GothamBold
BiomeWebhookLabel.TextSize = 14
BiomeWebhookLabel.TextXAlignment = Enum.TextXAlignment.Left

local BiomeWebhookBox = Instance.new("TextBox")
BiomeWebhookBox.Parent = BiomeWebhookSection
BiomeWebhookBox.Size = UDim2.new(0.9, 0, 0, 40)
BiomeWebhookBox.Position = UDim2.new(0.05, 0, 0.35, 0)
BiomeWebhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
BiomeWebhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeWebhookBox.PlaceholderText = "Paste webhook URL for Biome alerts..."
BiomeWebhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
BiomeWebhookBox.Text = ""
BiomeWebhookBox.Font = Enum.Font.Gotham
BiomeWebhookBox.TextSize = 12
BiomeWebhookBox.TextWrapped = true

local BiomeWebhookBoxCorner = Instance.new("UICorner")
BiomeWebhookBoxCorner.CornerRadius = UDim.new(0, 4)
BiomeWebhookBoxCorner.Parent = BiomeWebhookBox

-- Biome Server Link Section
local BiomeServerSection = Instance.new("Frame")
BiomeServerSection.Parent = BiomeContent
BiomeServerSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
BiomeServerSection.Size = UDim2.new(0.9, 0, 0, 80)
BiomeServerSection.Position = UDim2.new(0.05, 0, 0.35, 0)

local BiomeServerCorner = Instance.new("UICorner")
BiomeServerCorner.CornerRadius = UDim.new(0, 6)
BiomeServerCorner.Parent = BiomeServerSection

local BiomeServerLabel = Instance.new("TextLabel")
BiomeServerLabel.Parent = BiomeServerSection
BiomeServerLabel.BackgroundTransparency = 1
BiomeServerLabel.Size = UDim2.new(0.9, 0, 0, 30)
BiomeServerLabel.Position = UDim2.new(0.05, 0, 0, 0)
BiomeServerLabel.Text = "Private Server Link:"
BiomeServerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeServerLabel.Font = Enum.Font.GothamBold
BiomeServerLabel.TextSize = 14
BiomeServerLabel.TextXAlignment = Enum.TextXAlignment.Left

local BiomeServerBox = Instance.new("TextBox")
BiomeServerBox.Parent = BiomeServerSection
BiomeServerBox.Size = UDim2.new(0.9, 0, 0, 35)
BiomeServerBox.Position = UDim2.new(0.05, 0, 0.45, 0)
BiomeServerBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
BiomeServerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeServerBox.PlaceholderText = "Private server link (optional)..."
BiomeServerBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
BiomeServerBox.Text = ""
BiomeServerBox.Font = Enum.Font.Gotham
BiomeServerBox.TextSize = 12
BiomeServerBox.TextWrapped = true

local BiomeServerBoxCorner = Instance.new("UICorner")
BiomeServerBoxCorner.CornerRadius = UDim.new(0, 4)
BiomeServerBoxCorner.Parent = BiomeServerBox

-- Biome Action Buttons
local BiomeActionFrame = Instance.new("Frame")
BiomeActionFrame.Parent = BiomeContent
BiomeActionFrame.BackgroundTransparency = 1
BiomeActionFrame.Size = UDim2.new(0.9, 0, 0, 40)
BiomeActionFrame.Position = UDim2.new(0.05, 0, 0.65, 0)

local BiomeToggleButton = Instance.new("TextButton")
BiomeToggleButton.Parent = BiomeActionFrame
BiomeToggleButton.Size = UDim2.new(0.48, 0, 1, 0)
BiomeToggleButton.Position = UDim2.new(0, 0, 0, 0)
BiomeToggleButton.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
BiomeToggleButton.Text = "OFF"
BiomeToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeToggleButton.Font = Enum.Font.GothamBold
BiomeToggleButton.TextSize = 14

local BiomeToggleCorner = Instance.new("UICorner")
BiomeToggleCorner.CornerRadius = UDim.new(0, 6)
BiomeToggleCorner.Parent = BiomeToggleButton

local BiomeTestButton = Instance.new("TextButton")
BiomeTestButton.Parent = BiomeActionFrame
BiomeTestButton.Size = UDim2.new(0.48, 0, 1, 0)
BiomeTestButton.Position = UDim2.new(0.52, 0, 0, 0)
BiomeTestButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
BiomeTestButton.Text = "Test"
BiomeTestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BiomeTestButton.Font = Enum.Font.GothamBold
BiomeTestButton.TextSize = 14

local BiomeTestCorner = Instance.new("UICorner")
BiomeTestCorner.CornerRadius = UDim.new(0, 6)
BiomeTestCorner.Parent = BiomeTestButton

-- Biome Status Label
local BiomeStatusLabel = Instance.new("TextLabel")
BiomeStatusLabel.Parent = BiomeContent
BiomeStatusLabel.BackgroundTransparency = 1
BiomeStatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
BiomeStatusLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
BiomeStatusLabel.Text = "Status: Ready - Set webhook and toggle ON"
BiomeStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
BiomeStatusLabel.Font = Enum.Font.Gotham
BiomeStatusLabel.TextSize = 12
BiomeStatusLabel.TextWrapped = true

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
local biomeWebhookUrl = ""
local merchantPrivateServerLink = ""
local biomePrivateServerLink = ""
local isMerchantMonitoring = false
local isBiomeMonitoring = false
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
local function sendMerchantToDiscord(message, playerName, mentionType)
    if merchantWebhookUrl == "" then
        MerchantStatusLabel.Text = "Status: Merchant webhook not set"
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
    
    if merchantPrivateServerLink ~= "" then
        table.insert(embedData.fields, {
            ["name"] = "Private Server",
            ["value"] = merchantPrivateServerLink,
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
        MerchantStatusLabel.Text = "Status: " .. mentionType .. " detected! " .. currentTime
        return true
    else
        MerchantStatusLabel.Text = "Status: Failed to send merchant webhook"
        return false
    end
end

local function sendBiomeToDiscord(message, biomeName)
    if biomeWebhookUrl == "" then
        BiomeStatusLabel.Text = "Status: Biome webhook not set"
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
    
    if biomePrivateServerLink ~= "" then
        table.insert(embedData.fields, {
            ["name"] = "Private Server",
            ["value"] = biomePrivateServerLink,
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
        BiomeStatusLabel.Text = "Status: " .. biomeName .. " detected! " .. currentTime
        return true
    else
        BiomeStatusLabel.Text = "Status: Failed to send biome webhook"
        return false
    end
end

local function checkMerchantMessages(message, speaker)
    if not isMerchantMonitoring then return end
    
    local lowerMsg = string.lower(tostring(message))
    
    if string.find(lowerMsg, "jester") then
        local fullMessage = speaker .. ": " .. message
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
            sendMerchantToDiscord(fullMessage, speaker, "Jester")
        end
    end
    
    if string.find(lowerMsg, "mari") then
        local fullMessage = speaker .. ": " .. message
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
            sendMerchantToDiscord(fullMessage, speaker, "Mari")
        end
    end
end

local function checkBiomeMessages(message, speaker)
    if not isBiomeMonitoring then return end
    
    for biomeName, patterns in pairs(BIOME_PATTERNS) do
        for _, pattern in ipairs(patterns) do
            if string.find(message, pattern) then
                local fullMessage = speaker .. ": " .. message
                if not table.find(detectedMessages, fullMessage) then
                    table.insert(detectedMessages, fullMessage)
                    if #detectedMessages > 20 then table.remove(detectedMessages, 1) end
                    sendBiomeToDiscord(fullMessage, biomeName)
                end
                break
            end
        end
    end
end

local function startMerchantMonitoring()
    if isMerchantMonitoring then return end
    
    if merchantWebhookUrl == "" or not string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        MerchantStatusLabel.Text = "Status: Invalid webhook URL"
        return
    end
    
    isMerchantMonitoring = true
    MerchantToggleButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
    MerchantToggleButton.Text = "ON"
    MerchantStatusLabel.Text = "Status: Merchant monitoring ACTIVE"
    
    for _, player in pairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            checkMerchantMessages(message, player.Name)
        end)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            checkMerchantMessages(message, player.Name)
        end)
    end)
end

local function stopMerchantMonitoring()
    isMerchantMonitoring = false
    MerchantToggleButton.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
    MerchantToggleButton.Text = "OFF"
    MerchantStatusLabel.Text = "Status: Merchant monitoring STOPPED"
end

local function startBiomeMonitoring()
    if isBiomeMonitoring then return end
    
    if biomeWebhookUrl == "" or not string.find(biomeWebhookUrl:lower(), "discord.com/api/webhooks") then
        BiomeStatusLabel.Text = "Status: Invalid webhook URL"
        return
    end
    
    isBiomeMonitoring = true
    BiomeToggleButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
    BiomeToggleButton.Text = "ON"
    BiomeStatusLabel.Text = "Status: Biome monitoring ACTIVE"
    
    for _, player in pairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            checkBiomeMessages(message, player.Name)
        end)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            checkBiomeMessages(message, player.Name)
        end)
    end)
end

local function stopBiomeMonitoring()
    isBiomeMonitoring = false
    BiomeToggleButton.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
    BiomeToggleButton.Text = "OFF"
    BiomeStatusLabel.Text = "Status: Biome monitoring STOPPED"
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

-- Merchant Tab Events
MerchantToggleButton.MouseButton1Click:Connect(function()
    if isMerchantMonitoring then
        stopMerchantMonitoring()
    else
        merchantWebhookUrl = MerchantWebhookBox.Text
        merchantPrivateServerLink = MerchantServerBox.Text
        startMerchantMonitoring()
    end
end)

MerchantTestButton.MouseButton1Click:Connect(function()
    merchantWebhookUrl = MerchantWebhookBox.Text
    
    if merchantWebhookUrl ~= "" and string.find(merchantWebhookUrl:lower(), "discord.com/api/webhooks") then
        MerchantStatusLabel.Text = "Status: Sending merchant test..."
        local success = sendMerchantToDiscord("🧪 Test notification for Merchant detection", "TEST", "Jester")
        if success then
            MerchantStatusLabel.Text = "Status: Merchant test sent!"
        end
    else
        MerchantStatusLabel.Text = "Status: Set merchant webhook first"
    end
end)

-- Biome Tab Events
BiomeToggleButton.MouseButton1Click:Connect(function()
    if isBiomeMonitoring then
        stopBiomeMonitoring()
    else
        biomeWebhookUrl = BiomeWebhookBox.Text
        biomePrivateServerLink = BiomeServerBox.Text
        startBiomeMonitoring()
    end
end)

BiomeTestButton.MouseButton1Click:Connect(function()
    biomeWebhookUrl = BiomeWebhookBox.Text
    
    if biomeWebhookUrl ~= "" and string.find(biomeWebhookUrl:lower(), "discord.com/api/webhooks") then
        BiomeStatusLabel.Text = "Status: Sending biome test..."
        local success = sendBiomeToDiscord("[Manager]: Unexpected error occurred. [Code 404]", "Glitched")
        if success then
            BiomeStatusLabel.Text = "Status: Biome test sent!"
        end
    else
        BiomeStatusLabel.Text = "Status: Set biome webhook first"
    end
end)

-- Initialize
switchToTab("merchant")
print("✅ Toggle-Based Detector Loaded!")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jester/Mari & Biome Detector",
    Text = "Click the 🔔 button to open",
    Duration = 5
})
