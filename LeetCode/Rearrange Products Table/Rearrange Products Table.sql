	select
                Y.product_id,'store1' as store,Y.store1 as price
        from
                Products X , Products Y
                where  Y.store1 is not null
        union
        select
                Y.product_id,'store2' as store,Y.store2 as price
        from
                Products X , Products Y
                where  Y.store2 is not null
        union
        select
                Y.product_id,'store3' as store,Y.store3 as price
        from
                Products X , Products Y
                where Y.store3 is not null
