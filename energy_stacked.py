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

plt.figure(figsize=(12,6))
### utility use
my_query = '''SELECT YEARMONTH, NORM_DATE, monthly_elec_use, monthly_gas_use FROM v_monthly_utilities where year(NORM_DATE) >= 2017; '''
df1 = pd.read_sql_query(my_query,engine)
elec_vals = df1['monthly_elec_use']
gas_vals = df1['monthly_gas_use']
dater = df1['NORM_DATE']

p1 = plt.bar(dater, gas_vals, width=20, bottom=elec_vals,color='#445175', label="Gas")
p2 = plt.bar(dater, elec_vals, width=20, color='#9cb9e5', label="Electricity")


plt.xlabel("Month - Normative Date")
plt.xticks(rotation=45)
plt.xticks(fontsize=8)
plt.minorticks_on()

# Drawings
plt.vlines('2017-10-01', ymin=1, ymax=2000, colors='#bbbbbb', linewidth=3)
plt.annotate('House remodel', xy=('2017-10-03', 1000), xytext=('2017-10-04', 1200), rotation='vertical', fontsize=10)

plt.vlines('2018-01-01', ymin=1, ymax=2000, colors='#0D0D0D', linewidth=3)
plt.annotate('2018', xy=('2018-01-03', 1000), xytext=('2018-01-04', 1200), rotation='vertical', fontsize=10)

plt.vlines('2019-01-01', ymin=1, ymax=2000, colors='#0D0D0D', linewidth=3)
plt.annotate('2019', xy=('2019-01-03', 1000), xytext=('2019-01-04', 1200), rotation='vertical', fontsize=10)

plt.vlines('2020-01-01', ymin=1, ymax=2000, colors='#0D0D0D', linewidth=3)
plt.annotate('2020', xy=('2020-01-03', 1000), xytext=('2020-01-04', 1200), rotation='vertical', fontsize=10)

plt.vlines('2020-03-16', ymin=1, ymax=2000, colors='#bbbbbb', linewidth=3)
plt.annotate('COVID-19 Lockdown', xy=('2020-03-17', 1000), xytext=('2020-03-18', 1200), rotation='vertical', fontsize=10)

plt.vlines('2020-06-14', ymin=1, ymax=2000, colors='#bbbbbb', linewidth=3)
plt.annotate('Hot Tub Installed', xy=('2020-06-15', 1000), xytext=('2020-06-16', 1200), rotation='vertical', fontsize=10)

plt.vlines('2021-01-01', ymin=1, ymax=2000, colors='#0D0D0D', linewidth=3)
plt.annotate('2021', xy=('2021-01-03', 1000), xytext=('2021-01-04', 1200), rotation='vertical', fontsize=10)

plt.vlines('2021-04-12', ymin=1, ymax=2000, colors='#0D0D0D', linewidth=3)
plt.annotate('Softub Installed', xy=('2021-04-14', 1000), xytext=('2021-04-15', 1200), rotation='vertical', fontsize=10)


# add explanation box about BTUs
# x = [datetime.strptime('2017-01-01','%Y-%m-%d')]
# x = matplotlib.dates.date2num(x)
# plt.text(1750, x, "eggs", size=10, rotation=0.0,
#          ha="left", va="center",
#          bbox=dict(boxstyle="round",
#                    ec=(1., 0.5, 0.5),
#                    fc=(1., 0.8, 0.8),
#                    )
#          )

# Make the figure wider to see things better
#
plt.title("Monthly Energy Use on: "+ today)
plt.ylabel('Energy (kWh of electricity + Therms (100,000 BTUs) of gas')
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='upper left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('monthly_stacked_energy_use.png', dpi=200)
plt.show()
plt.close()
