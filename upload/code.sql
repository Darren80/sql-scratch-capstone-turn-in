-- Question response rates

 SELECT survey.question,
  COUNT(DISTINCT survey.user_id) AS 'Responses'
 FROM survey
 GROUP BY 1
 ORDER BY 1;

--  Conversion between ad campaigns
 
 SELECT
 	COUNT(CASE
 		WHEN purchase.user_id IS NOT NULL THEN 'True'
 	END) AS 'Number of Purchases',
  home_try_on.number_of_pairs
 FROM quiz
 LEFT JOIN home_try_on ON
 	quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase ON
 	quiz.user_id = purchase.user_id
 WHERE number_of_pairs IS NOT NULL
 GROUP BY 2
 ORDER BY 1 DESC;

--  Overall conversion rate

 SELECT
 	COUNT(quiz.user_id) AS 'Users quizzed',
  COUNT(home_try_on.user_id) AS 'Users that tried on at home',
 	COUNT(CASE
 		WHEN purchase.user_id IS NOT NULL THEN 'True'
 	END) AS 'Users who purchased'
 FROM quiz
 LEFT JOIN home_try_on ON
 	quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase ON
 	quiz.user_id = purchase.user_id;

-- Colour preference of men and women

 SELECT
 quiz.color,
	COUNT(CASE
  	WHEN quiz.style = "Men's Styles" THEN quiz.user_id
   END) AS 'Men',
  COUNT(CASE
  	WHEN quiz.style = "Women's Styles" THEN quiz.user_id
   END) AS 'Women'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC;

 -- Most popular responses

SELECT quiz.style,
	COUNT(DISTINCT CASE
        WHEN quiz.style IS NOT NULL THEN user_id
    END) AS 'Response Count'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC;
 
 SELECT quiz.fit,
	COUNT(DISTINCT CASE
        WHEN quiz.fit IS NOT NULL THEN user_id
    END) AS 'Response Count'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC;
 
 SELECT quiz.shape,
	COUNT(DISTINCT CASE
        WHEN quiz.shape IS NOT NULL THEN user_id
    END) AS 'Response Count'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC;
 
 SELECT quiz.color,
	COUNT(DISTINCT CASE
        WHEN quiz.color IS NOT NULL THEN user_id
    END) AS 'Response Count'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC;

 -- Sort by amount sold

 SELECT purchase.product_id,
  COUNT(purchase.product_id) AS 'Amount Sold',
  purchase.model_name
 FROM purchase
 GROUP BY 1
 ORDER BY 2 DESC;