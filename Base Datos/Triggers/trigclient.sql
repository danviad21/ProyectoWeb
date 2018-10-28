
DELIMITER $$
CREATE TRIGGER cliente BEFORE INSERT ON Cliente for each row
begin
	DECLARE var INT;
	DECLARE var1 varchar (50);
    
	SELECT Inventario.AsigPK('Cliente') into var;
    
    SET NEW.id_cliente = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE UPPER(n_tab) LIKE UPPER('CLIENTE');
end
$$