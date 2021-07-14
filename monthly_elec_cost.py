import matplotlib.pyplot as plt
import pandas as pd
import sqlalchemy
import numpy as np
import matplotlib.units as munits
import matplotlib.dates as mdates
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()
from matplotlib.offsetbox import AnchoredText

converter = mdates.ConciseDateConverter()

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@127.0.0.1:3306/weather')

my_query = ''' SELECT `elec_cost`, `NORM_DATE`, `shades`, `monthly_elec_use` FROM `v_monthly_utilities` WHERE kwh_per_dollars IS NOT NULL; '''
df1 = pd.read_sql_query(my_query,engine)
cost = df1['elec_cost']
shades = df1['shades']
xaxis = df1['NORM_DATE']
width = 20


fig, ax = plt.subplots(figsize=(12, 6))

ax.bar(xaxis, cost, width, color='#006d69', label="M")

ax.set_xlabel('Months',fontsize=15,fontweight='bold')
ax.set_ylabel('Sum Electric Bills (dollars)',fontsize=15,fontweight='bold')
ax.set_title('Monthly Electricity Cost', color="black",fontsize=15,fontweight='bold')

ax.grid(True)
fig.tight_layout()
# ax.legend(loc='lower center', ncol=2, fancybox=True, framealpha=1, shadow=True, borderpad=1)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')


plt.savefig('monthly_elec_cost_dollars.png', dpi=200)
plt.show()
plt.close()