-- MySQL Script generated by MySQL Workbench
-- Tue Oct  8 15:06:34 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`NguoiDung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NguoiDung` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `ten` VARCHAR(100) NULL,
  `soDienThoai` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `diaChi` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idtblNguoiDung221_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`KhachHang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`KhachHang` (
  `NguoiDung_id` INT NOT NULL,
  PRIMARY KEY (`NguoiDung_id`),
  CONSTRAINT `fk_tblKhachHang221_NguoiDung1`
    FOREIGN KEY (`NguoiDung_id`)
    REFERENCES `mydb`.`NguoiDung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NhanVien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NhanVien` (
  `chucVu` INT NOT NULL,
  `NguoiDung_id` INT NOT NULL,
  PRIMARY KEY (`NguoiDung_id`),
  CONSTRAINT `fk_NhanVien_NguoiDung1`
    FOREIGN KEY (`NguoiDung_id`)
    REFERENCES `mydb`.`NguoiDung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NhaCungCap`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NhaCungCap` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(45) NULL,
  `diaChi` VARCHAR(100) NULL,
  `soDienThoai` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `moTa` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idNhaCungCap_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LuotNhapNguyenLieu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LuotNhapNguyenLieu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `thoiGianNhap` TIMESTAMP(6) NULL,
  `daThanhToan` BIT(1) NULL,
  `giaTien` DOUBLE NULL,
  `NhanVien_NguoiDung_id` INT NOT NULL,
  `NhaCungCap_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idLuotNhapNguyenLieu_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_LuotNhapNguyenLieu_NhanVien1_idx` (`NhanVien_NguoiDung_id` ASC) VISIBLE,
  INDEX `fk_LuotNhapNguyenLieu_NhaCungCap1_idx` (`NhaCungCap_id` ASC) VISIBLE,
  CONSTRAINT `fk_LuotNhapNguyenLieu_NhanVien1`
    FOREIGN KEY (`NhanVien_NguoiDung_id`)
    REFERENCES `mydb`.`NhanVien` (`NguoiDung_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LuotNhapNguyenLieu_NhaCungCap1`
    FOREIGN KEY (`NhaCungCap_id`)
    REFERENCES `mydb`.`NhaCungCap` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HoaDonLuotNhapNguyenLieu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HoaDonLuotNhapNguyenLieu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `thoiGianThanhToan` TIMESTAMP(6) NULL,
  `soTien` DOUBLE NULL,
  `NhanVien_NguoiDung_id` INT NOT NULL,
  `LuotNhapNguyenLieu_id` INT NOT NULL,
  PRIMARY KEY (`id`, `LuotNhapNguyenLieu_id`),
  UNIQUE INDEX `idHoaDonLuotNhapNguyenLieu_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_HoaDonLuotNhapNguyenLieu_NhanVien1_idx` (`NhanVien_NguoiDung_id` ASC) VISIBLE,
  INDEX `fk_HoaDonLuotNhapNguyenLieu_LuotNhapNguyenLieu1_idx` (`LuotNhapNguyenLieu_id` ASC) VISIBLE,
  CONSTRAINT `fk_HoaDonLuotNhapNguyenLieu_NhanVien1`
    FOREIGN KEY (`NhanVien_NguoiDung_id`)
    REFERENCES `mydb`.`NhanVien` (`NguoiDung_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HoaDonLuotNhapNguyenLieu_LuotNhapNguyenLieu1`
    FOREIGN KEY (`LuotNhapNguyenLieu_id`)
    REFERENCES `mydb`.`LuotNhapNguyenLieu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NguyenLieu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NguyenLieu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(45) NULL,
  `gia` DOUBLE NULL,
  `moTa` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idNguyenLieu_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DanhSachLuotNhapNguyenLieu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DanhSachLuotNhapNguyenLieu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `soLuong` INT NOT NULL,
  `giaTienMoiSanPham` DOUBLE NOT NULL,
  `NguyenLieu_id` INT NOT NULL,
  `LuotNhapNguyenLieu_id` INT NOT NULL,
  PRIMARY KEY (`id`, `LuotNhapNguyenLieu_id`),
  UNIQUE INDEX `idDanhSachLuotNhapNguyenLieu_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_DanhSachLuotNhapNguyenLieu_NguyenLieu1_idx` (`NguyenLieu_id` ASC) VISIBLE,
  INDEX `fk_DanhSachLuotNhapNguyenLieu_LuotNhapNguyenLieu1_idx` (`LuotNhapNguyenLieu_id` ASC) VISIBLE,
  CONSTRAINT `fk_DanhSachLuotNhapNguyenLieu_NguyenLieu1`
    FOREIGN KEY (`NguyenLieu_id`)
    REFERENCES `mydb`.`NguyenLieu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DanhSachLuotNhapNguyenLieu_LuotNhapNguyenLieu1`
    FOREIGN KEY (`LuotNhapNguyenLieu_id`)
    REFERENCES `mydb`.`LuotNhapNguyenLieu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MonAn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MonAn` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ten` VARCHAR(45) NOT NULL,
  `gia` DOUBLE NOT NULL,
  `moTa` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idMonAn_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `ten_UNIQUE` (`ten` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
