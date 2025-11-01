-- Discord Notifier with Role Mention - Improved UI
print("=== DISCORD NOTIFIER WITH ROLE MENTION ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DiscordNotifier"
screenGui.Parent = game:GetService("CoreGui")

-- Main Container Frame
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 450, 0, 500)
mainContainer.Position = UDim2.new(0.5, -225, 0.5, -250)
mainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainContainer.BorderSizePixel = 0
mainContainer.Parent = screenGui

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 12)
containerCorner.Parent = mainContainer

local containerShadow = Instance.new("ImageLabel")
containerShadow.Size = UDim2.new(1, 0, 1, 0)
containerShadow.Position = UDim2.new(0, 0, 0, 0)
containerShadow.BackgroundTransparency = 1
containerShadow.Image = "rbxassetid://5554236805"
containerShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
containerShadow.ImageTransparency = 0.8
containerShadow.ScaleType = Enum.ScaleType.Slice
containerShadow.SliceCenter = Rect.new(23, 23, 277, 277)
containerShadow.Parent = mainContainer

-- Title Bar with Drag and Minimize
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainContainer

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.Position = UDim2.new(0.05, 0, 0, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Text = "Jester/Mari Detector"
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 16
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0.8, 0, 0.12, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeBtn

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0.9, 0, 0.12, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

-- Content Frame (yang bisa di-minimize)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainContainer

-- Webhook Section
local webhookSection = Instance.new("Frame")
webhookSection.Size = UDim2.new(0.9, 0, 0, 100)
webhookSection.Position = UDim2.new(0.05, 0, 0.05, 0)
webhookSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
webhookSection.Parent = contentFrame

local sectionCorner = Instance.new("UICorner")
sectionCorner.CornerRadius = UDim.new(0, 8)
sectionCorner.Parent = webhookSection

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
webhookBox.Position = UDim2.new(0.05, 0, 0.35, 0)
webhookBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
webhookBox.TextColor3 = Color3.fromRGB(255, 255, 255)
webhookBox.PlaceholderText = "Tempel URL webhook Anda di sini..."
webhookBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
webhookBox.Text = ""
webhookBox.Font = Enum.Font.Gotham
webhookBox.TextSize = 12
webhookBox.TextXAlignment = Enum.TextXAlignment.Left
webhookBox.TextWrapped = true
webhookBox.Parent = webhookSection

local webhookCorner = Instance.new("UICorner")
webhookCorner.CornerRadius = UDim.new(0, 6)
webhookCorner.Parent = webhookBox

-- Role IDs Section
local roleSection = Instance.new("Frame")
roleSection.Size = UDim2.new(0.9, 0, 0, 120)
roleSection.Position = UDim2.new(0.05, 0, 0.3, 0)
roleSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
roleSection.Parent = contentFrame

local roleCorner = Instance.new("UICorner")
roleCorner.CornerRadius = UDim.new(0, 8)
roleCorner.Parent = roleSection

local roleLabel = Instance.new("TextLabel")
roleLabel.Size = UDim2.new(0.9, 0, 0, 25)
roleLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
roleLabel.BackgroundTransparency = 1
roleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
roleLabel.Text = "Whitelist Biome (Pilih untuk notifikasi):"
roleLabel.Font = Enum.Font.GothamBold
roleLabel.TextSize = 14
roleLabel.TextXAlignment = Enum.TextXAlignment.Left
roleLabel.Parent = roleSection

-- Jester Role ID
local jesterRoleBox = Instance.new("TextBox")
jesterRoleBox.Size = UDim2.new(0.9, 0, 0, 35)
jesterRoleBox.Position = UDim2.new(0.05, 0, 0.35, 0)
jesterRoleBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
jesterRoleBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jesterRoleBox.PlaceholderText = "Jester Role ID (opsional)..."
jesterRoleBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
jesterRoleBox.Text = ""
jesterRoleBox.Font = Enum.Font.Gotham
jesterRoleBox.TextSize = 12
jesterRoleBox.Parent = roleSection

local jesterCorner = Instance.new("UICorner")
jesterCorner.CornerRadius = UDim.new(0, 6)
jesterCorner.Parent = jesterRoleBox

-- Mari Role ID
local mariRoleBox = Instance.new("TextBox")
mariRoleBox.Size = UDim2.new(0.9, 0, 0, 35)
mariRoleBox.Position = UDim2.new(0.05, 0, 0.75, 0)
mariRoleBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
mariRoleBox.TextColor3 = Color3.fromRGB(255, 255, 255)
mariRoleBox.PlaceholderText = "Mari Role ID (opsional)..."
mariRoleBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
mariRoleBox.Text = ""
mariRoleBox.Font = Enum.Font.Gotham
mariRoleBox.TextSize = 12
mariRoleBox.Parent = roleSection

local mariCorner = Instance.new("UICorner")
mariCorner.CornerRadius = UDim.new(0, 6)
mariCorner.Parent = mariRoleBox

-- Server Link Section
local serverSection = Instance.new("Frame")
serverSection.Size = UDim2.new(0.9, 0, 0, 80)
serverSection.Position = UDim2.new(0.05, 0, 0.6, 0)
serverSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
serverSection.Parent = contentFrame

local serverCorner = Instance.new("UICorner")
serverCorner.CornerRadius = UDim.new(0, 8)
serverCorner.Parent = serverSection

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

local serverBoxCorner = Instance.new("UICorner")
serverBoxCorner.CornerRadius = UDim.new(0, 6)
serverBoxCorner.Parent = serverBox

-- Status Section
local statusSection = Instance.new("Frame")
statusSection.Size = UDim2.new(0.9, 0, 0, 60)
statusSection.Position = UDim2.new(0.05, 0, 0.8, 0)
statusSection.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
statusSection.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusSection

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
buttonSection.Position = UDim2.new(0.05, 0, 0.95, 0)
buttonSection.BackgroundTransparency = 1
buttonSection.Parent = contentFrame

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.48, 0, 1, 0)
saveBtn.Position = UDim2.new(0, 0, 0, 0)
saveBtn.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveBtn.Text = "Apply"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.Parent = buttonSection

