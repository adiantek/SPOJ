-- https://www.spoj.com/problems/PT07Z/

local n = tonumber(io.read("*n"))
local nodes = {}
local firstNode = nil
for i=1,n-1 do
    local u = tonumber(io.read("*n"))
    local v = tonumber(io.read("*n"))
    if nodes[u] == nil then
        nodes[u] = {
            n = u
        }
    end
    if nodes[v] == nil then
        nodes[v] = {
            n = v
        }
    end
    if firstNode == nil then
        firstNode = nodes[u]
    end
    nodes[u][#nodes[u]+1] = nodes[v]
    nodes[v][#nodes[v]+1] = nodes[u]
end
local function dfs(root)
    local visited = {}
    for i=1,n do
        visited[i] = false
    end
    local stack = {}
    table.insert(stack, root)
    visited[root.n] = true
    root.depth = 0
    local maxDepth = root
    while true do
        local node = table.remove(stack)
        if node == nil then
            break
        end
        if maxDepth.depth < node.depth then
            maxDepth = node
        end
        for i=1,#node do
            local v = node[i]
            if not visited[v.n] then
                visited[v.n] = true
                v.depth = node.depth + 1
                table.insert(stack, v)
            end
        end
    end
    return maxDepth
end
local node = dfs(firstNode)
--[[
io.write("\n")
for k,v in pairs(nodes) do
    io.write(string.format("%d: %d\n", v.n, v.depth or -1))
end
--]]
node = dfs(node)
--[[
io.write("\n")
for k,v in pairs(nodes) do
    io.write(string.format("%d: %d\n", v.n, v.depth or -1))
end
--]]
io.write(node.depth)
