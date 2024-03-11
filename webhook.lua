local time = 36000
local timeTotal = time / 60
local OldRolls = game.Players.LocalPlayer.leaderstats.Rolls.Value
--wait(time)
local LastRolls = game.Players.LocalPlayer.leaderstats.Rolls.Value
local FinaleRolls = LastRolls - OldRolls
local LuckyPotions = nil
local SpeedPotions = nil
local Gildcoin = nil
local Coin = nil
local allaura = nil
for i, v in pairs(game.Players.LocalPlayer.PlayerGui.MainInterface.AuraInventory.InventoryFrame.ItemsHolder:GetDescendants()) do
pcall(function()
if v.BaseFrame:FindFirstChild('AuraName') then -- in this case true
allaura = v.BaseFrame.AuraName.Text
end
end)
end
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

if game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame:FindFirstChild('Coin') then -- in this case true
   Coin = game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame["Coin"].ItemAmount.Text
else
Coin = 0
end

if game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame:FindFirstChild('Gilded Coin') then -- in this case true
   Gildcoin = game:GetService("Players").LocalPlayer.PlayerGui.MainInterface.Inventory.Items.ItemGrid.ScrollingFrame["Gilded Coin"].ItemAmount.Text
else
Gildcoin = 0
end

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
					["name"] = "Items Inventory",
					["value"] = "",
					["inline"] = false
				},
				{
					["name"] = "Lucky Potions",
					["value"] = LuckyPotions,
                                        ["inline"] = true
				},
				{
					["name"] = "Speed Potions",
					["value"] = SpeedPotions,
                                        ["inline"] = true
				},
				{
					["name"] = "Coin",
					["value"] = Coin,
                                        ["inline"] = true
				},
				{
					["name"] = "Gilded Coin",
					["value"] = Gildcoin,
                                        ["inline"] = true
				},
				{
					["name"] = "Lastest Aura In Inventory",
					["value"] = allaura,
					["inline"] = false
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
