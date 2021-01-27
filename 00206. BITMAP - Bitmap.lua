-- https://www.spoj.com/problems/BITMAP/

local one = ("1"):byte(1)
for c=1,tonumber(io.read("*n")) do
    local n = tonumber(io.read("*n"))
    local m = tonumber(io.read("*n"))
    io.read()
    local queue = {}
    local result = {}
    local queue2 = {}
    local k = 0
    local q = 0
    for i=1,n do
        local line = io.read()
        for j=1,m do
            if line:byte(j) == one then
                queue[q] = k
                q = q + 1
                result[k] = 0
            else
                result[k] = -1
            end
            k = k + 1
        end
    end
    while q > 0 do
        local q2 = 0
        for i=0,q-1 do
            local x = queue[i]
            if x - m >= 0 then
                if result[x - m] == -1 then
                    result[x - m] = result[x] + 1
                    queue2[q2] = x - m
                    q2 = q2 + 1
                end
            end
            if x + m < n * m then
                if result[x + m] == -1 then
                    result[x + m] = result[x] + 1
                    queue2[q2] = x + m
                    q2 = q2 + 1
                end
            end
            local col = x % m
            if col - 1 >= 0 then
                if result[x - 1] == -1 then
                    result[x - 1] = result[x] + 1
                    queue2[q2] = x - 1
                    q2 = q2 + 1
                end
            end
            if col + 1 < m then
                if result[x + 1] == -1 then
                    result[x + 1] = result[x] + 1
                    queue2[q2] = x + 1
                    q2 = q2 + 1
                end
            end
        end
        q = q2
        local tmp = queue
        queue = queue2
        queue2 = tmp
    end
    k = 0
    for i=1,n do
        for j=1,m do
            io.write(string.format("%d ", result[k]))
            k = k + 1
        end
        io.write("\n")
    end
end