DELIMITER $$
CREATE TRIGGER trg_user BEFORE INSERT ON Usuario_Rol for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Usuario_Rol') into var;    
	SET var = var+1;
    SET NEW.id_usuario = var;
    SET NEW.password = sha2(NEW.password,256);
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Usuario_Rol';
end
$$