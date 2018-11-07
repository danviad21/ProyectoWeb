#DROP PROCEDURE todasTab;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todasTab`()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE param1 varchar(50);
    DECLARE param2 varchar(50);
	DECLARE c1 CURSOR FOR
		SELECT tab.TABLE_NAME, tab1.n_tab
		FROM information_schema.TABLES tab left join Asig_PK tab1
			on (tab.table_name=tab1.n_tab)
		WHERE upper(tab.TABLE_SCHEMA) LIKE 'INVENTARIO' AND upper(tab.TABLE_NAME) NOT LIKE UPPER('Asig_PK');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	OPEN c1;

	read_loop: LOOP
		FETCH c1 INTO param1, param2;
		
        IF done THEN
			LEAVE read_loop;
		END IF;
	
		IF param2 is null then
			insert into Asig_PK values(param1,0);
		END IF;
	END LOOP;

	CLOSE c1;
END
$$