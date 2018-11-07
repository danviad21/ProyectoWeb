DELIMITER $$
CREATE TRIGGER trg_prod BEFORE INSERT ON Producto for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Producto') into var;    
	SET var = var+1;
    SET NEW.id_producto = var;
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Producto';
end
$$