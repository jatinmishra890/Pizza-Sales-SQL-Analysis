-- Question 1
 -- Retrieve the total number of orders placed.

select * from orders;
select count(order_id) from orders;

-- Question 2
-- Calculate the total revenue generated from pizza sales.

select * from pizzas;
select * from order_details;
select round(sum(order_details.quantity*pizzas.price),2) as Total_Revanue from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id;

-- Question 3
-- Identify the highest-priced pizza.

select pizza_types.name, pizzas.price from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id order by pizzas.price desc limit 1;

-- Question 4
-- Identify the most common pizza size ordered.

select pizzas.size,count(order_details.order_details_id)
from pizzas join order_details on pizzas.pizza_id=order_details.pizza_id 
group by pizzas.size order by count(order_details.order_details_id) desc limit 1;

-- Question 5
-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name,sum(order_details.quantity) 
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name order by sum(order_details.quantity) desc limit 5;

-- Question 6
-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types.category,sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category order by quantity desc ;

-- Question 7
-- Determine the distribution of orders by hour of the day.

select hour(order_time),count(order_id) from orders group by hour(order_time);

-- Question 8
-- Join relevant tables to find the category-wise distribution of pizzas.

select category , count(name) from pizza_types group by category;

-- Question 9
-- Group the orders by date and calculate the average number of pizzas ordered per day.

select avg(quantity)  from
(select orders.order_date, sum(order_details.quantity) as quantity from orders join order_details on
orders.order_id=order_details.order_id group by orders.order_date) as orders_quantity_bydate;

-- Question 10
-- Determine the top 3 most ordered pizza types based on revenue

select pizza_types.name, sum(pizzas.price*order_details.quantity) as revanue 
from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.name order by revanue desc limit 3;

-- Question 11
-- Calculate the percentage contribution of each pizza type to total revenue.


select pizza_types.category,round(sum(pizzas.price*order_details.quantity)/(select round(sum(pizzas.price*order_details.quantity),2)
from pizzas join order_details on pizzas.pizza_id=order_details.pizza_id)*100,2) as revanue
from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id 
join order_details on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.category order by revanue desc;

-- Question 12
-- Analyze the cumulative revenue generated over time.

select order_date,sum(revanue) over(order by order_date) from
(select orders.order_date ,  sum(pizzas.price*order_details.quantity) as revanue from
orders join order_details on orders.order_id=order_details_id join
pizzas on order_details.pizza_id=pizzas.pizza_id 
group by orders.order_date order by sum(pizzas.price*order_details.quantity) desc) as sales ;

-- Question 13
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revanue from
(select category,name,revanue, rank()over(partition by category order by revanue desc) as ranking  from
(select pizza_types.category as category , pizza_types.name as name , sum(order_details.quantity*pizzas.price) as revanue 
from pizza_types join  pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id
group by category, pizza_types.name) as a) as b where ranking<=3;
