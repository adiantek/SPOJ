-- https://www.spoj.com/problems/TRICOUNT/

local t = tonumber(io.read("*n"))
for i=1,t do
    local n = tonumber(io.read("*n"))

    -- source: https://mathworld.wolfram.com/TriangleTiling.html
    local res = (n * (n + 2) * (2 * n + 1))

    print(res // 8)
end

--[[
    -- version with TLE:

    local res = n * n

    -- without inverted ones:
    for x=1,n-1,1 do
        res = res + (1 + x) * x // 2
    end

    -- only inverted:
    for x=n-3,1,-2 do
        res = res + (1 + x) * x // 2
    end
--]]