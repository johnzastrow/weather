import configparser
import sqlalchemy

config = configparser.ConfigParser()
config.read('ini.config')

def connect():
      engine = sqlalchemy.create_engine('mysql+pymysql://''user'':''pass''@''host'':3306/''db')