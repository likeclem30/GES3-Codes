create database willy;


DELETE FROM member  
WHERE id IN (SELECT * 
             FROM (SELECT id FROM member 
                   GROUP BY member_id, quiz_num, question_num, answer_num HAVING (COUNT(*) > 1)
                  ) AS A
            );