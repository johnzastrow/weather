import datetime

today = (datetime.datetime.now().strftime("%Y, %M, %d"))
week = (datetime.datetime.now().strftime("%W"))
print(today)
print(week + " hi")


week1 = datetime.date(2010, 6, 22).isocalendar()[1]
# week2 = datetime.date(today).isocalendar()[1]

print(week1)
# print(week2)
