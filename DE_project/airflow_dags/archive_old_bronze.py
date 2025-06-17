import os
import shutil
from datetime import datetime, timedelta

def archive_bronze_data(base_path, archive_path, table_name, retention_days):
    print(f"Archiving started for table: {table_name}")
    source_path = os.path.join(base_path, "mysql", table_name)
    target_path = os.path.join(archive_path, "mysql", table_name)
    os.makedirs(target_path, exist_ok=True)

    cutoff = datetime.now() - timedelta(days=retention_days)
    print(f"Cutoff date for archiving: {cutoff.strftime('%Y-%m-%d')}")  

    for year in os.listdir(source_path):
        print(f"Processing year: {year}")
        year_path = os.path.join(source_path, year)
        if not os.path.isdir(year_path) or not year.isdigit(): continue

        for month in os.listdir(year_path):
            print(f"Processing month: {month}")
            month_path = os.path.join(year_path, month)
            if not os.path.isdir(month_path) or not month.isdigit(): continue

            for day in os.listdir(month_path):
                print(f"Processing day: {day}")
                day_path = os.path.join(month_path, day)
                if not os.path.isdir(day_path) or not day.isdigit(): continue

                try:
                    folder_date = datetime(int(year), int(month), int(day))
                except ValueError:
                    print(f"Skipping invalid folder: {year}/{month}/{day}")
                    continue

                if folder_date < cutoff:
                    dest_path = os.path.join(target_path, year, month)
                    print(f"Moving {day_path} to {dest_path}")
                    os.makedirs(dest_path, exist_ok=True)
                    shutil.move(day_path, os.path.join(dest_path, day))
                    print(f"Moved {day_path} to {os.path.join(dest_path, day)}")

    print(f"Archive done for table: {table_name}")
