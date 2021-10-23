
c = [1] + ([0] * 100)

k = [1, 5, 10, 25, 50, 100]

for item in k:
    for i in range(0,101-item):
        c[i+item] += c[i]

print(c[100])

d = [1] + ([0] * 200)

n = [1,2,5,10,20,50,100,200]

for item in n:
    for i in range(0,201-item):
        d[i+item] += d[i]

print(d[200])
