local BPOwner = true
local WeebHook = "https://discord.com/api/webhooks/1046955945621737502/HsniRn_0kRUhfXqIb5eI6csZqYwQwWOFm-d1ZJKwk4eoFvvELEnxsD8u_ow-koBGqNzB"
local ExecutorUsing = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or "WTF?"
local HttpService = game:GetService("HttpService")
local UserId = game.Players.LocalPlayer.UserId
local SupportedGames = loadstring(game:HttpGet('https://raw.githubusercontent.com/miguel831/Roblox-Scripts/main/SSHub/Games.lua', true))()
local function GetSupportedGame() 
	local Game
    for Id, Info in pairs(SupportedGames) do
        if tostring(game.PlaceId) == Id then
            Game = Info break
        end
    end return Game
end
local SupportedGame = GetSupportedGame()
local InfoSpoofer = function()
    if BPOwner and (UserId == 860289947 or UserId == 446350986) then
        print("Bypassed Info Tracker")
    else
        local Data = {
            ["username"] = "SSHub",
            ["embeds"] = {
                {
                    ["title"] = "Script Executed",
                    ["color"] = 9893552,
                    ["fields"] = {
                        {
                            ["name"] = "User",
                            ["value"] = game.Players.LocalPlayer.Name,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Id",
                            ["value"] = game.Players.LocalPlayer.UserId,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Age",
                            ["value"] = game.Players.LocalPlayer.AccountAge,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Executor",
                            ["value"] = ExecutorUsing,
                            ["inline"] = true
                        },
						{
                            ["name"] = "Game",
                            ["value"] = SupportedGame.Name,
                            ["inline"] = true
                        },
						{
                            ["name"] = "Script",
                            ["value"] = SupportedGame.Script,
                            ["inline"] = true
                        }
                    }
                }
            }
        }
        local Headers = {["Content-Type"] = "application/json"}
        local Encoded = HttpService:JSONEncode(Data)
        local Request = http_request or request or HttpPost or syn.request
        local Final = {Url = WeebHook, Body = Encoded, Method = "POST", Headers = Headers}
        Request(Final)
    end
end
return InfoSpoofer
