-- https: True ->
update 'data' set 'https' = 1 where https ='True';
update 'data' set 'https' = 0 where https ='False';

alter table data
modify column HTTPS boolean;

-- 