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
my_query = '''SELECT YEARMONTH, NORM_DATE, monthly_elec_use, monthly_gas_use FROM v_monthly_utilities where YEAR(NORM_DATE) >= 2016; '''
df1 = pd.read_sql_query(my_query,engine)
elec_vals = df1['monthly_elec_use']
gas_vals = df1['monthly_gas_use']
dater = df1['NORM_DATE']

p1 = plt.bar(dater, elec_vals, width=20, color='#9cb9e5', label="Electricity")
p2 = plt.bar(dater, gas_vals, width=20, bottom=elec_vals,color='#445175', label="Gas")

plt.xlabel("Month - Normative Date")
plt.xticks(rotation=45)
plt.xticks(fontsize=8)
plt.minorticks_on()

# Make the figure wider to see things better
#
plt.title("Monthly Energy Use on: "+ today)
plt.ylabel('Energy (kWh of electricity + Therms of gas')
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')
plt.legend(loc='lower left', shadow=True)
plt.tight_layout() # optional to fix certain layout issues.
plt.savefig('monthly_energy_use.png', dpi=200)
plt.show()
plt.close()
