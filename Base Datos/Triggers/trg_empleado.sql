DELIMITER $$
CREATE TRIGGER trg_empleado BEFORE INSERT ON Empleado for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Empleado') into var;    
    SET var = var+1;
    SET NEW.id_empleado = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Empleado';
end
$$