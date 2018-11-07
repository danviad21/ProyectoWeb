#drop procedure gen_Traslado;
DELIMITER $$
CREATE  PROCEDURE gen_Traslado(key1 integer,key2 integer,cant integer,precio float,tipMov integer)
BEGIN
	DECLARE var varchar(50);
    
    SELECT descripcion_tipo_mov into var FROM Tipo_Mov WHERE id_tipo_mov = tipMov; 
	
    if cant >0 then
		if upper(var) like 'SALIDA' then
			SET cant = cant * -1;
			SET precio = precio * -1;
		end if;
    
		insert into Detalle_Mov values(key1,key2,cant,precio);
		update Producto set stock = stock + cant, precio_stock = precio/cant + precio_stock
        WHERE id_producto = key2;
	end if;
END
$$