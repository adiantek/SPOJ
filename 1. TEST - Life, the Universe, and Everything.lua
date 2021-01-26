while true do
    N = tonumber(io.read("*n"))
    if N == 42 then
        break
    end
    io.write(string.format("%d\n", N))
end
