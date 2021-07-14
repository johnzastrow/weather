import matplotlib.pyplot as plt
import pandas as pd
import sqlalchemy
import numpy as np
import matplotlib.dates as mdates
from pandas.plotting import register_matplotlib_converters

register_matplotlib_converters()

import matplotlib.units as munits

converter = mdates.ConciseDateConverter()
# munits.registry[np.datetime64] = converter
# munits.registry[datetime.date] = converter
# munits.registry[datetime.datetime] = converter

from matplotlib.ticker import MultipleLocator, FormatStrFormatter, AutoMinorLocator
from datetime import datetime, timedelta
import datetime

today = datetime.datetime.now().strftime("%Y-%m-%d")
todayweek = datetime.datetime.now().strftime("%W")
todayyear = datetime.datetime.now().strftime("%Y")
endwindow = datetime.datetime.now().strftime("%Y")
dayofyear = datetime.datetime.now().strftime("%j")
intofyear = int(dayofyear)
plotweek = int(todayweek) - 12
daym30 = intofyear - 30

engine = sqlalchemy.create_engine("mysql+pymysql://jcz:yub.miha@127.0.0.1:3306/weather")

### E1248 Temps
my_query = """ SELECT `d_utc`, `temp_f_davg` , temp_f_davg - temp_f_dmin AS temp_f_min , temp_f_dmax - temp_f_davg AS 
temp_f_max FROM `v_E1248_daily` WHERE DATE(d_utc) BETWEEN CURDATE() - INTERVAL 60 DAY AND CURDATE() and temp_f_dmin > 0; """
df1 = pd.read_sql_query(my_query, engine)
tempf_vals = df1["temp_f_davg"]
dater = df1["d_utc"]
lower_y_error = df1["temp_f_min"]
upper_y_error = df1["temp_f_max"]
y_error = [lower_y_error, upper_y_error]

# House electric
my_query_elec = """ SELECT `d_local`, ROUND(`d_kwh` * 0.25, 2) AS daily_cost FROM `v_daily_electric`  WHERE DATE(d_local) BETWEEN CURDATE() - INTERVAL 60 DAY AND CURDATE();  """
df1 = pd.read_sql_query(my_query_elec, engine)
elec_vals = df1["daily_cost"]
dater_elec = df1["d_local"]

fig, ax = plt.subplots(figsize=(12, 6))

# make a plot

# locator = mdates.AutoDateLocator(minticks=3, maxticks=7)
# formatter = mdates.ConciseDateFormatter(locator)
# ax.xaxis.set_major_locator(locator)
# ax.xaxis.set_major_formatter(formatter)

ax.errorbar(
    dater,
    tempf_vals,
    yerr=y_error,
    markersize=4,
    fmt="-o",
    ecolor="#9cb9e5",
    label="E1248 Temp (avg, min.max)",
    color="#1269ea",
    elinewidth=4,
)
# set x-axis label
ax.set_xlabel("Date", fontsize=12)
# set y-axis label
ax.set_ylabel("Temperature (F)", color="black", fontsize=12)
# twin object for two different y-axis on the sample plot
ax2 = ax.twinx()
# make a plot with different y-axis using second axis object
ax2.plot(
    dater_elec,
    elec_vals,
    color="black",
    marker="o",
    markersize=2,
    label="Daily electric cost (dollars)",
)
ax2.set_ylabel("Electricity Usage (Dollars / day)", color="black", fontsize=12)

# Drawings
# plt.annotate('Saluspa Hot tub in garage', xy=('2021-04-01', 50), xytext=('2021-04-01', 15), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
# plt.vlines('2021-04-12', ymin=5, ymax=100, colors='#5ca800', linewidth=3)
# plt.annotate('Softub Installed', xy=('2021-04-11', 50), xytext=('2021-04-11', 15), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
# plt.annotate('Softub moved outside', xy=('2021-05-07', 50), xytext=('2021-05-07', 15), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
# plt.annotate('Trip Start', xy=('2021-04-19', 50), xytext=('2021-04-19', 15), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
# plt.annotate('Trip Stop', xy=('2021-04-28', 50), xytext=('2021-04-28', 15), rotation='vertical', fontsize=10, color='#5ca800', fontweight='heavy')
# plt.hlines(50,'2021-04-01','2021-04-12', colors="#BBBBBB", linestyles='dashdot', label='Inflatable tub avg elec',linewidth=2 )
# plt.hlines(
#     33,
#     "2021-05-13",
#     "2021-06-01",
#     colors="#BBBBBB",
#     linestyles="dashed",
#     label="Softub tub avg elec",
#     linewidth=2,
# )


# plt.ylabel("All Data  Avg, Min, Max Temp (F)")
plt.xlabel("Date")
plt.xticks(rotation=45)
plt.xticks(fontsize=8)
plt.minorticks_on()

plt.title(
    "Last 60 Days of Daily Air Temps (Avg, Max, Min) (F) at E1248 and Daily Electricity Cost ($0.25 per kwh) from: "
    + today
)
plt.grid(b=True, which="major", color="#CCCCCC", linestyle="--")
plt.grid(b=True, which="minor", color="#CCCCCC", linestyle=":")
plt.legend(loc="upper left", shadow=True)
ax.legend(loc="lower right", shadow=True)
plt.tight_layout()  # optional to fix certain layout issues.
plt.savefig("daily_e1248_elect_temp.png", dpi=200)
plt.show()
plt.close()
