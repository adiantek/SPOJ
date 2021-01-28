-- https://www.spoj.com/problems/BLINNET/

local function find(subsets, i)
    while subsets[i].p ~= i do
        subsets[i].p = subsets[subsets[i].p].p
        i = subsets[i].p
    end
    return i
end

local function union(subsets, x, y)
    local xroot = find(subsets, x)
    local yroot = find(subsets, y)
    if subsets[xroot].r < subsets[yroot].r then
        subsets[xroot].p = yroot
    elseif subsets[xroot].r > subsets[yroot].r then
        subsets[yroot].p = xroot
    else
        subsets[yroot].p = xroot
        subsets[xroot].r = subsets[xroot].r + 1
    end
end

for s=1,tonumber(io.read("*n")) do
    local n = tonumber(io.read("*n"))
    local edges = {}
    local subsets = {}

    for i=1,n do
        io.read()
        io.read()
        local neighCost = tonumber(io.read("*n"))
        for j=1,neighCost do
            local neigh = tonumber(io.read("*n"))
            local cost = tonumber(io.read("*n"))
            if (neigh > i) then
                edges[#edges + 1] = {
                    src = i,
                    dst = neigh,
                    w = cost
                }
            end
        end
        subsets[#subsets + 1] = {
            p = i,
            r = 0
        }
    end
    table.sort(edges, function (a, b)
        return a.w < b.w
    end)

    local e = 1
    local i = 1
    
    local sum = 0

    while e <= n - 1 do
        local nextEdge = edges[i]
        i = i + 1
        local x = find(subsets, nextEdge.src)
        local y = find(subsets, nextEdge.dst)
        if x ~= y then
            sum = sum + nextEdge.w
            e = e + 1
            union(subsets, x, y)
        end
    end

    io.write(string.format("%d\n", sum))
end