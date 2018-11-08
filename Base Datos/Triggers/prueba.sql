use Inventario;
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE table Empresa;
TRUNCATE table Empleado;
TRUNCATE table Producto;
TRUNCATE table Asig_PK;
TRUNCATE table Usuario_Rol;
TRUNCATE table Tipo_Mov;
TRUNCATE table Rol;
TRUNCATE table Detalle_Mov;
TRUNCATE table Movimiento_Inv;

SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Movimiento_Inv;
SELECT * FROM Detalle_Mov;




use Inventario;
drop trigger trg_emp;
drop trigger trg_empleado;
select * from Empresa;
select * from Empleado;
select * from Producto;
select * from Rol;
select * from Tipo_Mov;
Call todasTab();
select * from Asig_PK;
select * from Usuario_Rol;
select fnc_AsigPK('Producto');
insert into Empresa(razon_social_empresa) value('EMPRESA 1');
insert into Empleado(nombre_empleado,Empresa_id_empresa)values('OSCAR',1);
insert into Producto(descripcion_prod,stock,precio_stock)values('TUERCA 1',0,0.00);
insert into Rol(rol)values('JEFE ADMINISTRATIVO');
insert into Tipo_Mov(descripcion_tipo_mov)values('ENTRADA');
insert into Tipo_Mov(descripcion_tipo_mov)values('SALIDA');
insert into Usuario_Rol(username,password,Empleado_id_empleado,Rol_id_rol)values('danviad21','Odavid1990@1309',1,1);
insert into Movimiento_Inv(Tipo_Mov_id_tipo_mov,Usuario_Rol_id_usuario) values(1,1);
CALL gen_Traslado(2,4,10,.2,1);
update Asig_PK set valor =0 where n_tab like 'Empresa';
update Asig_PK set valor =0 where n_tab like 'Empleado';
update Asig_PK set valor =0 where n_tab like 'Producto';
delete from Empresa where id_empresa=2;
delete from Empleado where id_empleado=0;
delete from Producto where id_producto=0;

UPDATE Inventario.Asig_PK SET valor = 1 WHERE upper(n_tab) like upper('Empresa');
UPDATE Inventario.Asig_PK SET valor = 0 WHERE n_tab like 'Producto';
describe Asig_PK;

ALTER TABLE Detalle_Mov modify precio_prod_mov float(10,5);
select length(password) from Usuario_Rol;
