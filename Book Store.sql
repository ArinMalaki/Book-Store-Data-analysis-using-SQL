select * from Books;
select * from Customers;
select * from Orders;

--genre wise demand
select Book_ID,Title,Genre from Books
where Genre = 'Fiction';

--find book publish after 1950
select Book_ID,Title,Published_Year from Books
where Published_Year >= '1950'
order by Published_Year asc;

--list customer from canada
select Name,City,Country from Customers
where Country = 'canada';

--order place in nov 2023
select Order_ID,Order_Date from Orders
where Order_Date between '2023-11-01' and '2023-12-01'
order by Order_Date;

--total stock of book available
select sum(Stock) as Total_stocks from Books

--list all genre in book table
select Genre from books
group by Genre;

-- book with lowest stock
select Book_ID,Title,Stock from Books
order by Stock;

--total book sold for each genre
select Genre,count(Book_ID) as total_books from Books
group by Genre
order by total_books;

--average price of book in fanticy genre
select Genre,round(AVG(Price),2) as Avg_Price from Books
where Genre ='Fantasy'
group by Genre;

--list customer who placed atleast 2 order
select name,quantity 
from Customers
join Orders on Orders.Customer_ID = Customers.Customer_ID
where Quantity >=2;

--Most frequently ordered book
select Title,count(Order_ID) as NO_of_Book 
from Books
join Orders on Orders.Book_ID = Books.Book_ID
group by Title
order by NO_of_Book desc;

--total quantity sold by each auther
select books.Author,sum(orders.Quantity) as total_qty 
from Books
join Orders on Books.Book_ID = Orders.Book_ID
group by Author
order by total_qty desc;
