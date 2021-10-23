import datetime as dt 

days = []

for n in range(1901, 2001):
    for i in range(1, 13):
        days.append(dt.date(n,i,1).weekday())

print(days.count(6))