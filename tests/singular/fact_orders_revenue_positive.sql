SELECT
    order_id
FROM
    {{ref('fct_orders')}}
WHERE
    revenue<0