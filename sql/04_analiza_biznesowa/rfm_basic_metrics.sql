-- Najbardziej wartościowi klienci
SELECT 
    customer_id,
    DATE_PART('day', '2011-12-10'::timestamp - MAX(invoice_date)) as days_since_last_purchase,
    COUNT(DISTINCT invoice) as total_orders,
    SUM(revenue) as total_spent,
    ROUND(SUM(revenue) / COUNT(DISTINCT invoice), 2) as avg_order_value
FROM rfm_transactions
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 20;