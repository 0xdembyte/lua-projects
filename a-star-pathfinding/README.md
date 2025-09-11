# A\* Pathfinding in 3D (Roblox)
## Overview
This is a **basic 3D implementation of the A* pathfinding algorithm* for Roblox Studio.
I created this as a learning project because I have always been interested in pathfinding algorithms.

**Note:** This implementation is minimal. It does **not include advanced features** such as collision detection, dynamic obstacles, or smoothing.
## Setup
This was designed for **Roblox Studio**, so the modules use directories like `ServerScriptService` in `require()` calls.
### Creating the Modules

1. Open **ServerScriptStorage** in the Explorer tab.
2. Create a **Folder** named `Modules` under `ServerScriptStorage`.
3. Inside the `Modules` folder, create **two ModuleScripts**:
   * `GridSystem`
   * `Nodes`
4. Copy the corresponding source code into each ModuleScript.
   * Example: `grid_system.lua` → `GridSystem`
   * Example: `nodes.lua` → `Nodes`
5. The modules are now ready to use.
## Usage Example
```lua
-- Define start and goal positions
local startPosition = Vector3.new(1, 1, 1)
local goalPosition  = Vector3.new(5, 5, 5)

-- Define grid size
local gridWidth, gridHeight, gridDepth = 5, 5, 5

-- Run A* pathfinding
local Path = AStarPathfinding(startPosition, goalPosition, gridWidth, gridHeight, gridDepth)

-- Output and visualize the path
if Path then
    print("Path found:")
    for _, node in ipairs(Path) do
        print(node.position)
        node:Visualize(Color3.fromRGB(0, 255, 0)) -- Optional visualization
    end
else
    warn("No path found")
end
```
## Notes and Tips
* This is a **learning-focused implementation**. It is not optimized for large grids or performance-heavy scenarios.
* Each node has the following properties:
  * `position` — `Vector3` position of the node
  * `gCost`, `hCost`, `fCost` — cost values used by A\*
  * `walkable` — determines if a node can be traversed
  * `neighbors` — table of connected neighbor nodes
* I'm too lazy to make `pathfinding.lua` an actual module script so you'll just have to make do.
