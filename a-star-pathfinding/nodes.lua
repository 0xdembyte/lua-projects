-- Node Properties
-- goal: Vector3
-- position: Vector3
-- parent: Table (Node)
-- gCost: Interger
-- hCost: Interger
-- fCost: Interger
-- walkable: Boolean
-- neighbors: Table
local Nodes   = {}
Nodes.__index = Nodes

function Nodes.new(properties : table)
	local self = setmetatable({}, Nodes)
	for key, value in properties do
		self[key] = value
	end

	return self
end

function Nodes:CalculateGCost()
	if not self.parent then
		self.gCost = 0
	end
	self.gCost = self.parent.gCost + (self.parent.position - self.position).magnitude
end

function Nodes:CalculateHCost()
	self.hCost = (self.position - self.goal).magnitude
end

function Nodes:CalculateFCost()
	self.fCost = self.gCost + self.hCost
end

function Nodes:AddNeighbor(neighbor)
	table.insert(self.neighbors, neighbor)
end

function Nodes:Visualize(color : Color3)
	local Visualizer = Instance.new("Part")
	Visualizer.Parent = workspace
	Visualizer.Anchored = true
	Visualizer.Color = color
	Visualizer.Position = self.position
	Visualizer.Shape = Enum.PartType.Ball
	Visualizer.Size = Vector3.new(1, 1, 1)
end

return Nodes
