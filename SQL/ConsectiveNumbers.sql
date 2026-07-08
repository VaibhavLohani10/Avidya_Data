
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


SELECT num as ConsecutiveNumbers FROM(
    select num, LAG(num) OVER (ORDER BY id) AS prev_num,
    LEAD(num) OVER(ORDER BY id) AS next_num
    FROM Logs) t
    WHERE prev_num = num and next_num = num;               )