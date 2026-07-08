
-- # Consecutive Numbers
-- #
-- # Table: Logs
-- #
-- # +-------------+---------+
-- # | Column
-- # Name | Type |
-- # +-------------+---------+
-- # | id | int |
-- # | num | varchar |
-- # +-------------+---------+
-- # id is the primary key for this table.
-- # id is an autoincrement column starting
-- #
-- # Find all numbers that appear at least three times consecutively.
-- # Return the result table in any order.

SELECT DISTINCT as ConsecutiveNums FROM (
    SELECT num, LAG(num) OVER (ORDER BY id DESC) AS prev_num,
    LEAD(num) OVER (ORDER BY id DESC) as next_num FROM Logs) t
    WHERE prev_num = num and  next_num = num;              )