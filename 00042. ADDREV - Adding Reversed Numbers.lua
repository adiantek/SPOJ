local n = io.read("*n")
for i=1,n do
    local a = tonumber(string.reverse(tostring(io.read("*n"))))
    local b = tonumber(string.reverse(tostring(io.read("*n"))))
    local c = tonumber(string.reverse(tostring(a + b)))
    io.write(string.format("%d\n", c))
end