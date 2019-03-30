import pandas as pd
import sqlalchemy

engine = sqlalchemy.create_engine('mysql+pymysql://jcz:yub.miha@192.168.1.110:3306/weather')

df = pd.read_sql_table("gas_bills", engine)
df