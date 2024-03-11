https://raw.githubusercontent.com/51740st/Sol-s-rng/main/dzdzdzdzd.luaprint("CheckTime")
local time = 36000
local timeTotal = time / 60
local OldRolls = game.Players.LocalPlayer.leaderstats.Rolls.Value
--wait(time)
local LastRolls = game.Players.LocalPlayer.leaderstats.Rolls.Value
local FinaleRolls = LastRolls - OldRolls
local LuckyPotions = nil
local SpeedPotions = nil
if game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame:FindFirstChild('Lucky Potion') then -- in this case true
   LuckyPotions = game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame["Lucky Potion"].ItemAmount.Text
else
LuckyPotions = 0
end
if game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame:FindFirstChild('Speed Potion') then -- in this case true
   SpeedPotions = game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame["Speed Potion"].ItemAmount.Text
else
SpeedPotions = 0
end
local url =
   "https://discord.com/api/webhooks/1207671376773775371/6Bp85VEliUox4D-mMufgY8M9F3kdS8PhsGNfwtqw1x3F49IdzJ26JilW-tNs1LZi5ScD" -- webhook link ofc
local ping = "@everyone"
local data = {
   ["content"] = ping or "",
   ["embeds"] = {
       {
           ["title"] = "AFK Sol's Rng",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
		["fields"] = {
				{
					["name"] = "Username",
					["value"] = game.Players.LocalPlayer.Name,
					["inline"] = true
				},
				{
					["name"] = "Total Rolls",
					["value"] = FinaleRolls,
					["inline"] = true
				},
				{
					["name"] = "Balance",
					["value"] = game.Players.LocalPlayer.PlayerGui.MainInterface.Coin.Text,
					["inline"] = true
				},
				{
					["name"] = "Inventory",
					["value"] = ""
				},
				{
					["name"] = "Lucky Potions",
					["value"] = LuckyPotions
				},
				{
					["name"] = "Speed Potions",
					["value"] = SpeedPotions,
                                        ["inline"] = true
				}
				
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
