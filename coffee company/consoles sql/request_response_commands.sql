    select a.request, a.response, a.created_at, s.name as station_njame , a.created_at, a.order_id
from kx_commands_logs a
join kx_stations s on a.station_id = s.id
where   s.reseller_id =1  and a.order_id >0