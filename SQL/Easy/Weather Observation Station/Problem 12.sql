SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^AEIUO].*[^AEIOU]$';
