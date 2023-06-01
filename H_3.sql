USE seminar3;
create table SALESPEOPLE(
snum int,
sname varchar(45),
city varchar(45),
comm float );
insert into SALESPEOPLE (snum, sname, city, comm)
values (1001 , 'Peel', 'London', .12 ),
(1002, 'Serres', 'San Jose', .13),
(1004, 'Motika', 'London', .11),
(1007, 'Rifkin', 'Barcelona', .15),
(1003, 'Axelrod', 'New York', .10);

create table sCUSTOMERS(
cnum int,
cname varchar(45),
city varchar(45),
rating int,
snum int );
insert into sCUSTOMERS (cnum, cname, city, rating, snum)
values (2001 , 'Hoffman', 'London', 100, 1001 ),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira ', 'Rome', 100, 1004);

create table ORDERS(
onum int,
amt float,
odate date,
cnum int,
snum int );
insert into ORDERS (onum, amt, odate, cnum, snum)
values (3001 , 18.69, '1990-03-10', 2008, 1007 ),
(3003, 769.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008,4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
      -- city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
select city, sname, snum, comm from SALESPEOPLE;
-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), 
	-- сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating 
FROM sCUSTOMERS
WHERE city = 'SanJose';
-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
	-- без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
Select distinct snum
from ORDERS;
-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
    -- Используется оператор "LIKE": (“заказчики”) 
SELECT * FROM sCUSTOMERS WHERE cname LIKE 'G%';
-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
--  (“Заказы”, “amt”  - сумма)
 select * from ORDERS where amt>1000;
-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 -- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
 select min(amt) from ORDERS;
-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
-- у которых рейтинг больше 100 и они находятся не в Риме.
select * 
from sCUSTOMERS
WHERE rating>100 and city != 'Rome';

create table emploueee (id int, name varchar(100), surname varchar(100), spesialty varchar(100), seniority int, salary  int, age int);
insert emploueee ( id, name, surname, spesialty, seniority, salary, age)
values(1, 'Вася', 'Васькин', 'Начальник', 40, 100000, 60),
(2, 'Петя', 'Петькин', 'Начальник', 8, 70000, 30),
(3, 'Катя', 'Катькина', 'Инженер', 2, 70000, 25),
(4, 'Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
(5, 'Иван', 'Иванов', 'рабочий', 40, 30000, 59),
(6, 'Петр', 'Петров', 'рабочий', 20, 25000, 40),
(7, 'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
(8, 'Антон', 'Антонов', 'рабочий', 8, 19000, 28),
(9, 'Юра', 'Юркин', 'рабочий', 5, 15000, 25),
(10, 'Максим', 'Воронин', 'рабочий', 2, 11000, 22),
(11, 'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
(12, 'Люся', 'Люськина', 'уборщик', 10, 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM emploueee order by salary;
SELECT * FROM emploueee order by salary desc;
-- 2. ** Отсортируйте по возрастанию поле “Зарплата” 
-- и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select * from (select * 
from emploueee 
order by salary desc 
limit 5) as qeqe
order by qeqe.salary;
-- 3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
select spesialty, sum(salary) sum_salary from emploueee group by spesialty having sum_salary>=100000;
