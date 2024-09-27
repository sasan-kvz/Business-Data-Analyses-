select a.user_id,
       u.name as user_name,
       a.created_at,
       u.is_admin,
       u.is_merchant,
       a.is_error,
       a.is_bank_job,
       a.is_credit,
       a.price_total,
       --c.current_credit as current_credit,  add other columns
       --t.name as charges_type,
        --pac.name as package_name
from kx_orders a
         --join kx_users_cards uc on uc.user_id = u.id ... in ghalate be nazaram. felan vali niazi nis behesh
        join kx_users u on a.user_id = u.id
        --join kx_users_charges c on c.user_id = u.id
        --join kx_users_charges_types t on t.id = c.users_charges_type_id
--         join kx_transactions tr on tr.id = c.transaction_id
--         join kx_users_charges_packages pac on pac.id=tr.users_charges_package_id
where (a.is_error = 0)
  and ((u.is_admin = 0) and (u.is_merchant = 0)) and (a.created_at >'2024-06-25 00:00:00.000000')