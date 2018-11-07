DELIMITER $$
CREATE TRIGGER trg_emp BEFORE INSERT ON Empresa for each row
begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Empresa') into var;    
    SET var = var+1;
    SET NEW.id_empresa = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Empresa';
end
$$