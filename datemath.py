from datetime import datetime, timedelta
particular_date = datetime(2019, 3, 6)
new_date = particular_date - timedelta(days=52)
print (new_date)

current_date = datetime.now()
print(current_date)
new_date = current_date - timedelta(days=52)
print (new_date)