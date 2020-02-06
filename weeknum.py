import datetime
import os
import pprint
import sys

# show what python is being used
print(sys.prefix)

today = datetime.datetime.now().strftime("%Y, %M, %d")
week = datetime.datetime.now().strftime("%W")
print(today)
print(week + " hi")


week1 = datetime.date(2010, 6, 22).isocalendar()[1]
# week2 = datetime.date(today).isocalendar()[1]

print(week1)
# print(week2)

print(os.name)

# Get the list of user's
# environment variables
env_var = os.environ

# Print the list of user's
# environment variables
print("User's Environment variable:")
pprint.pprint(dict(env_var), width=1)

print("Working with user set variables ********")
# Set environment variables
os.environ['API_USER'] = 'username'
os.environ['API_PASSWORD'] = 'secret'

# Get environment variables
USER = os.getenv('API_USER')
PASSWORD = os.environ.get('API_PASSWORD')


# Getting non-existent keys
FOO = os.getenv('FOO') # None
BAR = os.environ.get('BAR') # None
# BAZ = os.environ['BAZ'] # KeyError: key does not exist.