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


8) <a href='https://leetcode.com/problems/fix-names-in-a-table'> Fix Names in a Table </a>
        
        select 
                user_id , concat(upper(substring(name,1,1)),lower(substring(name,2,len(name)-1))) as name
        from
                Users
                order by user_id

9) <a href='https://leetcode.com/problems/group-sold-products-by-the-date'> Group Sold Products By The Date </a>
        
        with no_duplicate_activities
        as
        (
         select
                sell_date  , product
        from
                Activities
                group by sell_date, product
        )
        select 
                sell_date , count(distinct(product)) as num_sold , string_agg(product,',') WITHIN GROUP (ORDER BY product ASC) as products
        from 
                no_duplicate_activities 
                group by sell_date
                

10) <a href='https://leetcode.com/problems/patients-with-a-condition'> Patients With a Condition </a>
        
        select 
                * 
        from 
                Patients
                where conditions like 'DIAB1%' or conditions like '% DIAB1%'

11) <a href='https://leetcode.com/problems/rearrange-products-table'> Rearrange Products Table </a>

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
                
12) <a href='https://leetcode.com/problems/tree-node'> Tree Node </a>                

        select 
                id ,
                case
                        when p_id is null then 'Root'
                        when (id not in (select distinct(p_id) from tree where p_id is not null)) then 'Leaf'
                        else 'Inner'
                end as type
        from
                Tree 
                order by id


13) <a href='https://leetcode.com/problems/second-highest-salary'> Second Highest Salary </a> 

        select 
                case
                        when count(id) = 1  then null 
                        else (select max(salary) from Employee where salary < (select max(salary) from Employee))
                end as SecondHighestSalary
        from
                Employee


14) <a href='https://leetcode.com/problems/employees-with-missing-information'> Employees With Missing Information </a>  

        select 
                iif(E.employee_id is null,S.employee_id,E.employee_id) as employee_id
        from 
                Employees E full outer join Salaries S
                on E.employee_id = S.employee_id
                where E.employee_id is null or S.employee_id is null
                order by employee_id
                
                
15) <a href='https://leetcode.com/problems/combine-two-tables'> Combine Two Tables </a>

        select
                P.firstName , P.lastName , A.city , A.state    
        from 
                Person P left outer join Address A
                on P.personId = A.personId
        
        
16) <a href='https://leetcode.com/problems/article-views-i'> Article Views I </a>

        select 
                distinct(author_id) as id
        from
                Views 
                where author_id = viewer_id 
                order by id
        
        
17) <a href='https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions'> Customer Who Visited but Did Not Make Any Transactions </a>

        select 
                customer_id , count(visit_id) as count_no_trans
        from
                Visits 
                where visit_id not in (select distinct(visit_id) from Transactions) 
                group by customer_id
                order by count_no_trans desc
        

18) <a href='https://leetcode.com/problems/sales-person'> Sales Person </a>

        select 
                name
        from 
                SalesPerson
                where sales_id not in (
                                        select
                                                O.sales_id 
                                        from
                                                Orders O inner join Company C
                                                on C.com_id = O.com_id
                                                where C.name = 'RED' 
                                       )

        
19) <a href='https://leetcode.com/problems/rising-temperature'> Rising Temperature </a>    

        select
                id
        from (
                select 
                        *, lag(temperature) over(order by recordDate) lag_pivot , lag(recordDate) over(order by recordDate) previousdate
                from 
                        Weather 
              ) w       
        where temperature > lag_pivot and recordDate = DATEADD(day, 1,previousdate)


20) <a href='https://leetcode.com/problems/user-activity-for-the-past-30-days-i'> User Activity for the Past 30 Days I </a>

        select 
                activity_date as day , count(distinct(user_id)) as active_users 
        from 
                Activity 
                where activity_date > '2019-06-27' and activity_date <'2019-07-27'
                group by activity_date
        
        
21) <a href='https://leetcode.com/problems/daily-leads-and-partners'> Daily Leads and Partners </a>

        select 
                date_id , make_name , count(distinct(lead_id)) as unique_leads , count(distinct(partner_id)) as unique_partners
        from
                DailySales 
                group by date_id , make_name

        
22) <a href='https://leetcode.com/problems/find-followers-count'> Find Followers Count </a>

        select
                user_id , count(follower_id) as followers_count
        from
                Followers
                group by user_id
                order by user_id


23) <a href='https://leetcode.com/problems/customer-placing-the-largest-number-of-orders'> Customer Placing the Largest Number of Orders </a>

        select 
                top 1 customer_number
        from 
                Orders
                group by customer_number
                order by count(order_number) desc


24) <a href='https://leetcode.com/problems/game-play-analysis-i'> Game Play Analysis I </a>

        select 
                player_id  , min(event_date) as first_login 
        from 
                Activity
                group by player_id


25) <a href='https://leetcode.com/problems/the-latest-login-in-2020'> The Latest Login in 2020 </a>

        select 
                user_id , max(time_stamp) as last_stamp
        from
                Logins
                where year(time_stamp) = '2020'
                group by user_id


26) <a href='https://leetcode.com/problems/find-total-time-spent-by-each-employee'> Find Total Time Spent by Each Employee </a>

        select 
                event_day as day , emp_id ,sum(out_time-in_time) as total_time
        from
                Employees
                group by event_day , emp_id
