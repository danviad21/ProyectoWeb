DELIMITER $$
CREATE TRIGGER trg_tip_Mov BEFORE INSERT ON Tipo_Mov for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Tipo_Mov') into var;    
	SET var = var+1;
    SET NEW.id_tipo_mov = var;
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Tipo_Mov';
end
$$