T = tonumber(io.read("*n"))
for i=1,T do
    N = tonumber(io.read("*n"))
    if N < 21 then
        R = 1
        for j=2,N do
            R = R * j
        end
        io.write(string.format("%d\n", R))
    else
        Digits = {1}
        for j=2,N do
            A = {}
            B = {}
            Ones = j % 10
            Tens = j // 10
            MoveA = 0
            MoveB = 0
            for k=1,#Digits do
                A[k] = MoveA + Digits[k] * Ones
                if A[k] > 9 then
                    MoveA = A[k] // 10
                    A[k] = A[k] % 10
                else
                    MoveA = 0
                end
                B[k] = MoveB + Digits[k] * Tens
                if B[k] > 9 then
                    MoveB = B[k] // 10
                    B[k] = B[k] % 10
                else
                    MoveB = 0
                end
            end
            if MoveA > 0 then
                A[#A + 1] = MoveA
            end
            if MoveB > 0 then
                B[#B + 1] = MoveB
            end
            Digits = A
            for k=1,#B do
                Digits[k + 1] = (Digits[k + 1] or 0) + B[k]
                if Digits[k + 1] > 9 then
                    Digits[k + 1] = Digits[k + 1] - 10
                    Digits[k + 2] = (Digits[k + 2] or 0) + 1
                end
            end
        end
        SkipZeros = true
        for k=#Digits,1,-1 do
            if Digits[k] ~= 0 or not SkipZeros then
                io.write(string.format("%d", Digits[k]))
                SkipZeros = false
            end
        end
        io.write("\n")
    end
end
