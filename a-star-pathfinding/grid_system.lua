
local Nodes  = require(game:GetService("ServerScriptService").Modules.Nodes)
local Grid   = {}
Grid.__index = Grid

function Grid.new(width : IntValue, height : IntValue, depth : IntValue) 
	local self  = setmetatable({}, Grid)
	self.width  = width
	self.height = height
	self.depth  = depth
	self.nodes  = {}

	return self
end

function Grid:Generate3DGrid(goalPosition)
	for x = 1, self.width do
		self.nodes[x] = {}
		for y = 1, self.height do
			self.nodes[x][y] = {}
			for z = 1, self.depth do
				self.nodes[x][y][z] = Nodes.new({
					goal = goalPosition,
					position = Vector3.new(x, y, z),
					parent = nil,
					gCost = 0,
					hCost = 0,
					fCost = 0,
					walkable = true,
					neighbors = {}
				})
			end
		end
	end
end

function Grid:Generate3DNeighbors()
	for x = 1, self.width do
		for y = 1, self.height do
			for z = 1, self.depth do
				local node       = self.nodes[x][y][z]
				local directions = {
					{ 1,  0,  0}, {-1,  0,  0},
					{ 0,  1,  0}, { 0, -1,  0},
					{ 0,  0,  1}, { 0,  0, -1}
				}
				for _, direction in ipairs(directions) do
					local neighborX, neighborY, neighborZ = x + direction[1], y + direction[2], z + direction[3]
					if neighborX >= 1 and neighborX <= self.width
						and neighborY >= 1 and neighborY <= self.height
						and neighborZ >= 1 and neighborZ <= self.depth then
						node:AddNeighbor(self.nodes[neighborX][neighborY][neighborZ])
					end
				end
			end
		end
	end
end

return Grid
