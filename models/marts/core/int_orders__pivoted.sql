{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (
   select * from {{ ref('stg_payments') }}
),

final as (
   select
       order_id,
       {% for paymentmethod in payment_methods -%}

       sum(case when paymentmethod = '{{ paymentmethod }}' then amount else 0 end)
            as {{ paymentmethod }}_amount

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from {{ ref('stg_payments') }}

   group by 1
)

select * from final