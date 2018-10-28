DELIMITER $$
CREATE TRIGGER tgremp BEFORE INSERT ON Empresa for each row
begin
	DECLARE var INT;
	DECLARE var1 varchar(50);

    SET var1='Empresa';    
    
	SELECT Inventario.AsigPK(var1) into var;
    SET NEW.id_empresa = var+1;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE UPPER(n_tab) LIKE UPPER(var1);
end
$$