SELECT
    a.id,
    b.name AS command_name,
    a.request,
    a.response,
    a.created_at,
    a.responded_at,
    s.name AS station_name
FROM
    kx_commands_logs a
JOIN
    kx_commands b ON a.command_id = b.id
JOIN
    kx_stations s ON a.station_id = s.id
WHERE
    a.response LIKE '500%'

UNION ALL

SELECT
    a_next.id,
    b_next.name AS command_name,
    a_next.request,
    a_next.response,
    a_next.created_at,
    a_next.responded_at,
    s_next.name AS station_name
FROM
    kx_commands_logs a
JOIN
    kx_commands b ON a.command_id = b.id
JOIN
    kx_stations s ON a.station_id = s.id
JOIN
    kx_commands_logs a_next ON a_next.id = (
        SELECT MIN(id)
        FROM kx_commands_logs
        WHERE id > a.id
          AND response LIKE '200%'
    )
JOIN
    kx_commands b_next ON a_next.command_id = b_next.id
JOIN
    kx_stations s_next ON a_next.station_id = s_next.id
WHERE
    a.response LIKE '500%'
ORDER BY
    a.id;
