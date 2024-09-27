select a.id, b.name, a.request, a.response, a.created_at, a.responded_at, s.name
from kx_commands_logs a join kx_commands b on a.command_id = b.id
join kx_stations s on a.station_id = s.id
where a.response like '500%'