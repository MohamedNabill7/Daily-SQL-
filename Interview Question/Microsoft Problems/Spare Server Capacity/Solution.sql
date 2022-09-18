WITH consume_capacity
AS (
    SELECT
      datacenter_id, SUM(monthly_demand) AS consume_capacity
    FROM 
      forecasted_demand
    GROUP BY 
      datacenter_id
    )
      
      
SELECT 
  D.datacenter_id, (D.monthly_capacity - CC.consume_capacity) AS spare_capacity
FROM 
  datacenters D LEFT JOIN consume_capacity CC ON D.datacenter_id = CC.datacenter_id
ORDER BY D.datacenter_id ASC
