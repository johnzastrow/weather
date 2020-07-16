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

# House electric
my_query_elec = ''' SELECT `MIN_DAY`, `SUM_KWH` FROM `v_weekly_electric_use` where MIN_DAY > '2017-05-01' ORDER BY MIN_DAY ASC;'''
df1 = pd.read_sql_query(my_query_elec,engine)
elec_vals = df1['SUM_KWH']
dater_elec = df1['MIN_DAY']

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



# Drawings
plt.vlines('2017-10-01', ymin=1, ymax=500, colors='#5ca800', linewidth=3)
plt.annotate('House remodel', xy=('2017-10-03', 400), xytext=('2017-10-06', 50), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
plt.vlines('2018-01-01', ymin=1, ymax=500, colors='#d18700', linewidth=3)
plt.annotate('2018', xy=('2018-01-03', 400), xytext=('2018-01-06', 400), rotation='vertical', fontsize=10, color='#d18700')
plt.vlines('2019-01-01', ymin=1, ymax=500, colors='#d18700', linewidth=3)
plt.annotate('2019', xy=('2019-01-03', 400), xytext=('2019-01-06', 400), rotation='vertical', fontsize=10, color='#d18700')
plt.vlines('2020-01-01', ymin=30, ymax=500, colors='#d18700', linewidth=3)
plt.annotate('2020', xy=('2020-01-03', 400), xytext=('2020-01-06', 400), rotation='vertical', fontsize=10, color='#d18700')
plt.vlines('2020-03-16', ymin=30, ymax=500, colors='#5ca800', linewidth=3)
plt.annotate('COVID-19', xy=('2020-03-17', 400), xytext=('2020-03-20', 50), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
plt.vlines('2020-06-14', ymin=30, ymax=500, colors='#5ca800', linewidth=3)
plt.annotate('Hot Tub', xy=('2020-06-16', 400), xytext=('2020-06-18', 50), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
plt.vlines('2020-07-09', ymin=30, ymax=500, colors='#5ca800', linewidth=3)
plt.annotate('Basement Dehumid', xy=('2020-07-11', 400), xytext=('2020-07-14', 50), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')


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
plt.savefig('all_weekly_e1248_elect_temp_ranges.png', dpi=200)
plt.show()
plt.close()
