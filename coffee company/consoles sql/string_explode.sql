WITH generated_column AS (
    SELECT id, (string_to_array(explode, ','))[1] AS generated_column
    FROM kx_commands_logs,
         LATERAL string_to_table(request, ':') explode
    WHERE command_id = 21 AND explode != 'canister'
)
SELECT *
FROM generated_column
JOIN kx_ingredients_prices ON generated_column.generated_column = kx_ingredients_prices.ingredient_id;

select (string_to_array(explode, ','))[1] from kx_commands_logs, string_to_table(request, ':') explode where command_id = 21 and explode != 'canister'
