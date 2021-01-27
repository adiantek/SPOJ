
-- https://www.spoj.com/problems/PRIME1/

local n = io.read("*n")
for i=1,n do
    local a = io.read("*n")
    local b = io.read("*n")
    local max = math.ceil(math.sqrt(b))
    local arr = {}
    local arr2 = {}
    for j=a,b do
        arr[j-a] = true
    end
    for j=0,max do
        arr2[j] = true
    end
    for j=2,max do
        if arr2[j] == true then
            for k=2*j,max,j do
                arr2[k] = false
            end
            local st = a - (a % j)
            if st <= j * 2 then
                st = j * 2
            end
            for k=st,b,j do
                arr[k-a] = false
            end
        end
    end
    if a == 1 then
        arr[0] = false
    end
    for j=a,b do
        if arr[j-a] == true then
            io.write(j)
            io.write("\n")
        end
    end
    io.write("\n")
end