select a.user_id, u.name as user_name ,a.price_buy,a.price_total,a.price_buy,a.pay_at,a.created_at, u.is_admin, u.is_merchant, o.item_id, i.name as item_name,a.is_error
from kx_orders a
join kx_stations s on a.station_id = s.id
join kx_users u on a.user_id = u.id
join kx_orders_rows o on a.id = o.order_id
join kx_items i on o.item_id = i.id
where     (a.is_error = 0 )and (a.price_total > a.price_buy+ 4000) and ((u.is_admin =1)or(u.is_merchant=1))