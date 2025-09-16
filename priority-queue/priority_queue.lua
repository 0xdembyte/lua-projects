-- SOURCES:
-- https://www.baeldung.com/cs/binary-tree-max-heapify
-- https://datastructures.maximal.io/heaps/heap-priority-queue/
local Heap = {}
Heap.__index = Heap

function Heap.new()
    local self = setmetatable({}, Heap)
    self.elements = {}
    return self
end

function Heap:MaxElement()
    return self.elements[1]
end

function Heap:RemoveMaxElement()
    local max = self:MaxElement()
    self.elements[1] = self.elements[#self.elements]
    table.remove(self.elements)
    self:MaxHeapify(1)
    return max
end

function Heap:MaxHeapify(index)
    local largest = index
    local left  = 2 * index
    local right = 2 * index + 1

    if left <= #self.elements and self.elements[left] > self.elements[largest] then
        largest = left
    end
    
    if right <= #self.elements and self.elements[right] > self.elements[largest] then
        largest = right
    end

    if largest ~= index then
        self:Swap(index, largest)
        self:MaxHeapify(largest)
    end
end

function Heap:Parent(i)
    return math.floor(i / 2)
end

function Heap:IncreaseKey(index, key)
    if not self.elements[index] then return end
    assert(key >= self.elements[index], "new key is smaller than current key")
    self.elements[index] = key
    while index > 1 and self.elements[self:Parent(index)] < self.elements[index] do
        self:Swap(index, self:Parent(index))
        index = self:Parent(index)
    end
end

function Heap:Insert(key)
    table.insert(self.elements, -math.huge)
    self:IncreaseKey(#self.elements, key)
end

function Heap:Swap(index, new)
    self.elements[index] = self.elements[new]
    self.elements[index] = self.elements[new]
end

return Heap
