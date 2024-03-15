function AutoUseItem()
local SelectedItems = nil
while getgenv().AutoUseItems do
task.wait()
if SelectedItems == "Speed Potion" then
local args = {
    [1] = "Speed Potion",
    [2] = 1
}

game:GetService("ReplicatedStorage").Modules.Inventory.UseItem:FireServer(unpack(args))
      end

        end
end
function AutoWalkToPosition()
repeat wait() until getgenv().AutoWalk == true
local LocalPlayer = game:GetService("Players").LocalPlayer
local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

Controls:Disable()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
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
tab1.newButton("Enable Player Control", "", function()
local LocalPlayer = game:GetService("Players").LocalPlayer
local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

Controls:Enable()
end)
tab1.newToggle("Auto Walk To Item Spawner", "", false, function(toggleState)
getgenv().AutoWalk = toggleState
AutoWalkToPosition()
end)

tab1.newToggle("Auto Use Potions", "Select DropDown Before use this", false, function(toggleState)
getgenv().AutoUseItems = toggleState
AutoUseItem()
end)

tab1.newDropdown("Items", "Select", {"Lucky Potion", "Speed Potion"}, function(selectedOption)

SelectedItems = selectedOption
print(SelectedItems)
end)
