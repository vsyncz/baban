-- Discord Notifier dengan Deteksi Chat yang Lebih Robust
print("=== DISCORD NOTIFIER - CHAT DETECTION ===")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Variabel monitoring
local isMonitoring = false
local detectedMessages = {}

-- Function start monitoring dengan error handling
local function startMonitoring()
    if isMonitoring then 
        print("⚠️ Monitoring sudah aktif!")
        return 
    end
    
    isMonitoring = true
    print("🎯 Memulai monitoring chat...")
    
    -- Monitor semua player yang sudah ada
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then -- Skip diri sendiri
            local success, error = pcall(function()
                player.Chatted:Connect(function(message)
                    checkMessage(message, player.Name)
                end)
            end)
            
            if success then
                print("✅ Berhasil monitor: " .. player.Name)
            else
                print("❌ Gagal monitor " .. player.Name .. ": " .. error)
            end
        end
    end
    
    -- Monitor player baru yang join
    Players.PlayerAdded:Connect(function(player)
        wait(2) -- Tunggu player fully loaded
        
        local success, error = pcall(function()
            player.Chatted:Connect(function(message)
                checkMessage(message, player.Name)
            end)
        end)
        
        if success then
            print("✅ Berhasil monitor player baru: " .. player.Name)
        else
            print("❌ Gagal monitor player baru: " .. error)
        end
    end)
    
    -- Backup method: TextChatService (untuk game modern)
    if game:GetService("TextChatService") then
        pcall(function()
            game:GetService("TextChatService").OnIncomingMessage = function(message)
                if message.TextSource then
                    local speaker = message.TextSource.UserDisplayName or "Unknown"
                    checkMessage(message.Text, speaker)
                end
            end
        end)
    end
    
    print("✅ Monitoring aktif! Status: " .. tostring(isMonitoring))
end

-- Function deteksi yang lebih comprehensive
local function checkMessage(message, speaker)
    if not message or message == "" then return end
    
    local lowerMsg = string.lower(tostring(message))
    
    -- Deteksi pattern yang berbeda
    local patterns = {
        "@jester", "jester", 
        "@mari", "mari"
    }
    
    for _, pattern in ipairs(patterns) do
        if string.find(lowerMsg, pattern) then
            local fullMessage = speaker .. ": " .. message
            
            -- Anti-spam: cek duplikat
            if not table.find(detectedMessages, fullMessage) then
                table.insert(detectedMessages, fullMessage)
                
                -- Keep only last 20 messages
                if #detectedMessages > 20 then
                    table.remove(detectedMessages, 1)
                end
                
                -- Log ke console
                print("🔔 DETECTED: " .. fullMessage)
                
                -- Kirim ke Discord
                if pattern == "@jester" or pattern == "jester" then
                    sendToDiscord(fullMessage, speaker, "jester")
                elseif pattern == "@mari" or pattern == "mari" then
                    sendToDiscord(fullMessage, speaker, "mari")
                end
                
                -- Show notification
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Target Detected!",
                    Text = speaker .. " mentioned " .. pattern,
                    Duration = 5
                })
                
                break -- Stop setelah menemukan pertama
            end
        end
    end
end

-- Test function untuk simulasi chat
local function testChatDetection()
    print("🧪 Testing chat detection...")
    
    -- Simulasi berbagai pattern
    local testMessages = {
        "@Jester help me!",
        "Hey Mari where are you?",
        "Jester is here everyone!",
        "I need @Mari right now",
        "jester jester jester",
        "mari mari mari"
    }
    
    for i, msg in ipairs(testMessages) do
        wait(1)
        checkMessage(msg, "TEST_PLAYER_" .. i)
    end
end

-- Untuk test, kamu bisa panggil:
-- testChatDetection()
