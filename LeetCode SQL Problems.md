
  

        
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
