-- extract ingridient id
 -- select (string_to_array(explode, ','))[1] from kx_commands_logs, string_to_table(request, ':') explode where command_id = 21 and explode != 'canister'
-- add it to command logs
ALTER TABLE kx_commands_logs
ADD COLUMN new_column text;
UPDATE kx_commands_logs
SET new_column = subquery.result
FROM (
    SELECT id, (string_to_array(explode, ','))[1] as result
    FROM kx_commands_logs, string_to_table(request, ':') explode
    WHERE command_id = 21 AND explode != 'canister'
) subquery
WHERE kx_commands_logs.id = subquery.id;
