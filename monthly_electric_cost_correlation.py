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

my_query = ''' SELECT `NORM_DATE`, `kwh_per_dollars`, `NORM_DATE`, `shades`, `monthly_elec_use` FROM `v_monthly_utilities` WHERE kwh_per_dollars IS NOT NULL; '''
df1 = pd.read_sql_query(my_query,engine)
cost = df1['monthly_elec_use']
shades = df1['shades']
xaxis = df1['kwh_per_dollars']


fig, ax = plt.subplots(figsize=(12, 6))

ax.scatter(xaxis, cost, c=shades, label="Use:Cost Ratio Colored by Season. Red-Summer, Brown-Fall, Blue-Winter, Green-Spring")

ax.set_xlabel('Monthly kwh per dollars (monthly kwh used / electric bill)',fontsize=15,fontweight='bold')
ax.set_ylabel('Sum kwh per month',fontsize=15,fontweight='bold')
ax.set_title('Cost of Electrons by Usage', color="black",fontsize=15,fontweight='bold')

ax.grid(True)
fig.tight_layout()
ax.legend(loc='lower center', ncol=2, fancybox=True, framealpha=1, shadow=True, borderpad=1)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')


plt.savefig('monthly_elec_cost_use.png', dpi=200)
plt.show()
plt.close()