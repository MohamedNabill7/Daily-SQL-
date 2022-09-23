with total_tweets
as( 
    select count(tweet_id) as num_tweets, user_id
    from tweets
    where tweet_date between '01/01/2022 00:00:00' and '12/31/2022 00:00:00'
    group by user_id)
    
  
  select num_tweets as tweet_bucket , count(user_id) as users_num
  from total_tweets
  group by num_tweets
