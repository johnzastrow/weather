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
todayyear = (datetime.datetime.now().strftime("%Y"))
plotweek = int(todayweek) - 12
print(plotweek)

# Make the figure wider to see things better
plt.figure(figsize=(12,12))

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@localhost:3306/weather')

### E4229 
my_queryE4229 = "SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_e4229_weekly` WHERE (YEARY = " + str(todayyear) + " and WEEKW >= "+str(plotweek)+")";
df1 = pd.read_sql_query(my_queryE4229,engine)
tempf_valsE4229 = df1['w_temp_f_avg']
daterE4229 = df1['WEEKW']
plt.plot(daterE4229, tempf_valsE4229, linestyle="", color="red", linewidth=1, marker='o', label="E4229", markersize=4)

### E4279 
my_queryE4279 = "SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_E4279_weekly` WHERE (YEARY = " + str(todayyear) + " and WEEKW >= "+str(plotweek)+")";
df1 = pd.read_sql_query(my_queryE4279,engine)
tempf_valsE4279 = df1['w_temp_f_avg']
daterE4279 = df1['WEEKW']
plt.plot(daterE4279, tempf_valsE4279, linestyle="", color="#8234db", linewidth=1, marker='^', label="E4279", markersize=4)

### E1248 
my_queryE1248 = "SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_E1248_weekly` WHERE (YEARY = " + str(todayyear) + " and WEEKW >= "+str(plotweek)+")";
df1 = pd.read_sql_query(my_queryE1248,engine)
tempf_valsE1248 = df1['w_temp_f_avg']
daterE1248 = df1['WEEKW']
plt.plot(daterE1248, tempf_valsE1248, linestyle="", color="blue", linewidth=1, marker='D', label="E1248", markersize=4)

### KPWM
my_queryKPWM= "SELECT `WEEKW`, `w_temp_f_avg` FROM `weather`.`v_KPWM_weekly` WHERE (YEARY = " + str(todayyear) + " and WEEKW >= "+str(plotweek)+")";
print(my_queryKPWM)
df1 = pd.read_sql_query(my_queryKPWM,engine)
tempf_valsKPWM= df1['w_temp_f_avg']
daterKPWM= df1['WEEKW']
plt.plot(daterKPWM, tempf_valsKPWM, linestyle="", color="green", linewidth=1, marker='$K$', label="KPWM", markersize=4)

### show line of the max week of data.  
my_max = ''' SELECT max(WEEKW) as maxweek FROM `weather`.`v_e4229_weekly` WHERE (YEARY = 2019);'''
dfmaxweek = pd.read_sql_query(my_max,engine)
maxweek = dfmaxweek['maxweek']
plt.vlines(maxweek, ymin=40, ymax=60, colors='#29d193', linewidth=1)
plt.annotate('Max Data Week', xy=(int(maxweek), 0), xytext=(int(maxweek)+0.25, 4), rotation='vertical', fontsize=10)

# show line with the current week the plot was generated
plt.vlines(int(todayweek), ymin=40, ymax=60, colors='#5C86F9', linewidth=1)
plt.annotate('This week', xy=(int(todayweek), 0), xytext=(int(todayweek)+0.25, 30), rotation='vertical', fontsize=10)


plt.ylabel("Weekly Avg Temp (F)")
plt.minorticks_on()
plt.title("Weekly Air Temps (F) by Day of Year from Recent 12 Weeks at All Stations on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='lower left', shadow=True)
# plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('all_stations_weekly_temps_compare_years.png')
plt.show()
plt.close()