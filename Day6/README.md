# diff()
-- Gives the differences

df.diff(period='no of rows')

# pct_change()
-- Gives the differences in percentage

df.pct_change(period='no of days')

# interpolate()

-- replace nan values with other values that can pausibly replace nan

-- If there is a missing data that we dont want to use drop then we can use interpolate

df.interpolate()

# between_time()
-- works on DateTimeIndex 

-- Select rows between specific times of day, like 9AM to 5PM 

--Your datetime index must include time info

df.between_time('09:00', '17:00')


# at_time()
-- Grab rows that happened at a specific time

df.at_time('20:00')

# tz_localize()
-- Assigns a timezone to a naive datetime (makes it aware)

df.index = df.index.tz_localize('UTC')

# tz_convert()
-- Converts from one timezone to another

df.index = df.index.tz_convert('Asia/Kolkata')

# truncate()
-- cut the df between 2 dates

df.truncate(before='2023-01-10', after='2023-02-01')


# where()
-- Conditional filtering without dropping rows

df['high_val'] = df['High'].where(df['High'] > 100)

# .dt accessor
-- Extract day, month, year, weekday, hour, etc. from datetime column

df['month'] = df['Date'].dt.month
df['weekday'] = df['Date'].dt.day_name()
