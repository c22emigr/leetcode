SELECT id 
FROM ( 
    SELECT
        id,
        temperature,
        recordDate,
        LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate) OVER (ORDER BY recordDate) as prev_date 
FROM Weather
) w
WHERE recordDate = DATE_ADD(prev_date, INTERVAL 1 DAY) AND temperature > prev_temp;