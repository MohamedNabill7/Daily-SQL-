
        
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
