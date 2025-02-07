-- Question 1: Number of Comments Per User in 30 days before 2020-02-10
-- Return the total number of comments received for each user in the 30 or less days before 2020-02-10.
---Don't output users who haven't received any comment in the defined time period.
DROP TABLE  IF EXISTS fb_comments_count ;

CREATE TABLE fb_comments_count (
    user_id INT,
    created_at DATE,
    number_of_comments INT
);

INSERT INTO fb_comments_count (user_id, created_at, number_of_comments) VALUES
(18, '2019-12-29', 1),
(25, '2019-12-21', 1),
(78, '2020-01-04', 1),
(37, '2020-02-01', 1),
(41, '2019-12-23', 1);


/*Step 1: Clarifying the Problem Statement

Before writing the query, it is essential to ask clarifying questions to ensure a complete understanding of the requirements.

1️⃣ Valid Questions to Ask the Interviewer
Understanding Input Data:
What is the structure of the fb_comments_count table?
What are the possible value ranges for user_id and number_of_comments?
Are there cases where number_of_comments could be negative or NULL?

Understanding the Time Period:
Should we consider the 30 days before February 10, 2020, including or excluding February 10 itself?


Expected Output Format:
Should we sort the results in any specific order, such as descending by total comments?

Edge Cases to Consider:
What if a user has multiple comments on the same day?
What if a user hasn't commented at all within the last 30 days?


Step 2: Understanding Inputs and Outputs

🟢 Input: fb_comments_count Table
user_id: Unique identifier for each user.
created_at: Date when the comment was made.
number_of_comments: Number of comments made by the user on that date.


🔵 Expected Output:
List of users who received at least one comment in the 30 days before February 10, 2020.
The total number of comments per user in this period.
Users with 0 comments should not be included.


Step 3: Breaking Down the Solution Approach

Filter Data for the 30-day Window
Use WHERE created_at BETWEEN '2020-02-10'::date - INTERVAL '30 days' AND '2020-02-10'::date to restrict the date range.
Group Data by User ID
Use GROUP BY user_id to sum up total comments per user.
Exclude Users with 0 Comments
Use HAVING SUM(number_of_comments) > 0 to filter out users who had no comments in this period.


*/

-- Step 4: Writing the SQL Query

SELECT user_id, SUM(number_of_comments) AS total_comments
FROM fb_comments_count
WHERE created_at BETWEEN '2020-02-10'::date - interval '30 days' AND '2020-02-10'::date
GROUP BY user_id 
HAVING SUM(number_of_comments) > 0;







