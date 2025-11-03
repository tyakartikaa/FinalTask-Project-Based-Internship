WITH mastertable AS (
  SELECT
    o.Date AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    (o.Quantity * p.Price) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
  FROM
    `penjualan.orders` AS o
  JOIN
    `penjualan.customers` AS c ON o.CustomerID = c.CustomerID
  JOIN
    `penjualan.products` AS p ON o.ProdNumber = p.ProdNumber
  JOIN
    `penjualan.productcategory` AS pc ON p.Category = pc.CategoryID
)

SELECT
  order_date,
  category_name,
  product_name,
  product_price,
  order_qty,
  total_sales,
  cust_email,
  cust_city
FROM
  mastertable
ORDER BY
  order_date ASC;