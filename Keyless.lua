-- ==============================
-- UNIVERSAL SAFE LOADER
-- ==============================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Player hazır olana kadar bekle
if not player then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    player = Players.LocalPlayer
end

-- PlayerGui hazır olana kadar bekle
repeat task.wait() until player:FindFirstChild("PlayerGui")

-- Güvenli loadstring fonksiyonu
local function SafeLoad(url)
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok or not result then
        warn("[Loader] HTTP fetch failed:", url)
        return false
    end

    local execOk, execErr = pcall(function()
        loadstring(result)()
    end)

    if not execOk then
        warn("[Loader] Script execution error:", execErr)
        return false
    end

    return true
end

-- 1️⃣ CDN Script
SafeLoad("https://cdn.sourceb.in/bins/9oc1XHAfWA/0")

-- Küçük gecikme UI çakışmasını önler
task.wait(1.5)

-- 2️⃣ MM2 Menü Script
SafeLoad("https://raw.githubusercontent.com/renardofficiel/game/main/MurderMystery2/main.lua")

-- ==============================
-- Loader hazır
-- ==============================
print("[Loader] All scripts attempted to load.")
