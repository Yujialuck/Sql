/*175*/
SELECT P.FisrtName, P.LastName, A.City, A.State
FROM Person P LEFT JOIN Address A
ON P.PersonId = A.PersonId

/*176*/
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary)
				FROM Employee)
				
/*181*/
SELECT T1.Name AS Employee
FROM Empoyee T1 INNER JOIN Employee T2
ON T1.ManagerId = T2.Id
WHERE T1.Salary < T2.Salary

/*182*/
SELECT Email
FROM Person
WHERE COUNT(Email) >1
GROUP BY Email

/*183*/
SELECT C.Name AS Customers
FROM Customers C LEFT JOIN Orders O
ON C.Id = O.CustomerId
WHERE O.Id IS NULL

/* SELECT C.Name AS Customers
FROM Customers C
WHERE C.Id NOT IN (SELECT CustomerId
                   FROM Orders) */
				   

/*196 DELETE DUPLICATE*/

/*DELETE  gc
FROM    guide_category AS gc 
LEFT JOIN
        guide AS g 
ON      g.id_guide = gc.id_guide
WHERE   g.title IS NULL */
/*用 left join 更好*/

/*DELETE  
FROM    guide_category AS gc 
WHERE   id_guide NOT IN
        (
        SELECT  id_guide
        FROM    guide
        ) */
		
DELETE P1
FROM Person P1 RIGHT JOIN Person P2
ON P1.Email = P2.Email
WHERE P1.Id > P2.Id


/*197 W2.DATE = DATE_ADD(W1.DATE, INTERVAL 1 DAY)
      W2.DATE = W1.DATE + INTERVAL 1 DAY
	  TO_DAYS(W2.DATE) - TO_DAYS(W1.DATE) = 1*/
SELECT W2.Id
FROM Weather W1 JOIN Weather W2
ON TO_DAYS(W2.RecordDate)- TO_DAYS(W1.RecordDate) = 1
WHERE W1.Temperature < W2.Temperature

SELECT W2.Id
FROM Weather W1, Weather W2
WHERE TO_DAYS(W2.RecordDate) - TO_DAYS(W1.RecordDate) = 1
AND W1.Temperature < W2.Temperature


/*595 WHERE CANNOT BE USED IN AGGREAGATE FUNCTIONS
							(AVG, COUNT, MIN, MAX,SUM)	
		    BUT IT CAN BE USED WITH AND, OR, NOT OPERATORS*/
SELECT name, population, area
FROM World
HAVING area > 3000000 OR population > 25000000

/* SELECT name, population, area
FROM World
WHERE area > 3000000 OR population > 25000000 */

/*596*/
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) > 4


/*620 <>*/
SELECT * 
FROM cinema
WHERE id%2 <> 0 AND description <> 'boring'
ORDER BY rating DESC


/*627*/
UPDATE salary
SET sex = 
	(CASE WHEN sex = 'f' THEN 'm'
	      ELSE 'f'
		  END
	)






































FROM Person P1 LEFT JOIN Person P2
ON P1.Email=P2.Email AND P1.Id > P2.Id
WHERE P2.Email IS NOT NULL
				   
  delete films f
  where  insert_date not in (
    select min(insert_date)
    from   films s
    where  f.title = s.title
    and    f.uk_release_date = s.uk_release_date
  ) 