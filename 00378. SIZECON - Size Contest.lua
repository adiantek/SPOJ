-- https://www.spoj.com/problems/SIZECON/
-- Result: 62

S = 0
C = io.read
for i=1,C("*n") do
    S = S + math.max(C("*n"), 0)
end
print(S)