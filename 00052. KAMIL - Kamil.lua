-- https://www.spoj.com/problems/KAMIL/
-- Result: 120

for i=0,9 do
w=io.read()
r=1
t={T=1,D=1,L=1,F=1}
for j=1,w:len() do
x=w:sub(j,j)
if t[x] then
r=r*2
end
end
print(r)
end
