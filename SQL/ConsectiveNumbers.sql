
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
    WHERE prev_num = num and  next_num = num;




--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | score       | decimal |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
--
--
-- Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
--
-- The scores should be ranked from the highest to the lowest.
-- If there is a tie between two scores, both should have the same ranking.
-- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
-- Return the result table ordered by score in descending order.
--
-- The result format is in the following example.
--
--

SELECT score, DENSE_RANK() OVER (ORDER BY score desc) AS 'rank' FROM Scores order by score DESC;