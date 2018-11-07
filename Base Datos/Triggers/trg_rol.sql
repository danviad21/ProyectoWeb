DELIMITER $$
CREATE TRIGGER trg_rol BEFORE INSERT ON Rol for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Rol') into var;    
    SET var = var+1;
    SET NEW.id_rol = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Rol';
end
$$