local saveCorner = Instance.new("UICorner")
saveCorner.CornerRadius = UDim.new(0, 6)
saveCorner.Parent = saveBtn

local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(0.48, 0, 1, 0)
testBtn.Position = UDim2.new(0.52, 0, 0, 0)
testBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testBtn.Text = "Test"
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 14
testBtn.Parent = buttonSection

local testCorner = Instance.new("UICorner")
testCorner.CornerRadius = UDim.new(0, 6)
testCorner.Parent = testBtn

-- Toggle Button (Always visible when minimized)
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

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 10)
toggleCorner.Parent = toggleBtn

-- Variables
local webhookUrl = ""
local jesterRoleId = ""
local mariRoleId = ""
local privateServerLink = ""
local isMonitoring = false
local detectedMessages = {}
local isMinimized = false
local dragging = false
local dragInput, dragStart, startPos

-- Dragging Functionality
local function updateInput(input)
    local delta = input.Position - dragStart
    mainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Minimize Functionality
local function toggleMinimize()
    if isMinimized then
        -- Restore
        contentFrame.Visible = true
        mainContainer.Size = UDim2.new(0, 450, 0, 500)
        minimizeBtn.Text = "-"
        toggleBtn.Visible = false
        isMinimized = false
    else
        -- Minimize
        contentFrame.Visible = false
        mainContainer.Size = UDim2.new(0, 450, 0, 40)
        minimizeBtn.Text = "+"
        toggleBtn.Visible = true
        isMinimized = true
    end
end

