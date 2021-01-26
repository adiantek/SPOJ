T = tonumber(io.read("*n"))
for i=1,T do
    A = tonumber(io.read("*n"))
    B = tonumber(io.read("*n"))
    if B == 0 then
        io.write(string.format("%d\n", 1))
    else
        B = B % 4 + 4
        R = 1
        for j=1,B do
            R = R * A
        end
        io.write(string.format("%d\n", R % 10))
    end
end
