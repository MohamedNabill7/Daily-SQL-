<a href='https://leetcode.com/problems/customer-placing-the-largest-number-of-orders'>586. Customer Placing the Largest Number of Orders</a>


	Table: Orders

		+-----------------+----------+
		| Column Name     | Type     |
		+-----------------+----------+
		| order_number    | int      |
		| customer_number | int      |
		+-----------------+----------+
		order_number is the primary key for this table.
		This table contains information about the order ID and the customer ID.

 

Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The query result format is in the following example.

 

	Example 1:

		Input: 
		Orders table:
		+--------------+-----------------+
		| order_number | customer_number |
		+--------------+-----------------+
		| 1            | 1               |
		| 2            | 2               |
		| 3            | 3               |
		| 4            | 3               |
		+--------------+-----------------+
		Output: 
		+-----------------+
		| customer_number |
		+-----------------+
		| 3               |
		+-----------------+
		Explanation: 
		The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
		So the result is customer_number 3.
