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



# Make the figure wider to see things better
plt.figure(figsize=(14,6))

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@localhost:3306/weather')

### E1248 

my_query = '''  SELECT `MIN_DAY`, `YEARWEEK`, `w_temp_f_avg` , w_temp_f_avg - w_temp_f_min AS temp_f_min , w_temp_f_max - w_temp_f_avg AS temp_f_max, sum_recs FROM `weather`.`v_E1248_weekly` WHERE sum_recs > 1 ORDER BY MIN_DAY ASC;'''
df1 = pd.read_sql_query(my_query,engine)
tempf_vals = df1['w_temp_f_avg']
dater = df1['YEARWEEK']
lower_y_error = df1['temp_f_min']
upper_y_error = df1['temp_f_max']
y_error = [lower_y_error, upper_y_error]
plt.errorbar(dater, tempf_vals, yerr = y_error, fmt='-o', ecolor='black', label="E1248", color='blue', elinewidth=2)


plt.ylabel("All Data Weekly Avg, Min, Max Temp (F)")
plt.xlabel("Year and Week Number")
plt.xticks(rotation=45)
plt.xticks(fontsize=4)

# plt.xaxis.set_major_locator(plt.MaxNLocator(30))
plt.locator_params(axis='x', nbins=10)
plt.title("Retrospective Weekly Ranges (Avg, Max, Min) Air Temps (F) by Week Number at E1248 on: "+ today)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='lower left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('all_weekly_temps_E1248_ranges.png', dpi=200)
plt.show()
plt.close()
