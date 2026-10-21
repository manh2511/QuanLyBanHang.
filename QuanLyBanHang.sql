-- 1. Xóa CSDL nếu đã tồn tại để làm mới hoàn toàn
DROP DATABASE IF EXISTS QuanLyBanHang;

-- 2. Tạo CSDL mới QuanLyBanHang
CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

-- 3. Tạo bảng Customer (Khách hàng)
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50) NOT NULL,
    cAge TINYINT
);

-- 4. Tạo bảng Order (Hóa đơn)
-- Dùng cặp dấu `` quanh tên bảng `Order` để tránh trùng với từ khóa hệ thống (ORDER BY)
CREATE TABLE `Order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- 5. Tạo bảng Product (Sản phẩm)
CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(50) NOT NULL,
    pPrice INT
);

-- 6. Tạo bảng OrderDetail (Chi tiết hóa đơn - Bảng trung gian)
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);