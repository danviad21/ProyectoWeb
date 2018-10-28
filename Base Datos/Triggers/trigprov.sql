DELIMITER $$
CREATE TRIGGER tgrproveedor BEFORE INSERT ON Proveedor for each row
begin
	DECLARE var INT;
	DECLARE var1 varchar(50);

    SET var1='Proveedor';    
    
	SELECT Inventario.AsigPK(var1) into var;
    SET NEW.id_proveedor = var+1;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE UPPER(n_tab) LIKE UPPER(var1);
end
$$