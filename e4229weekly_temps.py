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
my_query2017 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_e4229_weekly` WHERE (YEARY = 2017);'''
df1 = pd.read_sql_query(my_query2017,engine)
tempf_vals2017 = df1['w_temp_f_avg']
dater2017 = df1['WEEKW']
plt.plot(dater2017, tempf_vals2017, linestyle="", color="red", linewidth=1, marker='o', label="2017", markersize=8)

### 2018 
my_query2018 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_e4229_weekly` WHERE (YEARY = 2018);'''
df2018 = pd.read_sql_query(my_query2018,engine)
tempf_vals2018 = df2018['w_temp_f_avg']
dater2018 = df2018['WEEKW']
plt.plot(dater2018, tempf_vals2018, linestyle="", color="green", linewidth=1, marker='X', label="2018", markersize=6 )

### 2019 
my_query2019 = ''' SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_e4229_weekly` WHERE (YEARY = 2019);'''
df2019 = pd.read_sql_query(my_query2019,engine)
tempf_vals2019 = df2019['w_temp_f_avg']
dater2019 = df2019['WEEKW']
plt.plot(dater2019, tempf_vals2019, linestyle="", color="blue", linewidth=1, marker='D', label="2019", markersize=4 )

### 2019 
my_max = ''' SELECT max(WEEKW) as maxweek FROM `weather`.`v_e4229_weekly` WHERE (YEARY = 2019);'''
dfmaxweek = pd.read_sql_query(my_max,engine)
maxweek = dfmaxweek['maxweek']
# plt.plot(dater2019, tempf_vals2019, linestyle="", color="blue", linewidth=1, marker='D', label="2019", markersize=4 )
plt.vlines(maxweek, ymin=1, ymax=80, colors='#29d193', linewidth=1)
plt.annotate('Max Data Week', xy=(int(maxweek), 0), xytext=(int(maxweek)+0.25, 4), rotation='vertical', fontsize=10)

plt.vlines(14, ymin=1, ymax=80, colors='#0D0D0D', linewidth=1)
plt.vlines(25, ymin=1, ymax=80, colors='#0D0D0D', linewidth=1)
plt.annotate('Summer Solstice Week', xy=(25, 0), xytext=(25+0.25, 4), rotation='vertical', fontsize=10)
plt.vlines(int(todayweek), ymin=1, ymax=80, colors='#5C86F9', linewidth=1)
plt.annotate('This week', xy=(int(todayweek), 0), xytext=(int(todayweek)+0.25, 30), rotation='vertical', fontsize=10)
# plt.arrow(45, 80, 0, -80, length_includes_head=True, head_width=0.5, head_length=1)
# plt.annotate("Hi there", xy=(45,5), textcoords="offset points", xytext=(0,0), ha='center')

plt.ylabel("Weekly Avg Temp (F)")
plt.minorticks_on()
plt.title("Weekly Air Temps (F) by Week Number of Year from Station e4229 on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='upper left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('e4229weekly_temps_compare_years.png', dpi=200)
plt.show()
plt.close()