-- =====================================================
-- E-TİCARET PROJESİ
-- Power BI için Hazır View'ler (SON HAL)
-- =====================================================

-- 0️⃣ Önce bağımlı view'leri siliyoruz (varsa)
DROP VIEW IF EXISTS vw_order_summary;
DROP VIEW IF EXISTS vw_sales_fact;

-- =====================================================
-- 1️⃣ Siparişler View (Order Seviyesi)
-- =====================================================
CREATE OR REPLACE VIEW vw_orders AS
SELECT
    order_id,
    customer_id,
    DATE(order_date) AS order_date,
    order_status,
    shipping_company
FROM orders;

-- =====================================================
-- 2️⃣ Satış Fact View (Ürün + Satış + Maliyet)
-- =====================================================
CREATE VIEW vw_sales_fact AS
SELECT
    o.order_id,
    DATE(o.order_date) AS order_date,
    o.order_status,
    o.customer_id,
    oi.product_id,
    p.category_id,
    oi.quantity,
    oi.unit_price,
    p.cost_price,
    oi.discount,
    (oi.quantity * oi.unit_price) * (1 - oi.discount / 100.0) AS net_sales,
    (oi.quantity * p.cost_price) AS total_cost
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

-- =====================================================
-- 3️⃣ Sepet Özeti View (Order Summary)
-- =====================================================
CREATE OR REPLACE VIEW vw_order_summary AS
SELECT
    order_id,
    COUNT(product_id) AS product_count,
    SUM(net_sales) AS order_total
FROM vw_sales_fact
GROUP BY order_id;

-- =====================================================
-- 4️⃣ Kontrol Sorguları
-- =====================================================
SELECT COUNT(*) FROM vw_sales_fact;
SELECT * FROM vw_sales_fact LIMIT 5;
SELECT * FROM vw_order_summary LIMIT 5;
so