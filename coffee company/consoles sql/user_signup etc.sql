select u.id as user_id, u.name as username,uc.card_number_masked,o.created_at, o.station_id, o.price_total
from kx_users u
join kx_users_cards uc on u.id=uc.user_id
join kx_orders o on card_number_masked  = o.card_number
where u.is_merchant!=1 and u.is_admin!=1 and o.is_error=0

select  u.id as user_id, u.name as username,o.id as order_id,o.created_at, o.station_id, o.price_total
from kx_orders o
left join kx_users u on u.id  = o.user_id
where u.is_merchant!=1 and u.is_admin!=1 and o.is_error=0


select u.id as user_id, u.name as username,uc.card_number_masked,u.mobile,u.is_merchant , u.is_admin
from kx_users u
join kx_users_cards uc on u.id=uc.user_id
where u.is_merchant!=1 and u.is_admin!=1


-- user_order
SELECT
    o.id as order_id,
    o.station_id as station_id,
    user_id,
    payment_getway_id,
    price_total,
    o.card_number,
    o.created_at,
    is_merchant,
    is_admin,
    name as username,
    is_reseller,
    --score,
    is_error,
    mobile
FROM
    kx_orders o
LEFT JOIN
    kx_users u
ON
    o.user_id = u.id;
where u.is_merchant = 0
-------------------------
--order_item
select o.id as order_id,
       item_id,
       name as item_name
from kx_orders o
join kx_orders_rows oro on o.id = oro.order_id
join kx_items i on oro.item_id = i.id




SELECT
    o.user_id,
    o.price_total,
    o.station_id,
    o.created_at,
    --u.item_id,
    --u.item_name,
    o.is_error,
    u.username,
    u.card_number_masked,
    u.mobile,
    u.is_merchant AS user_is_merchant,
    u.is_admin AS user_is_admin
FROM
    kx_orders o
LEFT JOIN
    (
        SELECT
            u.id AS user_id,
            u.name AS username,
            uc.card_number_masked,
            u.mobile,
            u.is_merchant,
            u.is_admin
        FROM
            kx_users u
        JOIN
            kx_users_cards uc
        ON
            u.id = uc.user_id
        WHERE
            u.is_merchant != 1
            AND u.is_admin != 1
    ) u
ON
    o.user_id = u.user_id
where o.is_error=0


