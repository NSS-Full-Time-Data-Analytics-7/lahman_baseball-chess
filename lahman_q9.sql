-- 4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", 
-- those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". 
-- Determine the number of putouts made by each of these three groups in 2016.

SELECT position, 
	   COUNT(position) AS sum_of_positions_2016, 
	   COUNT(po) AS total_po_2016
FROM (SELECT yearid, pos, po,
	  		CASE WHEN pos = 'OF' THEN 'Outfield'
		 	 	WHEN pos = 'SS' THEN 'Infield'
			 	WHEN pos = '1B' THEN 'Infield'
			 	WHEN pos = '2B' THEN 'Infield'
			 	WHEN pos = '3B' THEN 'Infield'
			 	WHEN pos = 'P' THEN 'Battery'
		  	 	WHEN pos = 'C' THEN 'Battery'
		 	 	END AS position
	  FROM fielding
	  WHERE yearid = '2016') AS positions_po
GROUP BY position;
