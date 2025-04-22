import datetime
import pytz

'''
Aware - It exactly knows which timezone it belongs to (UTC, IST, etc)
Naive - If the object does not include timezone info like IST, UTC etc

dt = datetime.datetime.now()
dt.tzinfo #If it give info then it is aware else naive
'''

# Date obj
date_obj = datetime.date
print(date_obj)

# Time obj
time_obj = datetime.time
print(time_obj)


# Timedelta obj
timedelta_obj = datetime.timedelta
print(timedelta_obj)


# tzinfo obj
tzinfo_obj = datetime.tzinfo
print(tzinfo_obj)


# Timezone obj
timezone_obj = datetime.timezone
print(timezone_obj)


# ----------------------------DATE-------------------------------
# Date
date = datetime.date(2020, 4, 20)
print(date)

# Current Date
curr_date = datetime.date.today()
print(curr_date)
# Monday=0 , Sunday=6
print(curr_date.weekday())
# Monday=1 , Sunday=7
print(curr_date.isoweekday())

timedelta = datetime.timedelta(days=7)
# Get 1 week ahead day from now
print(curr_date + timedelta)
# Get 1 week past day from now
print(curr_date - timedelta)

# Get the timedelta
random_day = datetime.date(2024, 10, 10)
delta = curr_date - random_day
print(delta)
# print days without time
print(delta.days)
# get the seconds
print(delta.total_seconds())



# ----------------------------TIME-------------------------------
# time 
'''
Max Limit
Hour - 23
Minutes - 50
seconds - 59
miliseconds - 999999
'''
t = datetime.time(10, 34, 59, 100000)
print(t)


# ----------------------------DATETIME-------------------------------
# datetime
date_time = datetime.datetime(2024, 6, 29, 10, 34, 59, 100000)
print(date_time)

# Get current date time
curr_datetime = datetime.datetime.now()
print(curr_datetime)
# get current year
print(curr_datetime.year)
# get current month
print(curr_datetime.month)
# get current day
print(curr_datetime.day)
# get current hour
print(curr_datetime.hour)
# get current minutes
print(curr_datetime.minute)
# get current second
print(curr_datetime.second)
# get current microsecond
print(curr_datetime.microsecond)

# ----------------------------TIMEDELTA-------------------------------
# Timedelta usage
# year 
tdy = datetime.timedelta(weeks=52)
print(curr_datetime + tdy)
# Days 
tdd = datetime.timedelta(days=10)
print(curr_datetime + tdd)
# Hours 
tdh = datetime.timedelta(hours=50)
print(curr_datetime + tdh)
# Minutes 
tdm = datetime.timedelta(minutes=10)
print(curr_datetime + tdm)
# Millisecond 
tdms = datetime.timedelta(milliseconds=1000)
print(curr_datetime + tdms)

# ----------------------------TIMEZONE-------------------------------
dt_now = datetime.datetime.now()
print("dt_now",dt_now)
dt_today = datetime.datetime.today()
print("dt_today",dt_today)
dt_utcnow = datetime.datetime.utcnow()
print("dt_utcnow",dt_utcnow)


# Timezone using pytz
dt_timezone = datetime.datetime.now(tz=pytz.UTC)
print("dt_timezone",dt_timezone)

# Timezone for different places
for tz in pytz.all_timezones:
    pass
    # print(tz)

# India Time
dt_ind = dt_timezone.astimezone(pytz.timezone('Asia/Kolkata'))
print(dt_ind)

# ----------------------------PARSING-------------------------------

# strftime - Converts Datetime to string
# strptime - Converts string to Datetime

'''
Code    | Meaning           | Example
%Y      | Year (4 digit)    | 2025
%m      | Month (01-12)     | 04
%d      | Day (01-31)       | 21
%H      | Hour (00-23)      | 15
%M      | Minute            | 30
%S      | Second            | 45
%A      | Weekday Name      | Monday
%B      | Month Name        | April
'''     

date_str = "2025-04-21 15:30"
dt = datetime.datetime.strptime(date_str, "%Y-%m-%d %H:%M")
print("string to datetime", dt, type(dt))


dt = datetime.datetime.now()
dt = dt.strftime("%A, %d %B %Y")
print("datetime to string", dt, type(dt))
