import matplotlib.pyplot as plt
import pandas as pd
import sqlalchemy
import numpy as np
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()
# from matplotlib import dates as mpl_dates
from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)
from datetime import datetime, timedelta
import datetime
today = (datetime.datetime.now().strftime("%Y-%m-%d"))
print(today)
todayweek = (datetime.datetime.now().strftime("%W"))
todayyear = (datetime.datetime.now().strftime("%Y"))
endwindow = (datetime.datetime.now().strftime("%Y"))
dayofyear = (datetime.datetime.now().strftime("%j"))
intofyear = int(dayofyear)
plotweek = int(todayweek) - 12
print(plotweek)
print(dayofyear)
print (intofyear)
daym30 = intofyear - 30
print(daym30)

# current_date = datetime.datetime.now()
# new_date = current_date - timedelta(days=30)
# prior_date = new_date.strftime("%Y-%m-%d")
# print (prior_date)

# Make the figure wider to see things better
plt.figure(figsize=(12,6))

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@localhost:3306/weather')

### E1248 
### 2017 = 730 days from today
my_query2017 = '''  SELECT `day_of_year`, YEAR(d_utc) AS yeary, `temp_f_davg` , temp_f_davg - temp_f_dmin AS temp_f_min , temp_f_dmin, temp_f_dmax - temp_f_davg AS temp_f_max ,temp_f_dmax, recs FROM `weather`.`v_E1248_daily` 
 WHERE DATE(d_utc) BETWEEN CURDATE() - INTERVAL 760 DAY AND CURDATE() - INTERVAL 730 DAY ORDER BY day_of_year ASC;'''
df1 = pd.read_sql_query(my_query2017,engine)
tempf_vals2017 = df1['temp_f_davg']
dater2017 = df1['day_of_year']
lower_y_error2018 = df1['temp_f_min']
upper_y_error2018 = df1['temp_f_max']
y_error = [lower_y_error2018, upper_y_error2018]
plt.errorbar(dater2017, tempf_vals2017, yerr = y_error, fmt='-o', ecolor='gray', label="2017/2018", color='gray', elinewidth=4)

### 2018 = 365 days from today
my_query2018 = '''  SELECT `day_of_year`, YEAR(d_utc) AS yeary, `temp_f_davg` , temp_f_davg - temp_f_dmin AS temp_f_min , temp_f_dmin, temp_f_dmax - temp_f_davg AS temp_f_max ,temp_f_dmax, recs FROM `weather`.`v_E1248_daily` 
 WHERE DATE(d_utc) BETWEEN CURDATE() - INTERVAL 395 DAY AND CURDATE() - INTERVAL 365 DAY ORDER BY day_of_year ASC;'''
df1 = pd.read_sql_query(my_query2018,engine)
tempf_vals2018 = df1['temp_f_davg']
dater2018 = df1['day_of_year']
lower_y_error2018 = df1['temp_f_min']
upper_y_error2018 = df1['temp_f_max']
y_error = [lower_y_error2018, upper_y_error2018]
plt.errorbar(dater2018, tempf_vals2018, yerr = y_error, fmt='-o', ecolor='orange', label="2018/2019", color='orange', elinewidth=2)

### 2019 = 365 days from today
my_query2019 = '''  SELECT `day_of_year`, YEAR(d_utc) AS yeary, `temp_f_davg` , temp_f_davg - temp_f_dmin AS temp_f_min , temp_f_dmin, temp_f_dmax - temp_f_davg AS temp_f_max ,temp_f_dmax, recs FROM `weather`.`v_E1248_daily` 
 WHERE DATE(d_utc) BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE() ORDER BY day_of_year ASC;'''
df1 = pd.read_sql_query(my_query2019,engine)
tempf_vals2019 = df1['temp_f_davg']
dater2019 = df1['day_of_year']
lower_y_error2019 = df1['temp_f_min']
upper_y_error2019 = df1['temp_f_max']
y_error = [lower_y_error2019, upper_y_error2019]
plt.errorbar(dater2019, tempf_vals2019, yerr = y_error, fmt='-o', ecolor='blue', label="2019/2020", color='blue')

plt.vlines(int(dayofyear), ymin=1, ymax=80, colors='red', linewidth=1)
plt.annotate('This day', xy=(int(dayofyear), 0), xytext=(int(dayofyear)+0.25, 50), rotation='vertical', fontsize=10, color='red')
# plt.hlines(40,daym30,intofyear, colors='red',label="Rolling Avg for 2018", linestyles='dashed')

plt.ylabel("Daily Avg, Min, Max Temp (F)")
plt.minorticks_on()
plt.title("Retrospective Daily Avg, Max, Min Air Temps (F) by Day Number at E1248 on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='lower left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('daily_temps_compare_years.png', dpi=200)
plt.show()
plt.close()
