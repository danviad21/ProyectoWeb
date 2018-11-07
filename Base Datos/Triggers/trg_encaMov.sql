##DROP trigger trg_mov;
DELIMITER $$
CREATE TRIGGER trg_mov BEFORE INSERT ON Movimiento_Inv for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Movimiento_Inv') into var;    
	SET var = var+1;
    SET NEW.id_mov_inv = var;
    SET NEW.fecha_mov_inv = date(sysdate());
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Movimiento_Inv';
end
$$