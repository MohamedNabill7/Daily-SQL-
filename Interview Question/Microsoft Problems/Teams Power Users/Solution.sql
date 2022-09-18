select 
  sender_id , count(sender_id) as message_count
from 
  messages
where sent_date between '08/01/2022 00:00:00' and '08/31/2022 00:00:00'
group by sender_id
order by message_count desc
limit 2;
