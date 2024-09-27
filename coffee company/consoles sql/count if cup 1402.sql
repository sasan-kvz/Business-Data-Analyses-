select count(1)                                      as total,
       count(*) FILTER (WHERE '2023-03-21'<created_at and created_at<'2024-03-20')           as year_1402,
       count(*) FILTER (WHERE '2023-03-21'<created_at and created_at<'2023-06-22')           as spring,
       count(*) FILTER (WHERE '2023-06-22'<created_at and created_at<'2023-09-23')  as summer,
       count(*) FILTER (WHERE '2023-09-23'<created_at and created_at<'2023-12-22')            as fall,
       count(*) FILTER (WHERE '2023-12-22'<created_at and created_at<'2024-03-20')  as winter
from kx_orders
where is_error =0