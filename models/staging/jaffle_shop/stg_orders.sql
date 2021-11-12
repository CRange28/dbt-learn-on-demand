select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from DBT_FUNDAMENTALS_CR.jaffle_shop.orders