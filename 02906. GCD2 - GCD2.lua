-- https://www.spoj.com/problems/GCD2/

local zero = ("0"):byte(1)

local function mod(num, a)
    local res = 0
    for i=1,num:len() do
        res = (res * 10 + num:byte(i) - zero) % a
    end
    return res
end

local function gcd(a, b)
    while b ~= 0 do
        local c = b
        b = a % b
        a = c
    end
    return a
end

for c=1,tonumber(io.read("*n")) do
    local a = tonumber(io.read("*n"))
    local b = tostring(io.read()):sub(2)
    if a == 0 then
        io.write(b)
        io.write("\n")
    elseif (b:len() == 1 and b == "0") then
        io.write(string.format("%d\n", a))
    else
        b = mod(b, a)
        io.write(string.format("%d\n", gcd(a, b)))
    end
end