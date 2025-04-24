Time Series using Pandas

day_name()

sum()

count()

min()

max()

std()

mean()

median()


Time Series Functions

# date_range()
-- Create a range of dates

pd.date_range(
    start,
    end,
    freq='Day, Year, Month etc',
    period='no of records'
)

# to_datetime()
-- Convert strings → datetime objects

to_datetime(
    series,
    format='My date is %m%Y%d'
)

to_datetime(
    no of unit, (ex- 365 days)
    unit='Day, Year, Month etc', (ex- 'D')
    origin='Date from when to start' (ex- 'unix')
)

# set_index()
set_index('column_name')

reset_index('column_name') 

-- If reset_index is applied on series the it will convert it into DF

series.reset_index()

# resample
resample(
    'Day, Year, Month etc',
    closed='Right, Left',
    label='Right, Left',
    convention='start, end'
)

resample().min()

resample().max()

resample().sum()

and more

# To add multiple aggregation func 
df.resample().agg(
    {
        'col_name':'agg_func',
        'col_name':'mean
    }
)

'D': Daily

'W': Weekly

'M': Monthly

'Q': Quarterly

'Y': Yearly

'H': Hourly

'T': Minute

# rolling()
-- windows is for rows

df['col_name'].rolling(windows='no of rows').mean()

df.rolling(7).agg(
    {
        'col_name':'agg_func',
        'col_name':'mean
    }
)

# Shift
axis - {0 or ‘index’, 1 or ‘columns’}, default 0

df.shift(
    periods='no of rows,
    freq='D, M, Y etc',
    axis='columns'
)

df['col_name'].shift(
    periods='no of rows
)
