import pandas as pd
from sqlalchemy import create_engine, text

# 1. Connect to MySQL Server first and create the database automatically
root_engine = create_engine("mysql+pymysql://root:vamshi@localhost:3306")
with root_engine.connect() as conn:
    conn.execute(text("CREATE DATABASE IF NOT EXISTS supply_chain_db;"))
    conn.commit()

# 2. Now connect directly to your new supply_chain_db database
engine = create_engine("mysql+pymysql://root:vamshi@localhost:3306/supply_chain_db")

folder = r"C:\Users\ADMIN\Desktop\supply chain analytics"

# 3. Read the 3 clean CSV files
dim_customers = pd.read_csv(folder + r"\dim_customers.csv")
dim_products = pd.read_csv(folder + r"\dim_products.csv")
fact_orders = pd.read_csv(folder + r"\fact_orders.csv")

# 4. Upload all 3 tables into MySQL automatically
dim_customers.to_sql("dim_customers", con=engine, if_exists="replace", index=False)
dim_products.to_sql("dim_products", con=engine, if_exists="replace", index=False)
fact_orders.to_sql("fact_orders", con=engine, if_exists="replace", index=False, chunksize=10000)

print("DONE! All 3 tables are now inside MySQL supply_chain_db.")