-- Webhook Function with Role Mention
local function sendToDiscord(message, playerName, mentionedRole)
    if webhookUrl == "" or not string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Invalid webhook URL"
        return false
    end
    
    local currentTime = os.date("%H:%M:%S")
    local content = ""
    
    -- Add role mention to content
    if mentionedRole == "jester" and jesterRoleId ~= "" then
        content = "<@&" .. jesterRoleId .. "> "
    elseif mentionedRole == "mari" and mariRoleId ~= "" then
        content = "<@&" .. mariRoleId .. "> "
    end
    
    local embedData = {
        ["title"] = "🚨 Role Mention Detected!",
        ["description"] = message,
        ["color"] = 16711680,
        ["fields"] = {
            {
                ["name"] = "Player",
                ["value"] = playerName or "Unknown",
                ["inline"] = true
            },
            {
                ["name"] = "Mentioned Role",
                ["value"] = mentionedRole:upper(),
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
        ["username"] = "ROBLOX Role Monitor"
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
        return true
    else
        statusLabel.Text = "Status: Failed to send webhook"
        return false
    end
end

-- Message Detection Function
local function checkMessage(message, speaker)
    local lowerMsg = string.lower(tostring(message))
    
    -- Check for @Jester mention
    if string.find(lowerMsg, "@jester") then
        local fullMessage = speaker .. ": " .. message
        
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            
            if #detectedMessages > 10 then
                table.remove(detectedMessages, 1)
            end
            
            sendToDiscord(fullMessage, speaker, "jester")
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "@Jester Mentioned!",
                Text = speaker .. " mentioned Jester role",
                Duration = 5
            })
        end
    end
    
    -- Check for @Mari mention  
    if string.find(lowerMsg, "@mari") then
        local fullMessage = speaker .. ": " .. message
        
        if not table.find(detectedMessages, fullMessage) then
            table.insert(detectedMessages, fullMessage)
            
            if #detectedMessages > 10 then
                table.remove(detectedMessages, 1)
            end
            
            sendToDiscord(fullMessage, speaker, "mari")
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "@Mari Mentioned!",
                Text = speaker .. " mentioned Mari role", 
                Duration = 5
            })
        end
    end
end

-- Start Monitoring Function
local function startMonitoring()
    if isMonitoring then return end
    
    isMonitoring = true
    statusLabel.Text = "Status: Monitoring for @Jester and @Mari mentions..."
    
    for _, player in pairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(message)
            checkMessage(message, player.Name)
        end)
    end
    
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(message)
            checkMessage(message, player.Name)
        end)
    end)
end

-- Button Events
minimizeBtn.MouseButton1Click:Connect(toggleMinimize)

closeBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = false
    toggleBtn.Visible = true
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainContainer.Visible = true
    toggleBtn.Visible = false
end)

saveBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    jesterRoleId = jesterRoleBox.Text
    mariRoleId = mariRoleBox.Text
    privateServerLink = serverBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Settings applied! Starting monitor..."
        wait(1)
        startMonitoring()
        toggleMinimize() -- Auto minimize after start
    else
        statusLabel.Text = "Status: Please enter valid Discord webhook"
    end
end)

testBtn.MouseButton1Click:Connect(function()
    webhookUrl = webhookBox.Text
    jesterRoleId = jesterRoleBox.Text
    mariRoleId = mariRoleBox.Text
    
    if webhookUrl ~= "" and string.find(webhookUrl:lower(), "discord.com/api/webhooks") then
        statusLabel.Text = "Status: Sending test notification..."
        
        local success = sendToDiscord("🧪 Test message for @Jester role mention", "TEST BOT", "jester")
        
        if success then
            statusLabel.Text = "Status: Test sent successfully!"
        end
    else
        statusLabel.Text = "Status: Enter valid webhook first"
    end
end)

print("✅ Jester/Mari Detector Loaded!")
print("🎯 Monitoring for: '@Jester' and '@Mari' mentions")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Jester/Mari Detector",
    Text = "UI Loaded - Configure your settings",
    Duration = 5
})
