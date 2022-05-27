1) <a href='https://leetcode.com/problems/big-countries'> Big Countries </a>
        
        select
                name,
                population,
                area
        from 
                World
                where area >= 3000000 or population >= 25000000 
                
 
2) <a href='https://leetcode.com/problems/recyclable-and-low-fat-products'> Recyclable and Low Fat Products </a>     
        
        select 
                product_id
    
        from
                Products
                where low_fats = 'Y' and recyclable = 'Y'
      
      
3) <a href='https://leetcode.com/problems/find-customer-referee'> Find Customer Referee </a>
        
        select 
                name
        from
                Customer
                where referee_id <> 2 or referee_id is null
                
                
4) <a href='https://leetcode.com/problems/customers-who-never-order'> Customers Who Never Order </a>                
        
        select
                C.name as Customers
        from
                Customers C full outer join Orders O
                on C.id = O.customerId  
                where O.customerId is null
                
                
5) <a href='https://leetcode.com/problems/calculate-special-bonus'> Calculate Special Bonus </a> 
        
        select 
                employee_id,
                iif(employee_id % 2 <> 0 and name not like 'M%' , salary , 0) as bonus
        from 
                Employees
                order by employee_id


6) <a href='https://leetcode.com/problems/swap-salary'> Swap Salary </a>
               
        update 
                Salary
        set 
                sex = iif(sex='f','m','f')
               

7) <a href='https://leetcode.com/problems/delete-duplicate-emails'> Delete Duplicate Emails </a>
        
        delete 
                P2 
        from 
                Person P1,Person P2
                where P1.email = P2.email and P1.id < P2.id