-- Projeto: Análise de Clientes Ativos e Ticket Médio
-- Dataset: bigquery-public-data.thelook_ecommerce
-- Objetivo: Calcular clientes ativos e ticket médio mensal

SELECT
  FORMAT_DATE('%Y-%m', o.created_at) AS mes,
  COUNT(DISTINCT o.user_id) AS clientes_ativos,
  SUM(oi.sale_price) / COUNT(DISTINCT o.user_id) AS ticket_medio
FROM `bigquery-public-data.thelook_ecommerce.orders` o
JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
  ON o.order_id = oi.order_id
GROUP BY mes
ORDER BY mes;
