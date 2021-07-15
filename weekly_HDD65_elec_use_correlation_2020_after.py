# weekly_temp_elec_use_correlation.py

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

my_query = ''' SELECT
    `MIN_DAY`
    , `e1248_avg_degf`
    , `e1248_sum_hdd65`
    , `SUM_KWH`
    , `shades`
FROM
    `weather`.`v_weekly_temp_elec_use` where year(MIN_DAY) >= 2020; '''

df1 = pd.read_sql_query(my_query,engine)
cost = df1['SUM_KWH']
shades = df1['shades']
xaxis = df1['e1248_sum_hdd65']


fig, ax = plt.subplots(figsize=(12, 6))

ax.scatter(xaxis, cost, c=shades, label="Use:Temp Ratio Colored by Season. Red-Summer, Brown-Fall, Blue-Winter, Green-Spring")

ax.set_xlabel('Weekly Heating Degree Day (HDD 65 Degrees)',fontsize=15,fontweight='bold')
ax.set_ylabel('Sum kwh per week',fontsize=15,fontweight='bold')
ax.set_title('Ratio of Electic Use to Weekly HDD 2020 and After', color="black",fontsize=15,fontweight='bold')

ax.grid(True)
fig.tight_layout()
ax.legend(loc='lower center', ncol=2, fancybox=True, framealpha=1, shadow=True, borderpad=1)
plt.grid(b=True, which='major', color='#CCCCCC', linestyle='--')
plt.grid(b=True, which='minor', color='#CCCCCC', linestyle=':')


plt.savefig('weekly_elec_use_hdd65_corr_2020gt.png', dpi=200)
plt.show()
plt.close()