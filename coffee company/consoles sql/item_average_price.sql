select count(a.id)                      as amount,
       max(a.price_total),
       min(a.price_total),
       avg(a.price_total),
       to_char(a.created_at, 'YYYY-MM') as year_month,
       c.name                           as item_name
from kx_orders a
         join kx_orders_rows b on a.id = b.order_id
         join kx_items c on c.id = b.item_id
where a.price_total > 9000
group by to_char(a.created_at, 'YYYY-MM'), c.name