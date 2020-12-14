import matplotlib.pyplot as plt
import matplotlib.dates as dates
import pandas as pd
import sqlalchemy
import numpy as np
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)
from datetime import datetime, timedelta

date_string = "2017-01-01"
date_object = datetime.strptime(date_string, "%Y-%m-%d")

print("date_object =", date_object)
x = matplotlib.dates.date2num(date_object)
print("x =", x)