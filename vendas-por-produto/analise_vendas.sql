-- Projeto: Análise de Vendas por Produto
-- Dataset: bigquery-public-data.thelook_ecommerce

SELECT
  FORMAT_DATE('%Y-%m', created_at) AS mes,
  product_name,
  SUM(sale_price) AS faturamento
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY mes, product_name
ORDER BY mes, faturamento DESC;
