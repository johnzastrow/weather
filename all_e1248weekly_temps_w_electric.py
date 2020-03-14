import matplotlib.pyplot as plt
import pandas as pd
import sqlalchemy
import numpy as np
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)
from datetime import datetime, timedelta
import datetime
today = (datetime.datetime.now().strftime("%Y-%m-%d"))
todayweek = (datetime.datetime.now().strftime("%W"))
todayyear = (datetime.datetime.now().strftime("%Y"))
endwindow = (datetime.datetime.now().strftime("%Y"))
dayofyear = (datetime.datetime.now().strftime("%j"))
intofyear = int(dayofyear)
plotweek = int(todayweek) - 12
daym30 = intofyear - 30

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@127.0.0.1:3306/weather')

### E1248 Temps
my_query = ''' SELECT `MIN_DAY`, `YEARWEEK`, `w_temp_f_avg` , w_temp_f_avg - w_temp_f_min AS temp_f_min , w_temp_f_max - w_temp_f_avg AS temp_f_max, sum_recs FROM `v_E1248_weekly` WHERE sum_recs > 1 ORDER BY MIN_DAY ASC; '''
df1 = pd.read_sql_query(my_query,engine)
tempf_vals = df1['w_temp_f_avg']
dater = df1['MIN_DAY']
lower_y_error = df1['temp_f_min']
upper_y_error = df1['temp_f_max']
y_error = [lower_y_error, upper_y_error]
# plt.errorbar(dater, tempf_vals, yerr = y_error, markersize=2, fmt='-o', ecolor='#9cb9e5', label="E1248 Temp", color='#1269ea', elinewidth=2)


# House electric
my_query_elec = ''' SELECT `MIN_DAY`, `SUM_KWH` FROM `v_weekly_electric_use` where MIN_DAY > '2017-05-01' ORDER BY MIN_DAY ASC;'''
df1 = pd.read_sql_query(my_query_elec,engine)
elec_vals = df1['SUM_KWH']
dater_elec = df1['MIN_DAY']
# plt.plot(dater_elec, elec_vals, markersize=2, label="E1248 Elec", color='black')

# Make the figure wider to see things better
# plt.figure(figsize=(14,6))
# create figure and axis objects with subplots()
fig,ax = plt.subplots(figsize=(12, 6))

# make a plot
ax.errorbar(dater, tempf_vals, yerr = y_error, markersize=2, fmt='-o', ecolor='#9cb9e5', label="E1248 Temp", color='#1269ea', elinewidth=2)
# set x-axis label
ax.set_xlabel("Date",fontsize=12)
# set y-axis label
ax.set_ylabel("Temperature (F)",color="black",fontsize=12)
# twin object for two different y-axis on the sample plot
ax2=ax.twinx()
# make a plot with different y-axis using second axis object
ax2.plot(dater_elec, elec_vals,color="black",marker="o", markersize=2, label="E1248 Elec")
ax2.set_ylabel("Sum Electricity Usage (kWh / week)",color="black",fontsize=12)



# plt.ylabel("All Data Weekly Avg, Min, Max Temp (F)")
plt.xlabel("Year and Week Number")
plt.xticks(rotation=45)
plt.xticks(fontsize=8)
plt.minorticks_on()



plt.title("Weekly Air Temps (Avg, Max, Min) (F) at E1248 and Weekly Electricity Use on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='lower left', shadow=True)
ax.legend(loc='lower right', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('all_e1248_weekly_elect_temp_ranges.png', dpi=200)
plt.show()
plt.close()
