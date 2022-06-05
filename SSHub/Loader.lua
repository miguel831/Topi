local NS = {
	Title = "SSHub",
	Icon = "rbxassetid://8426126371"
};
local function Notify(Title, Icon, Text, Duration)
	game.StarterGui:SetCore("SendNotification", {Title = Title or ""; Text = Text or ""; Icon = Icon or ""; Duration = tonumber(Duration) or 3 })
end

--#region Loader
local function Load(ToLoad)
    local Success, Error = pcall(function()
		wait(1)
		ToLoad()
    end)
    if Error and not Success then
        Notify(NS.Title,NS.Icon,"Error!")
    elseif Success and not Error then
        Notify(NS.Title,NS.Icon,"Succes!")
    end
end
local Test = coroutine.wrap(function()
	print('Testing Loader')
end)
local Criminality = coroutine.wrap(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/miguel831/Roblox-Scripts/main/SSHub/Scripts/SSHub_Criminality.lua'))()
end)
--#endregion
Notify(NS.Title,NS.Icon,"Checking...")

local SupportedGames = loadstring(game:HttpGet('https://raw.githubusercontent.com/miguel831/Roblox-Scripts/main/SSHub/Games.lua', true))()
if SupportedGames[game.PlaceId] then
	Notify(NS.Title,NS.Icon, game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."Loading...")
	Load(Criminality)
else
	Notify(NS.Title,NS.Icon,"No game found!")
end
