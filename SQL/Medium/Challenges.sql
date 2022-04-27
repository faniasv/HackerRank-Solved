/*selecting the required columns*/
SELECT h.hacker_id,h.name,p.challenge_count FROM hackers h 
/*performing join via sub-query for one time counting, improving query speed*/
INNER JOIN
    (SELECT hacker_id,COUNT(*) AS challenge_count FROM challenges GROUP BY 1) AS p
/*join condition*/
    ON h.hacker_id=p.hacker_id
/*condition to exclude the same number of count which is less than maximum count*/
WHERE p.challenge_count NOT IN(
/*1st get the list of counted hacker_ids*/
    SELECT t.tot FROM (SELECT COUNT(*) AS tot FROM challenges GROUP BY hacker_id) AS t
/*give condition where count should not be maximum count to exclude maximum number of challenges created by a student*/
        WHERE t.tot != (SELECT MAX(t.tot) FROM (SELECT COUNT(*) AS tot FROM challenges GROUP BY hacker_id) AS t)
    GROUP BY t.tot 
/*finally give the condition where more than one student has created equal number of challenges*/
    HAVING COUNT(t.tot)>1
)
/*sort the result according to given condition in the problem*/
ORDER BY 3 DESC,1;
