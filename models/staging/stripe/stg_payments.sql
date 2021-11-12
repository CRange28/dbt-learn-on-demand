select

    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD,
    STATUS,
    AMOUNT /100 as amount,
    created as created_at

from DBT_FUNDAMENTALS_CR.stripe.payment