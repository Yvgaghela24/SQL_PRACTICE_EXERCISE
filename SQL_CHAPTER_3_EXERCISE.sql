/*************************************************************************************************
   Example 1. 
   Write a query to display the current date. Label the column Date.
**************************************************************************************************/
  
Select sysdate "Date" 
  from Dual;

/*************************************************************************************************
   Example 3. 
    For each employee, display the employee ID number, last_name, salary, and salary increased by   
    15%  and expressed as a whole number. Label the column New Salary. Place your SQL statement in a
    text file named.
**************************************************************************************************/

Select Empno, Ename, sal, Round(sal*1.15) "New_SALARY"
  from scott.emp;

/*************************************************************************************************
   Example 4. 
     Modify your query lab3_2.sql to add a column that subtracts the old salary from
     the new salary. Label the column Increase. Save the contents of the file as lab3_4.sql. Run
     the revised query.
**************************************************************************************************/

Select Empno, Ename, sal, Round(sal*1.15) "New_SALARY",(Round(sal*1.15)-sal)"Increase"
  from scott.emp;

/*************************************************************************************************
   Example 5. 
     Write a query that displays the employee’s last names with the first letter capitalized and 
     all other letters lowercase and the length of the names, for all employees whose name starts 
     with J, A, or M. Give each column an appropriate label. Sort the results by the employees’ 
     last names.
**************************************************************************************************/  

Select INITCAP(Ename),length(Ename)
 from  Scott.emp
 where Ename like 'J%' OR Ename Like 'A%' OR Ename like'M%'
 Order by ename;
 
 /*************************************************************************************************
   Example 6. 
    For each employee, display the employee’s last name, and calculate the number of months between
    today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results
    by the number of months employed. Round the number of months up to the closest whole number.
**************************************************************************************************/  

Select Ename, Hiredate, Round(Months_between (sysdate , Hiredate)) MONTHS_WORKED
  from scott.emp;
  
  /************************************************************************************************* 
    Example 7
    Write a query that produces the following for each employee: <employee last name> earns <salary> 
    monthly but wants <3 times salary>. Label the column Dream Salaries.
**************************************************************************************************/  

Select CONCAT(CONCAT(CONCAT(Concat(CONCAT(CONCAT( Ename ,' earns'),'  '), sal),' monthly but wants'),'  '), 3*SAL)
  from Scott.emp;
  
/************************************************************************************************* 
   Example 8 
   Create a query to display the last name and salary for all employees. Format the salary to be 15
**************************************************************************************************/

Select Ename, LPAD(sal,15,'$')
  from scott.emp;
  

/*************************************************************************************************
   Example 9. 
   Display each employee’s last name, hire date, and salary review date, which is the first Monday 
   after six months of service. Label the column REVIEW. Format the dates to appear similar to 
   “Monday, the Thirty-First of July, 2000.”
**************************************************************************************************/

Select Ename,Hiredate, 
       TO_CHAR(Next_Day( Hiredate,'Monday'), '"Monday, the" fmDdspth "of" Month, YYYY ') REVIEW
  from scott.emp;

/*************************************************************************************************
   Example 10. 
   Display the last name, hire date, and day of the week on which the employee started. Label
   the column DAY. Order the results by the day of the week starting with Monday.
**************************************************************************************************/

Select Ename, Hiredate, TO_CHAR(hiredate, 'DAY') as "DAY"
  from scott.emp
  order by "DAY";
  
/*************************************************************************************************
   Example 11. 
   Create a query that displays the employees’ last names and commission amounts. If an employee
   does not earn commission, put “No Commission.” Label the column COMM.
**************************************************************************************************/


 /*************************************************************************************************
   Example 12. 
   Create a query that displays the employees’ last names and indicates the amounts of their annual
   salaries with asterisks. Each asterisk signifies a thousand doll ars. Sort the data in descending
   order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.
**************************************************************************************************/

Select CONCAT(CONCAT(Ename,' '),rpad(Sal/1000,15,'*')) EMPLOYEES_AND_THEIR_SALARIES
  from scott.emp;

 /*************************************************************************************************
   Example 13. 
   Using the DECODE function, write a query that displays the grade of all employees based on the value
   of the column JOB_ID, as per the following data:
   
**************************************************************************************************/
 Select ENAME,JOB, 
        DECODE(JOB,'MANAGER', 'B',
                    'ANALYST','C',
                    'PRESIDENT','A',
                    'CLERK','D',
                    'SALESMAN','E') as GRADE
 from scott.emp;

 /*************************************************************************************************
   Example 14. 
   Rewrite the statement in the preceding question using the CASE syntax.
**************************************************************************************************/


 Select ENAME,JOB, 
        CASE JOB  WHEN 'MANAGER' THEN 'B'
                  WHEN 'ANALYST' THEN 'C'
                  WHEN 'PRESIDENT'THEN 'A'
                  WHEN 'CLERK'THEN 'D'
                  ELSE 'E' 
        END as GRADE 
 from scott.emp;