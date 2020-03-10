import matplotlib.pyplot as plt
import pandas as pd
import sqlalchemy
import numpy as np
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()
from matplotlib import dates as mpl_dates
from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)
import datetime
today = (datetime.datetime.now().strftime("%Y-%m-%d"))
print(today)
todayweek = (datetime.datetime.now().strftime("%W"))

# Make the figure wider to see things better
plt.figure(figsize=(12,6))

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@localhost:3306/weather')

### 2017 
my_query2017 = ''' SELECT `day_of_year`, YEAR(d_utc) AS yeary, `temp_f_davg` , `temp_f_dmin` , `temp_f_dmax`, recs FROM `weather`.`v_E1248_daily` WHERE YEAR(d_utc)=2018 AND recs >200 ORDER BY day_of_year ASC;'''
df1 = pd.read_sql_query(my_query2017,engine)
tempf_vals2017 = df1['temp_f_davg']
dater2017 = df1['day_of_year']
lower_y_error2017 = df1['temp_f_dmin']
upper_y_error2017 = df1['temp_f_dmax']
y_error = [lower_y_error2017, upper_y_error2017]
# plt.errorbar(x, y, yerr = y_error
plt.errorbar(dater2017, tempf_vals2017, yerr = y_error, fmt='-o')
plt.plot(dater2017, tempf_vals2017, linestyle="", color="red", linewidth=1, marker='o', label="2017", markersize=2)


# ### 2018 
# my_query2018 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_E1248_weekly` WHERE (YEARY = 2018) and WEEKW <= 52;'''
# df2018 = pd.read_sql_query(my_query2018,engine)
# tempf_vals2018 = df2018['w_temp_f_avg']
# dater2018 = df2018['WEEKW']
# plt.plot(dater2018, tempf_vals2018, linestyle="", color="green", linewidth=1, marker='X', label="2018", markersize=6 )

# ### 2019 
# my_query2019 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_E1248_weekly` WHERE (YEARY = 2019) and WEEKW <= 52;'''
# df2019 = pd.read_sql_query(my_query2019,engine)
# tempf_vals2019 = df2019['w_temp_f_avg']
# dater2019 = df2019['WEEKW']
# plt.plot(dater2019, tempf_vals2019, linestyle="", color="blue", linewidth=1, marker='D', label="2019", markersize=4 )

# ### 2020 
# my_query2020 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_E1248_weekly` WHERE (YEARY = 2020) and WEEKW <= 52;'''
# df1 = pd.read_sql_query(my_query2020,engine)
# tempf_vals2020 = df1['w_temp_f_avg']
# dater2020 = df1['WEEKW']
# plt.plot(dater2020, tempf_vals2020, linestyle="", color="#b752bf", linewidth=1, marker='>', label="2020", markersize=8)

### Max  
my_max = ''' SELECT max(WEEKW) as maxweek FROM `weather`.`v_E1248_weekly` WHERE (YEARY = 2020);'''
dfmaxweek = pd.read_sql_query(my_max,engine)
maxweek = dfmaxweek['maxweek']


# Drawings
plt.vlines(maxweek, ymin=1, ymax=80, colors='#29d193', linewidth=1)
plt.annotate('Max Data Week', xy=(int(maxweek), 0), xytext=(int(maxweek)+0.25, 4), rotation='vertical', fontsize=10)
plt.vlines(52, ymin=1, ymax=80, colors='#0D0D0D', linewidth=1)
plt.annotate('Winter Holidays', xy=(52, 0), xytext=(52.25, 30), rotation='vertical', fontsize=10)
plt.vlines(21, ymin=1, ymax=80, colors='#0D0D0D', linewidth=1)
plt.annotate('May 25', xy=(21, 0), xytext=(21+0.25, 4), rotation='vertical', fontsize=10)
plt.vlines(25, ymin=1, ymax=80, colors='#0D0D0D', linewidth=1)
plt.annotate('Summer Solstice Week', xy=(25, 0), xytext=(25+0.25, 4), rotation='vertical', fontsize=10)
plt.vlines(int(todayweek), ymin=1, ymax=80, colors='#5C86F9', linewidth=1)
plt.annotate('This week', xy=(int(todayweek), 0), xytext=(int(todayweek)+0.25, 30), rotation='vertical', fontsize=10)

plt.ylabel("Daily Avg, Min, Max Temp (F)")
plt.minorticks_on()
plt.title("Daily Avg, Min, Max Air Temps (F) by Day Number of Year from Station e1248 on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='upper left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('e1248daily_temps_compare_years.png', dpi=200)
plt.show()
plt.close()
