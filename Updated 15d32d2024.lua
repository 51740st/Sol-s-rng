local SelectedItems = nil
local WebhookUrl = nil
local WebhookPing = nil
local WebhookCD = nil
local KickCD = nil
        game.Players.LocalPlayer.Idled:Connect(function()
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        function TimeKick()
            while getgenv.KickTime do
                wait(KickCD)
getgenv().AutoWebhook = false
game.Players.LocalPlayer:Kick("เสร็จสิ้น")
local data = {
   ["content"] = WebhookPing,
   ["embeds"] = {
       {
           ["title"] = "",
           ["description"] = "เสร็จสิ้น",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = WebhookUrl, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
            end
        end
function AutoUseItem()
while getgenv().AutoUseItems do
task.wait()
if SelectedItems == "Speed Potion" then
local args = {
    [1] = "Speed Potion",
    [2] = 1
}

game:GetService("ReplicatedStorage").Modules.Inventory.UseItem:FireServer(unpack(args)) 
      end

if SelectedItems == "Lucky Potion" then
local args = {
    [1] = "Lucky Potion",
    [2] = 1
}

game:GetService("ReplicatedStorage").Modules.Inventory.UseItem:FireServer(unpack(args)) 
end
end
end

function AutoUseCoins()
while getgenv().AutoUseCoin do
task.wait()

local args = {
    [1] = "Coin",
    [2] = 1
}

game:GetService("ReplicatedStorage").Modules.Inventory.UseItem:FireServer(unpack(args))
local args = {
    [1] = "Gilded Coin",
    [2] = 1
}

game:GetService("ReplicatedStorage").Modules.Inventory.UseItem:FireServer(unpack(args))

end
end

function AutoStorage()
while getgenv().AutoUpgradeStorage do
task.wait()

local args = {
    [1] = "UpgradeStorage"
}

game:GetService("ReplicatedStorage").Remotes.AuraStorage:FireServer(unpack(args))
end
end

function Webhook()
    while getgenv().AutoWebhook do

local url = WebhookUrl
local ping = WebhookPing
local OldRolls = game.Players.LocalPlayer.leaderstats.Rolls.Value
local LuckyPotions = nil
local SpeedPotions = nil
local Gildcoin = nil
local Coin = nil
local allaura = nil
local str = game.Players.LocalPlayer.PlayerGui.MainInterface.AuraInventory.InventoryFrame.Title.Text
local newStr, replaced = string.gsub(str, "Normal Auras", "")
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
                    ["name"] = "Rolls",
                    ["value"] = OldRolls,
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
                    ["name"] = "Lastest Aura",
                    ["value"] = allaura,
                    ["inline"] = false
                },
                {
                    ["name"] = "Aura Storage",
                    ["value"] = newStr,
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
task.wait(WebhookCD)
end
end

function AutoWalkToPosition()
repeat wait() until getgenv().AutoWalk == true
local LocalPlayer = game:GetService("Players").LocalPlayer
local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

Controls:Disable()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
if game.Workspace.ItemSpawnLocations:FindFirstChild("1") then
    else
game.Workspace.ItemSpawnLocations.Part.Name = "1"
game.Workspace.ItemSpawnLocations.Part.Name = "2"
game.Workspace.ItemSpawnLocations.Part.Name = "3"
game.Workspace.ItemSpawnLocations.Part.Name = "4"
game.Workspace.ItemSpawnLocations.Part.Name = "5"
game.Workspace.ItemSpawnLocations.Part.Name = "6"
game.Workspace.ItemSpawnLocations.Part.Name = "7"
game.Workspace.ItemSpawnLocations.Part.Name = "8"
    end
wait(5)
while getgenv().AutoWalk do
wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(189.9365997314453, 105.75198364257812, 24.78591537475586))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["1"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(210, 106, 3))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["2"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(211, 117, 92))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["8"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(194.6071319580078, 123.25198364257812, 111.76689147949219))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(174.48977661132812, 123.75198364257812, 101.93534851074219))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["3"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(174.48977661132812, 123.75198364257812, 101.93534851074219))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(194.6071319580078, 123.25198364257812, 111.76689147949219))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["6"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(300.3956298828125, 109.48391723632812, 133.02760314941406))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["4"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(373.5589599609375, 115.48457336425781, 131.35494995117188))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(394.646728515625, 119.99996948242188, 111.53372192382812))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(411.0082092285156, 144.79995727539062, 93.2409439086914))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.workspace.ItemSpawnLocations["5"].Position)
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(362.0480041503906, 115.29725646972656, 90.9381332397461))
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
end
end
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("iPeach Sol's Rng", "Default")
local tab1 = DrRayLibrary.newTab("Main", "ImageIdHere")
local tab2 = DrRayLibrary.newTab("Webhook", "ImageIdHere")
tab1.newButton("Enable Player Control", "", function()
local LocalPlayer = game:GetService("Players").LocalPlayer
local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

Controls:Enable()
end)
tab1.newToggle("Auto Walk To Item Spawner", "", false, function(toggleState)
getgenv().AutoWalk = toggleState
AutoWalkToPosition()
end)

tab1.newToggle("Auto Use Coins", "", false, function(toggleState)
getgenv().AutoUseCoin = toggleState
AutoUseCoins()
end)

tab1.newToggle("Auto Upgrade Storage", "", false, function(toggleState)
getgenv().AutoUpgradeStorage = toggleState
AutoStorage()
end)

tab1.newToggle("Auto Use Potions", "Select DropDown Before use this", false, function(toggleState)
getgenv().AutoUseItems = toggleState
AutoUseItem()
end)

tab1.newDropdown("Potions", "Select", {"Lucky Potion", "Speed Potion"}, function(selectedOption)

SelectedItems = selectedOption
end)


tab2.newInput("Webhook URL", "url that you got from discord", function(text)
    WebhookUrl = text
end)

tab2.newInput("Webhook Ping", "ping someone for example @everyone", function(pingwho)
    WebhookPing = pingwho
end)

tab2.newSlider("Webhook Cooldown", "Cooldown in second", 3600, false, function(num)
    WebhookCD = num
end)

tab2.newToggle("Auto Send Webhook", "", false, function(toggleState)
getgenv().AutoWebhook = toggleState
Webhook()
end)

tab2.newSlider("Kick Timer", "Cooldown in second", 604800, false, function(num)
    KickCD = num
end)

tab2.newToggle("Auto Kick After Specific Time", "", false, function(toggleState)
getgenv().KickTime = toggleState
TimeKick()
end)


while true do
wait()
   pcall(function()
for i, v in pairs(game.Workspace.DroppedItems:GetDescendants()) do
                   if v:IsA("Model") and v.Name == "Lucky Potion" or v.Name == "Speed Potion" and v:FindFirstChild("Casing") then
                    fireproximityprompt(v.Casing.ProximityPrompt)
end
end
for i, v in pairs(game.Workspace.DroppedItems:GetDescendants()) do
                   if v.Name == "Coin" or v.Name == "Gilded Coin"  then
                    fireproximityprompt(v.ProximityPrompt)
end
end

end)
end