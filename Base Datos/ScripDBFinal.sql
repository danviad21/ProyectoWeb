-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inventario` DEFAULT CHARACTER SET utf8 ;
USE `Inventario` ;

-- -----------------------------------------------------
-- Table `Inventario`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Producto` (
  `id_producto` INT NOT NULL,
  `descripcion_prod` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `precio_stock` FLOAT NOT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Tipo_Mov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Tipo_Mov` (
  `id_tipo_mov` INT NOT NULL,
  `descripcion_tipo_mov` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_mov`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Empresa` (
  `id_empresa` INT NOT NULL,
  `razon_social_empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Empleado` (
  `id_empleado` INT NOT NULL,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `Empresa_id_empresa` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_Empleado_Empresa1_idx` (`Empresa_id_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Empresa1`
    FOREIGN KEY (`Empresa_id_empresa`)
    REFERENCES `Inventario`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Rol` (
  `id_rol` INT NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Usuario_Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Usuario_Rol` (
  `id_usuario` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `Empleado_id_empleado` INT NOT NULL,
  `Rol_id_rol` INT NOT NULL,
  INDEX `fk_Usuario_Empleado1_idx` (`Empleado_id_empleado` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_Rol_Rol1_idx` (`Rol_id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Empleado1`
    FOREIGN KEY (`Empleado_id_empleado`)
    REFERENCES `Inventario`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol_Rol1`
    FOREIGN KEY (`Rol_id_rol`)
    REFERENCES `Inventario`.`Rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Movimiento_Inv`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Movimiento_Inv` (
  `id_mov_inv` INT NOT NULL,
  `fecha_mov_inv` DATE NOT NULL,
  `Tipo_Mov_id_tipo_mov` INT NOT NULL,
  `Usuario_Rol_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_mov_inv`),
  INDEX `fk_Movimiento_Inv_Tipo_Mov1_idx` (`Tipo_Mov_id_tipo_mov` ASC) VISIBLE,
  INDEX `fk_Movimiento_Inv_Usuario_Rol1_idx` (`Usuario_Rol_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Inv_Tipo_Mov1`
    FOREIGN KEY (`Tipo_Mov_id_tipo_mov`)
    REFERENCES `Inventario`.`Tipo_Mov` (`id_tipo_mov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_Inv_Usuario_Rol1`
    FOREIGN KEY (`Usuario_Rol_id_usuario`)
    REFERENCES `Inventario`.`Usuario_Rol` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Cliente` (
  `id_cliente` INT NOT NULL,
  `razon_social_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Factura` (
  `id_factura` INT NOT NULL,
  `fecha_factura` DATE NOT NULL,
  `Cliente_id_cliente` INT NOT NULL,
  `Usuario_Rol_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `fk_Factura_Cliente_idx` (`Cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_Factura_Usuario_Rol1_idx` (`Usuario_Rol_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Cliente`
    FOREIGN KEY (`Cliente_id_cliente`)
    REFERENCES `Inventario`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Usuario_Rol1`
    FOREIGN KEY (`Usuario_Rol_id_usuario`)
    REFERENCES `Inventario`.`Usuario_Rol` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Detalle_Factura` (
  `Factura_id_factura` INT NOT NULL,
  `Producto_id_producto` INT NOT NULL,
  `cantidad_prod_venta` INT NOT NULL,
  `precio_prod_venta` FLOAT NOT NULL,
  INDEX `fk_Detalle_Factura_Factura1_idx` (`Factura_id_factura` ASC) VISIBLE,
  INDEX `fk_Detalle_Factura_Producto1_idx` (`Producto_id_producto` ASC) VISIBLE,
  PRIMARY KEY (`Factura_id_factura`, `Producto_id_producto`),
  CONSTRAINT `fk_Detalle_Factura_Factura1`
    FOREIGN KEY (`Factura_id_factura`)
    REFERENCES `Inventario`.`Factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Factura_Producto1`
    FOREIGN KEY (`Producto_id_producto`)
    REFERENCES `Inventario`.`Producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Detalle_Mov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Detalle_Mov` (
  `Movimiento_Inv_id_mov_inv` INT NOT NULL,
  `Producto_id_producto` INT NOT NULL,
  `cantidad_prod_mov` INT NOT NULL,
  `precio_prod_mov` VARCHAR(45) NOT NULL,
  INDEX `fk_Detalle_Mov_Movimiento_Inv1_idx` (`Movimiento_Inv_id_mov_inv` ASC) VISIBLE,
  INDEX `fk_Detalle_Mov_Producto1_idx` (`Producto_id_producto` ASC) VISIBLE,
  PRIMARY KEY (`Movimiento_Inv_id_mov_inv`, `Producto_id_producto`),
  CONSTRAINT `fk_Detalle_Mov_Movimiento_Inv1`
    FOREIGN KEY (`Movimiento_Inv_id_mov_inv`)
    REFERENCES `Inventario`.`Movimiento_Inv` (`id_mov_inv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Mov_Producto1`
    FOREIGN KEY (`Producto_id_producto`)
    REFERENCES `Inventario`.`Producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Proveedor` (
  `id_proveedor` INT NOT NULL,
  `razon_social_prov` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Orden_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Orden_Compra` (
  `id_oc` INT NOT NULL,
  `status_oc` INT NOT NULL,
  `fecha_oc` DATE NOT NULL,
  `Proveedor_id_proveedor` INT NOT NULL,
  `Usuario_Rol_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_oc`),
  INDEX `fk_Orde_Compra_Proveedor1_idx` (`Proveedor_id_proveedor` ASC) VISIBLE,
  INDEX `fk_Orden_Compra_Usuario_Rol1_idx` (`Usuario_Rol_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Orde_Compra_Proveedor1`
    FOREIGN KEY (`Proveedor_id_proveedor`)
    REFERENCES `Inventario`.`Proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_Compra_Usuario_Rol1`
    FOREIGN KEY (`Usuario_Rol_id_usuario`)
    REFERENCES `Inventario`.`Usuario_Rol` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Detalle_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Detalle_Compra` (
  `Orden_Compra_id_oc` INT NOT NULL,
  `Producto_id_producto` INT NOT NULL,
  `cantidad_prod_comp` INT NOT NULL,
  `cantidad_prod_ingresado` INT NOT NULL,
  `precio_prod_comp` INT NOT NULL,
  INDEX `fk_Detalle_Compra_Orden_Compra1_idx` (`Orden_Compra_id_oc` ASC) VISIBLE,
  INDEX `fk_Detalle_Compra_Producto1_idx` (`Producto_id_producto` ASC) VISIBLE,
  PRIMARY KEY (`Orden_Compra_id_oc`, `Producto_id_producto`),
  CONSTRAINT `fk_Detalle_Compra_Orden_Compra1`
    FOREIGN KEY (`Orden_Compra_id_oc`)
    REFERENCES `Inventario`.`Orden_Compra` (`id_oc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Compra_Producto1`
    FOREIGN KEY (`Producto_id_producto`)
    REFERENCES `Inventario`.`Producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`.`Asig_PK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventario`.`Asig_PK` (
  `n_tab` VARCHAR(45) NOT NULL,
  `valor` INT NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
