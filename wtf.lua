local module = {}

module.__index = module

local ps = game:GetService("PathfindingService")

local debugMode = false --Make this true if you wan't to see debuging features (Waypoints etc.)

function module.new(Rig,PathParams)
	if not Rig then warn("Parameter 'Rig' is missing") return end
	local self = setmetatable({},module)
	
	self.Rig = Rig
	self.Root = self.Rig:FindFirstChild("HumanoidRootPart") or self.Rig:FindFirstChild("Torso")
	
	if not self.Root then warn("HumanoidRootPart or Torso not found.") return end
	
	self.Humanoid = self.Rig:FindFirstChildWhichIsA("Humanoid")
	
	if not self.Humanoid then warn("Humanoid not found") return end
	
	if PathParams then
		self.Path = ps:CreatePath(PathParams)
	else
		self.Path = ps:CreatePath()
	end
	
	self.CurrentWaypoint = 1
	self.Pathfinding = false
	self.Climbing = false
	self.NearestDistanceTruss = math.huge
	self.Waypoints = nil
	
	self.Root:SetNetworkOwner(nil)
	
	--Events
	
	self.CompletedEvent = Instance.new("BindableEvent")
	self.Completed = self.CompletedEvent.Event
	
	return self
end

function module:Run(position)
	pcall(function()
		if self.Rig and self.Path then
			self.Path:ComputeAsync(self.Root.Position,position)
			if self.Path.Status == Enum.PathStatus.Success then
				self.Waypoints = self.Path:GetWaypoints()
				self.Pathfinding = true
				if self.Waypoints[self.CurrentWaypoint] then
					self.Humanoid:MoveTo(self.Waypoints[self.CurrentWaypoint].Position)
					if debugMode == true then
						local node = Instance.new("Part",workspace)
						node.Name = "Waypoint"
						node.CanCollide = false
						node.Anchored = true
						node.Size = Vector3.new(0.5,0.5,0.5)
						node.Shape = Enum.PartType.Ball
						node.Position = self.Waypoints[self.CurrentWaypoint].Position
					end
					if self.Waypoints[self.CurrentWaypoint].Action == Enum.PathWaypointAction.Jump then
						self.Humanoid.Jump = true
					end
				end
			else
				if self.Climbing == false then
					self.Pathfinding = false
					self.Humanoid:MoveTo(position)
				end
			end
			if self.HumanoidMoveToFinished == nil then
				self.HumanoidMoveToFinished = self.Humanoid.MoveToFinished:Connect(function()
					if self.Waypoints and self.Pathfinding then
						if self.Path.Status == Enum.PathStatus.Success then
							if self.CurrentWaypoint > #self.Waypoints - 1 then
								self.CompletedEvent:Fire(self.Root.Position)
								self.CurrentWaypoint = 1
							else
								self.CurrentWaypoint += 1
								if self.Waypoints[self.CurrentWaypoint] then
									self.Humanoid:MoveTo(self.Waypoints[self.CurrentWaypoint].Position)
									if debugMode == true then
										local node = Instance.new("Part",workspace)
										node.Name = "Waypoint"
										node.CanCollide = false
										node.Anchored = true
										node.Size = Vector3.new(0.5,0.5,0.5)
										node.Shape = Enum.PartType.Ball
										node.Position = self.Waypoints[self.CurrentWaypoint].Position
									end
									if self.Waypoints[self.CurrentWaypoint].Action == Enum.PathWaypointAction.Jump then
										self.Humanoid.Jump = true
									end
								end
							end
						end
					elseif not self.Pathfinding then
						self.CompletedEvent:Fire(self.Root.Position)
					end
				end)
			end
		end
	end)
end

function module:Stop()
	pcall(function()
		if self.Humanoid then
			self.Pathfinding = false
			self.Humanoid:MoveTo(self.Root.Position)
			if self.Humanoid:GetState() == Enum.HumanoidStateType.Climbing then
				self.Humanoid.Jump = true
			end
			if self.HumanoidMoveToFinished ~= nil then
				self.HumanoidMoveToFinished:Disconnect()
			end
		end
	end)
end

return module
