USE supply_chain_db;

-- Query 1: Find which Shipping Mode has the worst On-Time Delivery %

SELECT 
    shipping_mode,
    COUNT(order_item_id) AS total_orders,
    ROUND(AVG(is_on_time) * 100, 2) AS on_time_pct,
    ROUND(AVG(shipping_delay_days), 2) AS avg_delay_days,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(order_profit_per_order), 2) AS total_profit
FROM fact_orders
GROUP BY shipping_mode
ORDER BY on_time_pct ASC;

-- Query 2: Create a clean Master View for Power BI Desktop

CREATE OR REPLACE VIEW vw_supply_chain_master AS
SELECT 
    f.order_id,
    f.order_item_id,
    f.order_date,
    f.shipping_date,
    f.market,
    f.order_region,
    f.order_country,
    f.shipping_mode,
    f.delivery_status,
    f.days_for_shipping_real,
    f.days_for_shipment_scheduled,
    f.shipping_delay_days,
    f.is_on_time,
    f.late_delivery_risk,
    f.order_item_quantity,
    f.sales,
    f.order_item_discount,
    f.order_profit_per_order,
    c.customer_segment,
    c.customer_country,
    p.category_name,
    p.department_name,
    p.product_name
FROM fact_orders f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_products p ON f.product_card_id = p.product_card_id;