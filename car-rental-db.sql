/*
 Navicat Premium Dump SQL

 Source Server         : marti
 Source Server Type    : MariaDB
 Source Server Version : 110601 (11.6.1-MariaDB)
 Source Host           : db.it.pk.edu.pl:3306
 Source Schema         : projekt_dylag_herczyk_huza

 Target Server Type    : MariaDB
 Target Server Version : 110601 (11.6.1-MariaDB)
 File Encoding         : 65001

 Date: 02/01/2025 12:40:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for amenity
-- ----------------------------
DROP TABLE IF EXISTS `amenity`;
CREATE TABLE `amenity`  (
  `AmenityID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `AmenityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `AmenityPrice` decimal(7, 2) NOT NULL DEFAULT 0.00,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AmenityID`) USING BTREE,
  UNIQUE INDEX `AmenityName`(`AmenityName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amenity
-- ----------------------------
INSERT INTO `amenity` VALUES (1, 'fotelik dziecięcy', 10.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `amenity` VALUES (2, 'przyczepa mała', 35.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `amenity` VALUES (3, 'przyczepa duża', 50.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `amenity` VALUES (4, 'uchwyt na rowery', 15.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');

-- ----------------------------
-- Table structure for amenity_audit
-- ----------------------------
DROP TABLE IF EXISTS `amenity_audit`;
CREATE TABLE `amenity_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `AmenityID` int(11) NOT NULL,
  `AmenityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `AmenityPrice` decimal(7, 2) NULL DEFAULT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amenity_audit
-- ----------------------------

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `CarID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LicensePlateNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `VIN` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `MakeID` smallint(5) UNSIGNED NOT NULL,
  `Model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Year` smallint(4) UNSIGNED NOT NULL,
  `Color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Mileage` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `CarStatus` enum('Available','Rented','Under Maintenance','To Be Scrapped') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Available',
  `VehicleTypeID` smallint(5) UNSIGNED NOT NULL,
  `FuelTypeID` tinyint(3) UNSIGNED NOT NULL,
  `OC_DueDate` date NULL DEFAULT NULL,
  `AC_DueDate` date NULL DEFAULT NULL,
  `CanGoAbroad` enum('Tak','Nie') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Tak',
  `DailyRate` decimal(7, 2) NOT NULL DEFAULT 0.00,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CarID`) USING BTREE,
  UNIQUE INDEX `LicensePlateNumber`(`LicensePlateNumber` ASC) USING BTREE,
  UNIQUE INDEX `VIN`(`VIN` ASC) USING BTREE,
  INDEX `FK_Car_VehicleType`(`VehicleTypeID` ASC) USING BTREE,
  INDEX `FK_Car_FuelType`(`FuelTypeID` ASC) USING BTREE,
  INDEX `FK_Car_Make`(`MakeID` ASC) USING BTREE,
  CONSTRAINT `FK_Car_FuelType` FOREIGN KEY (`FuelTypeID`) REFERENCES `fueltype` (`FuelTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Car_Make` FOREIGN KEY (`MakeID`) REFERENCES `make` (`MakeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Car_VehicleType` FOREIGN KEY (`VehicleTypeID`) REFERENCES `vehicletype` (`VehicleTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, 'KRA12345', '1HGCM82633A123456', 0, 'Corolla', 2018, 'Czerwony', 50000, 'Available', 1, 1, '2024-06-15', '2025-06-15', 'Tak', 150.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (2, 'KRK98765', '1HGCM82633A987654', 0, 'Fiesta', 2019, 'Niebieski', 30000, 'Available', 2, 1, '2024-07-20', '2025-07-20', 'Nie', 120.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (3, 'WAW54321', '1HGCM82633A543210', 0, 'X5', 2020, 'Czarny', 20000, 'Under Maintenance', 3, 2, '2024-08-01', '2025-08-01', 'Tak', 300.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (4, 'GD12345', '1HGCM82633A321654', 0, 'A4', 2017, 'Biały', 60000, 'Available', 1, 1, '2024-04-10', '2025-04-10', 'Tak', 180.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (5, 'WRO67890', '1HGCM82633A567890', 0, 'C-Class', 2021, 'Szary', 15000, 'Available', 4, 3, '2024-05-15', '2025-05-15', 'Tak', 250.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (6, 'POZ11111', '1HGCM82633A111111', 0, 'Golf', 2015, 'Zielony', 80000, 'Available', 2, 1, '2024-09-05', '2025-09-05', 'Nie', 100.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (7, 'LOD22222', '1HGCM82633A222222', 0, 'Octavia', 2016, 'Niebieski', 70000, 'Under Maintenance', 2, 1, '2024-02-25', '2025-02-25', 'Tak', 110.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (8, 'GDA33333', '1HGCM82633A333333', 0, 'Civic', 2018, 'Srebrny', 45000, 'Available', 1, 1, '2024-12-10', '2025-12-10', 'Tak', 130.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (9, 'SZC44444', '1HGCM82633A444444', 0, 'i30', 2022, 'Biały', 10000, 'Available', 2, 1, '2024-03-30', '2025-03-30', 'Tak', 160.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (10, 'KAT55555', '1HGCM82633A555555', 0, '208', 2019, 'Żółty', 25000, 'Available', 2, 1, '2024-08-17', '2025-08-17', 'Tak', 140.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (11, 'KRK66666', '1HGCM82633A666666', 0, 'Qashqai', 2021, 'Czerwony', 18000, 'Rented', 3, 2, '2024-11-10', '2025-11-10', 'Tak', 220.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (12, 'WAW77777', '1HGCM82633A777777', 0, 'Sportage', 2020, 'Czarny', 32000, 'Available', 3, 2, '2024-01-15', '2025-01-15', 'Nie', 200.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (13, 'GD88888', '1HGCM82633A888888', 0, 'CX-5', 2018, 'Szary', 55000, 'Under Maintenance', 3, 2, '2024-06-22', '2025-06-22', 'Tak', 190.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (14, 'POZ99999', '1HGCM82633A999999', 0, 'Clio', 2016, 'Niebieski', 72000, 'Available', 2, 1, '2024-10-05', '2025-10-05', 'Tak', 110.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (15, 'LOD10101', '1HGCM82633A101010', 0, 'Yaris', 2021, 'Zielony', 22000, 'Rented', 2, 1, '2024-04-20', '2025-04-20', 'Tak', 140.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (16, 'GDA20202', '1HGCM82633A202020', 0, 'Focus', 2019, 'Srebrny', 39000, 'Available', 2, 1, '2024-07-15', '2025-07-15', 'Tak', 130.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (17, 'SZC30303', '1HGCM82633A303030', 0, 'Astra', 2020, 'Biały', 27000, 'Available', 2, 1, '2024-05-10', '2025-05-10', 'Nie', 125.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (18, 'KAT40404', '1HGCM82633A404040', 0, '3 Series', 2018, 'Żółty', 60000, 'Rented', 4, 2, '2024-06-18', '2025-06-18', 'Tak', 250.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (19, 'KRK50505', '1HGCM82633A505050', 0, 'E-Class', 2022, 'Szary', 14000, 'Available', 4, 3, '2024-12-15', '2025-12-15', 'Nie', 280.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');
INSERT INTO `car` VALUES (20, 'WAW60606', '1HGCM82633A606060', 0, 'Q5', 2017, 'Żółty', 53000, 'Under Maintenance', 3, 2, '2024-08-01', '2025-08-01', 'Tak', 270.00, '2024-12-25 11:47:10', '2024-12-25 11:47:10');

-- ----------------------------
-- Table structure for car_audit
-- ----------------------------
DROP TABLE IF EXISTS `car_audit`;
CREATE TABLE `car_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `LicensePlateNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `VIN` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `MakeID` int(11) NULL DEFAULT NULL,
  `Model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Year` smallint(6) NULL DEFAULT NULL,
  `CarStatus` enum('Available','Rented','Under Maintenance','To Be Scrapped') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `DailyRate` decimal(7, 2) NULL DEFAULT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car_audit
-- ----------------------------

-- ----------------------------
-- Table structure for caramenity
-- ----------------------------
DROP TABLE IF EXISTS `caramenity`;
CREATE TABLE `caramenity`  (
  `CarID` mediumint(8) UNSIGNED NOT NULL,
  `AmenityID` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`CarID`, `AmenityID`) USING BTREE,
  INDEX `FK_CarAmenity_Amenity`(`AmenityID` ASC) USING BTREE,
  CONSTRAINT `FK_CarAmenity_Amenity` FOREIGN KEY (`AmenityID`) REFERENCES `amenity` (`AmenityID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CarAmenity_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of caramenity
-- ----------------------------
INSERT INTO `caramenity` VALUES (1, 1);
INSERT INTO `caramenity` VALUES (2, 1);
INSERT INTO `caramenity` VALUES (7, 1);
INSERT INTO `caramenity` VALUES (8, 1);
INSERT INTO `caramenity` VALUES (11, 1);
INSERT INTO `caramenity` VALUES (1, 2);
INSERT INTO `caramenity` VALUES (2, 2);
INSERT INTO `caramenity` VALUES (7, 2);
INSERT INTO `caramenity` VALUES (8, 2);
INSERT INTO `caramenity` VALUES (11, 2);
INSERT INTO `caramenity` VALUES (3, 3);
INSERT INTO `caramenity` VALUES (5, 3);
INSERT INTO `caramenity` VALUES (11, 3);
INSERT INTO `caramenity` VALUES (12, 3);
INSERT INTO `caramenity` VALUES (1, 4);
INSERT INTO `caramenity` VALUES (2, 4);
INSERT INTO `caramenity` VALUES (4, 4);
INSERT INTO `caramenity` VALUES (7, 4);
INSERT INTO `caramenity` VALUES (8, 4);
INSERT INTO `caramenity` VALUES (11, 4);
INSERT INTO `caramenity` VALUES (12, 4);

-- ----------------------------
-- Table structure for carfeature
-- ----------------------------
DROP TABLE IF EXISTS `carfeature`;
CREATE TABLE `carfeature`  (
  `CarID` mediumint(8) UNSIGNED NOT NULL,
  `FeatureID` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`CarID`, `FeatureID`) USING BTREE,
  INDEX `FeatureID`(`FeatureID` ASC) USING BTREE,
  CONSTRAINT `carfeature_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carfeature_ibfk_2` FOREIGN KEY (`FeatureID`) REFERENCES `feature` (`FeatureID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carfeature
-- ----------------------------
INSERT INTO `carfeature` VALUES (1, 1);
INSERT INTO `carfeature` VALUES (2, 1);
INSERT INTO `carfeature` VALUES (3, 1);
INSERT INTO `carfeature` VALUES (4, 1);
INSERT INTO `carfeature` VALUES (5, 1);
INSERT INTO `carfeature` VALUES (6, 1);
INSERT INTO `carfeature` VALUES (7, 1);
INSERT INTO `carfeature` VALUES (8, 1);
INSERT INTO `carfeature` VALUES (9, 1);
INSERT INTO `carfeature` VALUES (10, 1);
INSERT INTO `carfeature` VALUES (11, 1);
INSERT INTO `carfeature` VALUES (12, 1);
INSERT INTO `carfeature` VALUES (13, 1);
INSERT INTO `carfeature` VALUES (14, 1);
INSERT INTO `carfeature` VALUES (15, 1);
INSERT INTO `carfeature` VALUES (16, 1);
INSERT INTO `carfeature` VALUES (17, 1);
INSERT INTO `carfeature` VALUES (18, 1);
INSERT INTO `carfeature` VALUES (19, 1);
INSERT INTO `carfeature` VALUES (20, 1);
INSERT INTO `carfeature` VALUES (4, 2);
INSERT INTO `carfeature` VALUES (5, 2);
INSERT INTO `carfeature` VALUES (11, 2);
INSERT INTO `carfeature` VALUES (12, 2);
INSERT INTO `carfeature` VALUES (14, 2);
INSERT INTO `carfeature` VALUES (16, 2);
INSERT INTO `carfeature` VALUES (19, 2);
INSERT INTO `carfeature` VALUES (20, 2);
INSERT INTO `carfeature` VALUES (7, 3);
INSERT INTO `carfeature` VALUES (9, 3);
INSERT INTO `carfeature` VALUES (11, 3);
INSERT INTO `carfeature` VALUES (18, 3);
INSERT INTO `carfeature` VALUES (2, 4);
INSERT INTO `carfeature` VALUES (3, 4);
INSERT INTO `carfeature` VALUES (11, 4);
INSERT INTO `carfeature` VALUES (12, 4);
INSERT INTO `carfeature` VALUES (17, 4);
INSERT INTO `carfeature` VALUES (19, 4);
INSERT INTO `carfeature` VALUES (20, 4);
INSERT INTO `carfeature` VALUES (2, 5);
INSERT INTO `carfeature` VALUES (5, 5);
INSERT INTO `carfeature` VALUES (13, 5);
INSERT INTO `carfeature` VALUES (15, 5);
INSERT INTO `carfeature` VALUES (20, 5);
INSERT INTO `carfeature` VALUES (5, 6);
INSERT INTO `carfeature` VALUES (7, 6);
INSERT INTO `carfeature` VALUES (10, 6);
INSERT INTO `carfeature` VALUES (14, 6);
INSERT INTO `carfeature` VALUES (16, 6);
INSERT INTO `carfeature` VALUES (1, 7);
INSERT INTO `carfeature` VALUES (16, 7);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CustomerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `LastName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `DriverLicenseNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `DriverLicenseIssueDate` date NOT NULL,
  `DriverLicenseExpiryDate` date NOT NULL,
  `Email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`) USING BTREE,
  UNIQUE INDEX `DriverLicenseNumber`(`DriverLicenseNumber` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Jan', 'Kowalski', '1964-04-07', 'SP006152', '2019-03-06', '2028-01-18', 'jan.kowalski@interia.pl', '329482932');
INSERT INTO `customer` VALUES (2, 'Rico', 'Lemański', '1996-10-25', 'ESON4BF', '2022-12-12', '2037-12-12', 'd.lemanska@example.com', '731713841');
INSERT INTO `customer` VALUES (3, 'Celina', 'Skipper', '1967-08-12', 'DXKO12G', '2010-04-19', '2025-08-21', 'celkobier@example.com', '836110093');
INSERT INTO `customer` VALUES (4, 'Oliwer', 'Szeregowy', '2000-07-04', 'AMJ60482', '2018-12-15', '2033-12-31', 'okucharski@example.com', '604392910');
INSERT INTO `customer` VALUES (5, 'Julian', 'Król', '1993-10-09', 'HFJ52635', '2015-02-19', '2030-03-31', 'abielecka@example.com', '949182002');

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount`  (
  `DiscountID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `MinRentalDays` smallint(5) UNSIGNED NOT NULL,
  `MaxRentalDays` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `DiscountPercentage` decimal(5, 2) NOT NULL,
  PRIMARY KEY (`DiscountID`) USING BTREE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`DiscountPercentage` > 0 and `DiscountPercentage` <= 100),
  CONSTRAINT `CONSTRAINT_2` CHECK (`MinRentalDays` > 0),
  CONSTRAINT `CONSTRAINT_3` CHECK (`MaxRentalDays` is null or `MaxRentalDays` >= `MinRentalDays`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES (1, 5, 9, 5.00);
INSERT INTO `discount` VALUES (2, 10, 19, 10.00);
INSERT INTO `discount` VALUES (3, 20, 29, 15.00);
INSERT INTO `discount` VALUES (4, 30, NULL, 20.00);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `LastName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `HireDate` date NULL DEFAULT NULL,
  `EndDate` date NULL DEFAULT NULL,
  `AccountStatus` enum('Aktywne','Nieaktywne','W trakcie weryfikacji') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Aktywne',
  `PasswordHash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmployeeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'Marek', 'Kowalczyk', 'marek.kowalczyk@example.com', '501 234 567', NULL, NULL, 'Aktywne', 'Qwerty@123', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (2, 'Anna', 'Nowak', 'anna.nowak@example.com', '502 345 678', NULL, NULL, 'Aktywne', 'Passw0rd!21', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (3, 'Tomasz', 'Wiśniewski', 'tomasz.wisniewski@example.com', '503 456 789', NULL, NULL, 'Aktywne', 'Secure#456', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (4, 'Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com', '504 567 890', NULL, NULL, 'Aktywne', 'Kasia2024!', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (5, 'Piotr', 'Lewandowski', 'piotr.lewandowski@example.com', '505 678 901', NULL, NULL, 'Aktywne', 'Lewy%2024', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (6, 'Małgorzata', 'Zielińska', 'malgorzata.zielinska@example.com', '506 789 012', NULL, NULL, 'Aktywne', 'Gosia$2023', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (7, 'Michał', 'Szymański', 'michal.szymanski@example.com', '507 890 123', NULL, NULL, 'Aktywne', 'Mik1234@#', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (8, 'Agnieszka', 'Krawczyk', 'agnieszka.krawczyk@example.com', '508 901 234', NULL, NULL, 'Aktywne', 'Aggie@998', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (9, 'Krzysztof', 'Dąbrowski', 'krzysztof.dabrowski@example.com', '509 012 345', NULL, NULL, 'Aktywne', 'Krzy$890', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (10, 'Paulina', 'Wojciechowska', 'paulina.wojciechowska@example.com', '510 123 456', NULL, NULL, 'Aktywne', 'Paula*567', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (11, 'Jacek', 'Pawlak', 'jacek.pawlak@example.com', '511 234 567', NULL, NULL, 'Aktywne', 'Jacek!321', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (12, 'Dorota', 'Mazur', 'dorota.mazur@example.com', '512 345 678', NULL, NULL, 'Aktywne', 'Dorotka#456', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (13, 'Łukasz', 'Zając', 'lukasz.zajac@example.com', '513 456 789', NULL, NULL, 'Aktywne', 'Lukasz@789', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (14, 'Ewa', 'Pietrzak', 'ewa.pietrzak@example.com', '514 567 890', NULL, NULL, 'Aktywne', 'Ewa%2025', '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `employee` VALUES (15, 'Bartek', 'Górski', 'bartek.gorski@example.com', '515 678 901', NULL, NULL, 'Aktywne', 'Gorski$9989', '2024-12-25 11:47:09', '2025-01-01 14:32:31');

-- ----------------------------
-- Table structure for employee_audit
-- ----------------------------
DROP TABLE IF EXISTS `employee_audit`;
CREATE TABLE `employee_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `LastName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `AccountStatus` enum('Active','Inactive','Pending Verification') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PasswordHash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_audit
-- ----------------------------

-- ----------------------------
-- Table structure for employeerole
-- ----------------------------
DROP TABLE IF EXISTS `employeerole`;
CREATE TABLE `employeerole`  (
  `EmployeeID` int(11) NOT NULL,
  `RoleID` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`EmployeeID`, `RoleID`) USING BTREE,
  INDEX `FK_EmployeeRole_Role`(`RoleID` ASC) USING BTREE,
  CONSTRAINT `FK_EmployeeRole_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EmployeeRole_Role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employeerole
-- ----------------------------
INSERT INTO `employeerole` VALUES (11, 1);
INSERT INTO `employeerole` VALUES (13, 1);
INSERT INTO `employeerole` VALUES (3, 2);
INSERT INTO `employeerole` VALUES (4, 2);
INSERT INTO `employeerole` VALUES (5, 2);
INSERT INTO `employeerole` VALUES (6, 2);
INSERT INTO `employeerole` VALUES (14, 2);
INSERT INTO `employeerole` VALUES (7, 3);
INSERT INTO `employeerole` VALUES (8, 3);
INSERT INTO `employeerole` VALUES (12, 3);
INSERT INTO `employeerole` VALUES (9, 4);
INSERT INTO `employeerole` VALUES (10, 4);
INSERT INTO `employeerole` VALUES (2, 5);
INSERT INTO `employeerole` VALUES (15, 5);
INSERT INTO `employeerole` VALUES (1, 6);

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `FeatureID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FeatureName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`FeatureID`) USING BTREE,
  UNIQUE INDEX `FeatureName`(`FeatureName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO `feature` VALUES (7, 'asystent głosowy');
INSERT INTO `feature` VALUES (5, 'asystent parkowania');
INSERT INTO `feature` VALUES (4, 'asystent pasa ruchu');
INSERT INTO `feature` VALUES (8, 'hak na przyczepkę');
INSERT INTO `feature` VALUES (1, 'klimatyzacja');
INSERT INTO `feature` VALUES (2, 'ogrzewane siedzenia');
INSERT INTO `feature` VALUES (6, 'wbudowany GPS');
INSERT INTO `feature` VALUES (3, 'zaciemnione szyby');

-- ----------------------------
-- Table structure for fueltype
-- ----------------------------
DROP TABLE IF EXISTS `fueltype`;
CREATE TABLE `fueltype`  (
  `FuelTypeID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FuelTypeName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`FuelTypeID`) USING BTREE,
  UNIQUE INDEX `FuelTypeName`(`FuelTypeName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fueltype
-- ----------------------------
INSERT INTO `fueltype` VALUES (1, 'benzyna');
INSERT INTO `fueltype` VALUES (2, 'diesel');
INSERT INTO `fueltype` VALUES (3, 'elektryczny');
INSERT INTO `fueltype` VALUES (5, 'gaz');
INSERT INTO `fueltype` VALUES (4, 'hybrydowy');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `ImageID` mediumint(8) NOT NULL AUTO_INCREMENT,
  `CarID` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `ImageName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ImageURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `UploadedAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ImageID`) USING BTREE,
  INDEX `FK_Car_Image`(`CarID` ASC) USING BTREE,
  CONSTRAINT `FK_Car_Image` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, 10, 'żółte auto', 'https://images.unsplash.com/photo-1464219789935-c2d9d9aba644?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '2024-11-29 13:57:47');
INSERT INTO `image` VALUES (2, 10, 'żółte auto', 'https://images.unsplash.com/photo-1470224114660-3f6686c562eb?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '2024-11-29 14:00:03');
INSERT INTO `image` VALUES (3, 18, 'żółta wyścigówka', 'https://images.unsplash.com/photo-1518265612847-134e6599e7e4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNhciUyMHllbGxvd3xlbnwwfHwwfHx8Mg%3D%3D', '2024-11-29 14:00:37');
INSERT INTO `image` VALUES (4, 18, 'żółtek', 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGNhciUyMHllbGxvd3xlbnwwfHwwfHx8Mg%3D%3D', '2024-11-29 14:00:53');
INSERT INTO `image` VALUES (5, 20, 'żółta strzała', 'https://images.unsplash.com/photo-1517467561457-b5bc91c2e453?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNhciUyMHllbGxvd3xlbnwwfHwwfHx8Mg%3D%3D', '2024-11-29 14:01:35');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `InvoiceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CompanyAddressLine1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CompanyAddressLine2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `CompanyCity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CompanyState` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `CompanyPostalCode` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CompanyCountry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CustomerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CustomerAddressLine1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CustomerAddressLine2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `CustomerCity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CustomerState` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `CustomerPostalCode` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `CustomerCountry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `IssueDate` date NOT NULL DEFAULT curdate(),
  `DueDate` date NOT NULL,
  `TotalNetAmount` decimal(8, 2) NULL DEFAULT 0.00,
  `TotalVAT` decimal(7, 2) NULL DEFAULT 0.00,
  `TotalGrossAmount` decimal(8, 2) NULL DEFAULT 0.00,
  `InvoiceStatus` enum('Paid','Unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Unpaid',
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `EmployeeID` int(11) NULL DEFAULT NULL,
  `NIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`) USING BTREE,
  INDEX `FK_Invoice_Customer`(`CustomerID` ASC) USING BTREE,
  INDEX `FK_Invoice_Employee`(`EmployeeID` ASC) USING BTREE,
  INDEX `idx_invoice_customer`(`CustomerID` ASC) USING BTREE,
  INDEX `idx_invoice_dates`(`IssueDate` ASC, `DueDate` ASC) USING BTREE,
  INDEX `idx_invoice_status`(`InvoiceStatus` ASC) USING BTREE,
  CONSTRAINT `FK_Invoice_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Invoice_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES (1, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-07', '2024-11-08', 0.00, 0.00, 0.00, 'Paid', 5, NULL, '6871947504');
INSERT INTO `invoice` VALUES (2, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-07', '2024-11-07', 0.00, 0.00, 0.00, 'Paid', 3, NULL, '8850210863');
INSERT INTO `invoice` VALUES (3, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-08', '2024-11-08', 0.00, 0.00, 0.00, 'Paid', 1, NULL, '8850212024');
INSERT INTO `invoice` VALUES (12, 'Company XYZ', '123 Street Name', NULL, 'Cracow', 'State', '12345', 'Poland', 'Rico Lemański', '456 Another St', 'Apt 101', 'Cracow', 'CustomerState', '67890', 'Poland', '2024-12-24', '2024-12-31', 0.00, 0.00, 0.00, 'Unpaid', 2, NULL, NULL);
INSERT INTO `invoice` VALUES (13, 'Company XYZ', '123 Street Name', NULL, 'Cracow', 'State', '12345', 'Poland', 'Rico Lemański', '456 Another St', 'Apt 101', 'Cracow', 'CustomerState', '67890', 'Poland', '2024-12-24', '2024-12-31', 560.00, 128.80, 688.80, 'Unpaid', 2, NULL, NULL);

-- ----------------------------
-- Table structure for invoiceposition
-- ----------------------------
DROP TABLE IF EXISTS `invoiceposition`;
CREATE TABLE `invoiceposition`  (
  `InvoicePositionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(10) UNSIGNED NOT NULL,
  `ProductType` enum('Car','Amenity') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ProductReferenceID` int(10) UNSIGNED NOT NULL,
  `Quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `UnitNetPrice` decimal(10, 2) NOT NULL,
  `NetAmount` decimal(10, 2) GENERATED ALWAYS AS (`Quantity` * `UnitNetPrice`) PERSISTENT,
  `VATRate` decimal(5, 2) NOT NULL,
  `VATAmount` decimal(10, 2) GENERATED ALWAYS AS (`NetAmount` * `VATRate` / 100) PERSISTENT,
  `GrossAmount` decimal(10, 2) GENERATED ALWAYS AS (`NetAmount` + `VATAmount`) PERSISTENT,
  PRIMARY KEY (`InvoicePositionID`) USING BTREE,
  INDEX `idx_invoiceposition_invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `idx_invoiceposition_product`(`ProductType` ASC, `ProductReferenceID` ASC) USING BTREE,
  CONSTRAINT `invoiceposition_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Quantity` > 0)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoiceposition
-- ----------------------------
INSERT INTO `invoiceposition` VALUES (1, 13, 'Car', 15, 4, 140.00, DEFAULT, 23.00, DEFAULT, DEFAULT);

-- ----------------------------
-- Table structure for maintenance
-- ----------------------------
DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance`  (
  `MaintenanceID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` mediumint(8) UNSIGNED NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `MaintenanceDate` date NOT NULL DEFAULT curdate(),
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MaintenanceID`) USING BTREE,
  INDEX `FK_Maintenance_Car`(`CarID` ASC) USING BTREE,
  INDEX `FK_Maintenance_Employee`(`EmployeeID` ASC) USING BTREE,
  CONSTRAINT `FK_Maintenance_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Maintenance_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maintenance
-- ----------------------------
INSERT INTO `maintenance` VALUES (1, 9, 11, '2024-09-20', 'Zużyte klocki hamulcowe');
INSERT INTO `maintenance` VALUES (2, 1, 13, '2024-09-27', 'Zepsuta klimatyzacja');
INSERT INTO `maintenance` VALUES (3, 7, 11, '2024-10-24', 'Uszkodzenie elektroniki; problem z asystentem');
INSERT INTO `maintenance` VALUES (4, 3, 13, '2024-10-31', 'Zepsuta klimatyzacja');
INSERT INTO `maintenance` VALUES (5, 13, 11, '2024-11-02', 'Zużyty filtr paliwa');
INSERT INTO `maintenance` VALUES (6, 20, 13, '2024-11-06', 'Uszkodzenie podwozia');

-- ----------------------------
-- Table structure for make
-- ----------------------------
DROP TABLE IF EXISTS `make`;
CREATE TABLE `make`  (
  `MakeID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `MakeName` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MakeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of make
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL DEFAULT curdate(),
  `Amount` decimal(8, 2) NOT NULL,
  `PaymentStatus` enum('Completed','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Pending',
  `TransactionID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `InvoiceID` int(10) UNSIGNED NOT NULL,
  `PaymentMethodID` tinyint(3) UNSIGNED NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentID`) USING BTREE,
  INDEX `FK_Payment_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Payment_PaymentMethod`(`PaymentMethodID` ASC) USING BTREE,
  INDEX `idx_payment_invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `idx_payment_date`(`PaymentDate` ASC) USING BTREE,
  CONSTRAINT `FK_Payment_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Payment_PaymentMethod` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, '2024-11-07', 0.00, 'Completed', '123', 1, 3, '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `payment` VALUES (2, '2024-11-27', 0.00, 'Pending', '321', 2, 2, '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `payment` VALUES (3, '2024-11-27', 0.00, 'Pending', '942', 3, 2, '2024-12-25 11:47:09', '2024-12-25 11:47:09');

-- ----------------------------
-- Table structure for payment_audit
-- ----------------------------
DROP TABLE IF EXISTS `payment_audit`;
CREATE TABLE `payment_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL,
  `Amount` decimal(8, 2) NOT NULL,
  `PaymentStatus` enum('Completed','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `PaymentDate` date NOT NULL,
  `TransactionID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PaymentMethodID` tinyint(4) NOT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE,
  INDEX `idx_payment_audit_timestamp`(`ChangeTimestamp` ASC) USING BTREE,
  INDEX `idx_payment_audit_payment`(`PaymentID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_audit
-- ----------------------------

-- ----------------------------
-- Table structure for paymentmethod
-- ----------------------------
DROP TABLE IF EXISTS `paymentmethod`;
CREATE TABLE `paymentmethod`  (
  `PaymentMethodID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PaymentMethodID`) USING BTREE,
  UNIQUE INDEX `MethodName`(`MethodName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentmethod
-- ----------------------------
INSERT INTO `paymentmethod` VALUES (3, 'BLIK');
INSERT INTO `paymentmethod` VALUES (1, 'gotówka');
INSERT INTO `paymentmethod` VALUES (2, 'karta');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `PermissionID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`PermissionID`) USING BTREE,
  UNIQUE INDEX `PermissionName`(`PermissionName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (14, 'Dostęp do mediów społecznościowych');
INSERT INTO `permission` VALUES (11, 'Dostęp do zgłoszeń technicznych');
INSERT INTO `permission` VALUES (10, 'Generowanie raportów finansowych');
INSERT INTO `permission` VALUES (12, 'Naprawa pojazdów');
INSERT INTO `permission` VALUES (2, 'Obsługa klienta');
INSERT INTO `permission` VALUES (3, 'Obsługa rezerwacji');
INSERT INTO `permission` VALUES (9, 'Wgląd w koszty firmy');
INSERT INTO `permission` VALUES (8, 'Wgląd w koszty rezerwacji');
INSERT INTO `permission` VALUES (4, 'Zarządzanie bazą klientów');
INSERT INTO `permission` VALUES (7, 'Zarządzanie flotą');
INSERT INTO `permission` VALUES (13, 'Zarządzanie kampaniami marketingowymi');
INSERT INTO `permission` VALUES (6, 'Zarządzanie płatnościami');
INSERT INTO `permission` VALUES (5, 'Zarządzanie pracownikami');
INSERT INTO `permission` VALUES (1, 'Zarządzanie rezerwacjami');

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental`  (
  `RentalID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `RentalDate` date NOT NULL DEFAULT curdate(),
  `ExpectedReturnDate` date NOT NULL,
  `ActualReturnDate` date NULL DEFAULT NULL,
  `TotalNetAmount` decimal(8, 2) NULL DEFAULT 0.00,
  `TotalVAT` decimal(7, 2) NULL DEFAULT 0.00,
  `TotalGrossAmount` decimal(8, 2) NULL DEFAULT 0.00,
  `InvoiceID` int(10) UNSIGNED NULL DEFAULT NULL,
  `ReservationID` int(10) UNSIGNED NULL DEFAULT NULL,
  `DiscountApplied` decimal(7, 2) UNSIGNED NULL DEFAULT 0.00,
  `Fine` decimal(7, 2) NOT NULL DEFAULT 0.00,
  `CreatedAt` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RentalID`) USING BTREE,
  INDEX `FK_Rental_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Rental_Reservation`(`ReservationID` ASC) USING BTREE,
  INDEX `idx_rental_dates`(`RentalDate` ASC, `ExpectedReturnDate` ASC) USING BTREE,
  INDEX `idx_rental_invoice`(`InvoiceID` ASC) USING BTREE,
  CONSTRAINT `FK_Rental_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Rental_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES (1, '2024-09-05', '2024-09-07', '2024-09-07', 450.00, 103.50, 553.50, 1, 4, 0.00, 0.00, '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `rental` VALUES (2, '2024-01-15', '2024-01-30', '2024-01-30', 1650.00, 379.50, 2029.50, 2, 5, 0.00, 0.00, '2024-12-25 11:47:09', '2024-12-25 11:47:09');
INSERT INTO `rental` VALUES (3, '2024-11-04', '2024-11-08', '2024-11-08', 9000.00, 161.00, NULL, NULL, 1, 0.00, 0.00, '2024-12-25 11:47:09', '2024-12-25 11:47:09');

-- ----------------------------
-- Table structure for rental_audit
-- ----------------------------
DROP TABLE IF EXISTS `rental_audit`;
CREATE TABLE `rental_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `RentalID` int(11) NOT NULL,
  `RentalDate` date NOT NULL,
  `ExpectedReturnDate` date NULL DEFAULT NULL,
  `ActualReturnDate` date NULL DEFAULT NULL,
  `TotalNetAmount` decimal(8, 2) NULL DEFAULT NULL,
  `TotalVAT` decimal(7, 2) NULL DEFAULT NULL,
  `TotalGrossAmount` decimal(8, 2) NULL DEFAULT NULL,
  `DiscountApplied` decimal(7, 2) NULL DEFAULT NULL,
  `Fine` decimal(7, 2) NULL DEFAULT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE,
  INDEX `idx_rental_audit_rental`(`RentalID` ASC) USING BTREE,
  INDEX `idx_rental_audit_timestamp`(`ChangeTimestamp` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental_audit
-- ----------------------------

-- ----------------------------
-- Table structure for rentalamenity
-- ----------------------------
DROP TABLE IF EXISTS `rentalamenity`;
CREATE TABLE `rentalamenity`  (
  `RentalID` int(10) UNSIGNED NOT NULL,
  `AmenityID` smallint(5) UNSIGNED NOT NULL,
  `Quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `DailyRateApplied` decimal(7, 2) NOT NULL,
  PRIMARY KEY (`RentalID`, `AmenityID`) USING BTREE,
  INDEX `AmenityID`(`AmenityID` ASC) USING BTREE,
  CONSTRAINT `rentalamenity_ibfk_1` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rentalamenity_ibfk_2` FOREIGN KEY (`AmenityID`) REFERENCES `amenity` (`AmenityID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rentalamenity
-- ----------------------------

-- ----------------------------
-- Table structure for rentalcar
-- ----------------------------
DROP TABLE IF EXISTS `rentalcar`;
CREATE TABLE `rentalcar`  (
  `RentalID` int(10) UNSIGNED NOT NULL,
  `CarID` mediumint(8) UNSIGNED NOT NULL,
  `DailyRateApplied` decimal(6, 2) NOT NULL,
  `DiscountAppliedPercentage` decimal(5, 2) NULL DEFAULT 0.00,
  `RentalDuration` smallint(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`RentalID`, `CarID`) USING BTREE,
  INDEX `FK_RentalCar_Car`(`CarID` ASC) USING BTREE,
  INDEX `idx_rentalcar_rental`(`RentalID` ASC) USING BTREE,
  INDEX `idx_rentalcar_car`(`CarID` ASC) USING BTREE,
  CONSTRAINT `FK_RentalCar_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RentalCar_Rental` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rentalcar
-- ----------------------------
INSERT INTO `rentalcar` VALUES (1, 1, 150.00, 0.00, 3);
INSERT INTO `rentalcar` VALUES (2, 14, 110.00, 0.00, 16);
INSERT INTO `rentalcar` VALUES (3, 15, 140.00, 0.00, 4);

-- ----------------------------
-- Table structure for rentalcar_audit
-- ----------------------------
DROP TABLE IF EXISTS `rentalcar_audit`;
CREATE TABLE `rentalcar_audit`  (
  `AuditID` int(11) NOT NULL AUTO_INCREMENT,
  `RentalID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `DailyRateApplied` decimal(6, 2) NULL DEFAULT NULL,
  `RentalDuration` smallint(5) UNSIGNED NOT NULL,
  `ChangeType` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `ChangedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `ChangeTimestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AuditID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rentalcar_audit
-- ----------------------------

-- ----------------------------
-- Table structure for rentalcustomer
-- ----------------------------
DROP TABLE IF EXISTS `rentalcustomer`;
CREATE TABLE `rentalcustomer`  (
  `RentalID` int(10) UNSIGNED NOT NULL,
  `CustomerID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`RentalID`, `CustomerID`) USING BTREE,
  INDEX `FK_RentalCustomer_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_RentalCustomer_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RentalCustomer_Rental` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rentalcustomer
-- ----------------------------
INSERT INTO `rentalcustomer` VALUES (1, 1);

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `ReservationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ReservationDate` timestamp NOT NULL DEFAULT curdate(),
  `PickupDate` date NOT NULL,
  `ReturnDate` date NOT NULL,
  `ReservationStatus` enum('Active','Cancelled','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Active',
  `CustomerID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ReservationID`) USING BTREE,
  INDEX `FK_Reservation_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (1, '2024-10-31 00:00:00', '2024-11-04', '2024-11-08', 'Active', 1);
INSERT INTO `reservation` VALUES (2, '2024-11-07 00:00:00', '2024-12-01', '2024-12-31', 'Active', 2);
INSERT INTO `reservation` VALUES (3, '2024-11-07 00:00:00', '2024-11-11', '2024-11-13', 'Active', 4);
INSERT INTO `reservation` VALUES (4, '2024-09-02 00:00:00', '2024-09-05', '2024-09-07', 'Completed', 5);
INSERT INTO `reservation` VALUES (5, '2024-01-01 00:00:00', '2025-01-15', '2025-01-30', 'Completed', 3);

-- ----------------------------
-- Table structure for reservationamenity
-- ----------------------------
DROP TABLE IF EXISTS `reservationamenity`;
CREATE TABLE `reservationamenity`  (
  `ReservationID` int(10) UNSIGNED NOT NULL,
  `AmenityID` smallint(5) UNSIGNED NOT NULL,
  `Quantity` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`ReservationID`, `AmenityID`) USING BTREE,
  INDEX `AmenityID`(`AmenityID` ASC) USING BTREE,
  CONSTRAINT `reservationamenity_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reservationamenity_ibfk_2` FOREIGN KEY (`AmenityID`) REFERENCES `amenity` (`AmenityID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservationamenity
-- ----------------------------

-- ----------------------------
-- Table structure for reservationcar
-- ----------------------------
DROP TABLE IF EXISTS `reservationcar`;
CREATE TABLE `reservationcar`  (
  `ReservationID` int(10) UNSIGNED NOT NULL,
  `CarID` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`ReservationID`, `CarID`) USING BTREE,
  INDEX `FK_ReservationCar_Car`(`CarID` ASC) USING BTREE,
  CONSTRAINT `FK_ReservationCar_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ReservationCar_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservationcar
-- ----------------------------
INSERT INTO `reservationcar` VALUES (4, 1);
INSERT INTO `reservationcar` VALUES (3, 11);
INSERT INTO `reservationcar` VALUES (5, 14);
INSERT INTO `reservationcar` VALUES (1, 15);
INSERT INTO `reservationcar` VALUES (2, 18);

-- ----------------------------
-- Table structure for reservationcustomer
-- ----------------------------
DROP TABLE IF EXISTS `reservationcustomer`;
CREATE TABLE `reservationcustomer`  (
  `ReservationID` int(10) UNSIGNED NOT NULL,
  `CustomerID` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ReservationID`, `CustomerID`) USING BTREE,
  INDEX `FK_ReservationCustomer_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_ReservationCustomer_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ReservationCustomer_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservationcustomer
-- ----------------------------
INSERT INTO `reservationcustomer` VALUES (1, 1);
INSERT INTO `reservationcustomer` VALUES (2, 2);
INSERT INTO `reservationcustomer` VALUES (5, 3);
INSERT INTO `reservationcustomer` VALUES (3, 4);
INSERT INTO `reservationcustomer` VALUES (4, 5);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `RoleID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`RoleID`) USING BTREE,
  UNIQUE INDEX `RoleName`(`RoleName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (6, 'Dyrektor Generalny CEO');
INSERT INTO `role` VALUES (3, 'Koordynator ds. wynajmu');
INSERT INTO `role` VALUES (5, 'Księgowy');
INSERT INTO `role` VALUES (1, 'Mechanik');
INSERT INTO `role` VALUES (2, 'Pracownik biura wynajmu');
INSERT INTO `role` VALUES (4, 'Specjalista ds. marketingu');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `RoleID` tinyint(3) UNSIGNED NOT NULL,
  `PermissionID` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`RoleID`, `PermissionID`) USING BTREE,
  INDEX `FK_RolePermission_Permission`(`PermissionID` ASC) USING BTREE,
  CONSTRAINT `FK_RolePermission_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RolePermission_Role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (2, 1);
INSERT INTO `rolepermission` VALUES (6, 1);
INSERT INTO `rolepermission` VALUES (2, 2);
INSERT INTO `rolepermission` VALUES (3, 2);
INSERT INTO `rolepermission` VALUES (6, 2);
INSERT INTO `rolepermission` VALUES (2, 3);
INSERT INTO `rolepermission` VALUES (3, 3);
INSERT INTO `rolepermission` VALUES (6, 3);
INSERT INTO `rolepermission` VALUES (2, 4);
INSERT INTO `rolepermission` VALUES (3, 4);
INSERT INTO `rolepermission` VALUES (6, 4);
INSERT INTO `rolepermission` VALUES (6, 5);
INSERT INTO `rolepermission` VALUES (3, 6);
INSERT INTO `rolepermission` VALUES (5, 6);
INSERT INTO `rolepermission` VALUES (6, 6);
INSERT INTO `rolepermission` VALUES (6, 7);
INSERT INTO `rolepermission` VALUES (2, 8);
INSERT INTO `rolepermission` VALUES (3, 8);
INSERT INTO `rolepermission` VALUES (5, 8);
INSERT INTO `rolepermission` VALUES (6, 8);
INSERT INTO `rolepermission` VALUES (5, 9);
INSERT INTO `rolepermission` VALUES (6, 9);
INSERT INTO `rolepermission` VALUES (5, 10);
INSERT INTO `rolepermission` VALUES (6, 10);
INSERT INTO `rolepermission` VALUES (1, 11);
INSERT INTO `rolepermission` VALUES (3, 11);
INSERT INTO `rolepermission` VALUES (6, 11);
INSERT INTO `rolepermission` VALUES (1, 12);
INSERT INTO `rolepermission` VALUES (4, 13);
INSERT INTO `rolepermission` VALUES (6, 13);
INSERT INTO `rolepermission` VALUES (4, 14);
INSERT INTO `rolepermission` VALUES (6, 14);

-- ----------------------------
-- Table structure for transmissiontype
-- ----------------------------
DROP TABLE IF EXISTS `transmissiontype`;
CREATE TABLE `transmissiontype`  (
  `TransmissionTypeID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TransmissionTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TransmissionTypeID`) USING BTREE,
  UNIQUE INDEX `TransmissionTypeName`(`TransmissionTypeName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transmissiontype
-- ----------------------------
INSERT INTO `transmissiontype` VALUES (1, 'Automatic');
INSERT INTO `transmissiontype` VALUES (2, 'Manual');

-- ----------------------------
-- Table structure for vehiclecategory
-- ----------------------------
DROP TABLE IF EXISTS `vehiclecategory`;
CREATE TABLE `vehiclecategory`  (
  `CategoryID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CategoryName` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CategoryID`) USING BTREE,
  UNIQUE INDEX `CategoryName`(`CategoryName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehiclecategory
-- ----------------------------
INSERT INTO `vehiclecategory` VALUES (1, 'A', 'Auto kompaktowe');
INSERT INTO `vehiclecategory` VALUES (2, 'B', 'Auto średnie');
INSERT INTO `vehiclecategory` VALUES (3, 'C', 'SUV');
INSERT INTO `vehiclecategory` VALUES (4, 'D', 'Luksusowy sedan');
INSERT INTO `vehiclecategory` VALUES (5, 'E', 'Miniwan');

-- ----------------------------
-- Table structure for vehicletype
-- ----------------------------
DROP TABLE IF EXISTS `vehicletype`;
CREATE TABLE `vehicletype`  (
  `VehicleTypeID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CategoryID` tinyint(3) UNSIGNED NOT NULL,
  `SeatingCapacity` smallint(2) UNSIGNED NOT NULL,
  `LuggageCapacity` smallint(2) UNSIGNED NULL DEFAULT NULL,
  `TransmissionTypeID` tinyint(3) UNSIGNED NOT NULL,
  `MinimumDrivingExperience` smallint(2) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`VehicleTypeID`) USING BTREE,
  INDEX `TransmissionTypeID`(`TransmissionTypeID` ASC) USING BTREE,
  INDEX `CategoryID`(`CategoryID` ASC) USING BTREE,
  CONSTRAINT `vehicletype_ibfk_1` FOREIGN KEY (`TransmissionTypeID`) REFERENCES `transmissiontype` (`TransmissionTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vehicletype_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `vehiclecategory` (`CategoryID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicletype
-- ----------------------------
INSERT INTO `vehicletype` VALUES (1, 1, 4, 200, 1, 0);
INSERT INTO `vehicletype` VALUES (2, 2, 5, 400, 1, 1);
INSERT INTO `vehicletype` VALUES (3, 4, 5, 500, 2, 2);
INSERT INTO `vehicletype` VALUES (4, 2, 5, 450, 2, 3);
INSERT INTO `vehicletype` VALUES (5, 5, 7, 650, 1, 4);
INSERT INTO `vehicletype` VALUES (6, 1, 4, 150, 2, 0);
INSERT INTO `vehicletype` VALUES (7, 2, 5, 350, 1, 1);
INSERT INTO `vehicletype` VALUES (8, 5, 7, 600, 2, 2);
INSERT INTO `vehicletype` VALUES (9, 2, 2, 100, 1, 3);
INSERT INTO `vehicletype` VALUES (10, 3, 9, 700, 2, 5);

-- ----------------------------
-- View structure for v_ActiveReservations
-- ----------------------------
DROP VIEW IF EXISTS `v_ActiveReservations`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_ActiveReservations` AS select `res`.`ReservationID` AS `ReservationID`,`res`.`ReservationDate` AS `ReservationDate`,`res`.`PickupDate` AS `PickupDate`,`res`.`ReturnDate` AS `ReturnDate`,`c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`c`.`Email` AS `Email`,`rc`.`CarID` AS `CarID`,`m`.`MakeName` AS `Make`,`car`.`Model` AS `Model`,`car`.`LicensePlateNumber` AS `LicensePlateNumber` from ((((`reservation` `res` join `customer` `c` on(`res`.`CustomerID` = `c`.`CustomerID`)) join `reservationcar` `rc` on(`res`.`ReservationID` = `rc`.`ReservationID`)) join `car` on(`rc`.`CarID` = `car`.`CarID`)) left join `make` `m` on(`car`.`MakeID` = `m`.`MakeID`)) where `res`.`ReservationStatus` = 'Active' and `res`.`PickupDate` >= curdate() order by `res`.`PickupDate`;

-- ----------------------------
-- View structure for v_AvailableCars
-- ----------------------------
DROP VIEW IF EXISTS `v_AvailableCars`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_AvailableCars` AS select `c`.`CarID` AS `CarID`,`c`.`LicensePlateNumber` AS `LicensePlateNumber`,`m`.`MakeName` AS `Make`,`c`.`Model` AS `Model`,`c`.`Year` AS `Year`,`c`.`Color` AS `Color`,`c`.`DailyRate` AS `DailyRate`,`vc`.`CategoryName` AS `VehicleCategory`,`t`.`TransmissionTypeName` AS `TransmissionType`,group_concat(distinct `f`.`FeatureName` separator ', ') AS `Features`,group_concat(distinct `a`.`AmenityName` separator ', ') AS `Amenities` from ((((((((`car` `c` join `vehicletype` `vt` on(`c`.`VehicleTypeID` = `vt`.`VehicleTypeID`)) join `vehiclecategory` `vc` on(`vc`.`CategoryID` = `vt`.`CategoryID`)) join `transmissiontype` `t` on(`t`.`TransmissionTypeID` = `vt`.`TransmissionTypeID`)) left join `make` `m` on(`c`.`MakeID` = `m`.`MakeID`)) left join `carfeature` `cf` on(`c`.`CarID` = `cf`.`CarID`)) left join `feature` `f` on(`cf`.`FeatureID` = `f`.`FeatureID`)) left join `caramenity` `ca` on(`c`.`CarID` = `ca`.`CarID`)) left join `amenity` `a` on(`ca`.`AmenityID` = `a`.`AmenityID`)) where `c`.`CarStatus` = 'Available' group by `c`.`CarID`,`c`.`LicensePlateNumber`,`m`.`MakeName`,`c`.`Model`,`c`.`Year`,`c`.`Color`,`c`.`DailyRate`,`vc`.`CategoryName`,`t`.`TransmissionTypeName`;

-- ----------------------------
-- View structure for v_CarsCountRentedByMonth
-- ----------------------------
DROP VIEW IF EXISTS `v_CarsCountRentedByMonth`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_CarsCountRentedByMonth` AS select year(`r`.`RentalDate`) AS `RentalYear`,month(`r`.`RentalDate`) AS `RentalMonth`,count(distinct `rc`.`CarID`) AS `CarsRented` from (`rental` `r` join `rentalcar` `rc` on(`r`.`RentalID` = `rc`.`RentalID`)) group by year(`r`.`RentalDate`),month(`r`.`RentalDate`) order by year(`r`.`RentalDate`) desc,month(`r`.`RentalDate`) desc;

-- ----------------------------
-- View structure for v_CarUtilityStats
-- ----------------------------
DROP VIEW IF EXISTS `v_CarUtilityStats`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_CarUtilityStats` AS select `car`.`CarID` AS `CarID`,`car`.`LicensePlateNumber` AS `LicensePlateNumber`,`m`.`MakeName` AS `Make`,`car`.`Model` AS `Model`,sum(`rc`.`RentalDuration`) AS `TotalRentalDays`,sum(`rc`.`DailyRateApplied` * `rc`.`RentalDuration`) AS `TotalRevenue` from ((`car` left join `make` `m` on(`car`.`MakeID` = `m`.`MakeID`)) left join `rentalcar` `rc` on(`car`.`CarID` = `rc`.`CarID`)) group by `car`.`CarID`,`car`.`LicensePlateNumber`,`m`.`MakeName`,`car`.`Model`;

-- ----------------------------
-- View structure for v_EmployeeCountByRoles
-- ----------------------------
DROP VIEW IF EXISTS `v_EmployeeCountByRoles`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_EmployeeCountByRoles` AS select `r`.`RoleName` AS `RoleName`,count(distinct `e`.`EmployeeID`) AS `employee_count` from ((`employee` `e` join `employeerole` `er` on(`e`.`EmployeeID` = `er`.`EmployeeID`)) join `role` `r` on(`r`.`RoleID` = `er`.`RoleID`)) group by `r`.`RoleName` order by count(distinct `e`.`EmployeeID`) desc;

-- ----------------------------
-- View structure for v_EmployeeInfoWithAccountStatus
-- ----------------------------
DROP VIEW IF EXISTS `v_EmployeeInfoWithAccountStatus`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_EmployeeInfoWithAccountStatus` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`e`.`LastName` AS `LastName`,`e`.`Email` AS `Email`,`e`.`PhoneNumber` AS `PhoneNumber`,`r`.`RoleName` AS `RoleName`,`e`.`AccountStatus` AS `AccountStatus` from ((`employee` `e` join `employeerole` `er` on(`e`.`EmployeeID` = `er`.`EmployeeID`)) join `role` `r` on(`r`.`RoleID` = `er`.`RoleID`)) order by `e`.`AccountStatus`;

-- ----------------------------
-- View structure for v_InvoiceSummaryByCustomer
-- ----------------------------
DROP VIEW IF EXISTS `v_InvoiceSummaryByCustomer`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_InvoiceSummaryByCustomer` AS select `invoice`.`CustomerID` AS `CustomerID`,count(`invoice`.`InvoiceID`) AS `TotalInvoices`,sum(case when `invoice`.`InvoiceStatus` = 'Paid' then `invoice`.`TotalGrossAmount` else 0 end) AS `TotalPaid`,sum(case when `invoice`.`InvoiceStatus` = 'Unpaid' then `invoice`.`TotalGrossAmount` else 0 end) AS `TotalUnpaid`,sum(case when `invoice`.`DueDate` < curdate() and `invoice`.`InvoiceStatus` = 'Unpaid' then `invoice`.`TotalGrossAmount` else 0 end) AS `OverdueAmount` from `invoice` group by `invoice`.`CustomerID`;

-- ----------------------------
-- View structure for v_PopularCars
-- ----------------------------
DROP VIEW IF EXISTS `v_PopularCars`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_PopularCars` AS select `c`.`CarID` AS `CarID`,`c`.`LicensePlateNumber` AS `LicensePlateNumber`,`m`.`MakeName` AS `Make`,`c`.`Model` AS `Model`,count(`rc`.`RentalID`) AS `TimesRented` from ((`car` `c` left join `make` `m` on(`c`.`MakeID` = `m`.`MakeID`)) left join `rentalcar` `rc` on(`c`.`CarID` = `rc`.`CarID`)) group by `c`.`CarID`,`c`.`LicensePlateNumber`,`m`.`MakeName`,`c`.`Model` order by count(`rc`.`RentalID`) desc;

-- ----------------------------
-- View structure for v_RevenueByMonth
-- ----------------------------
DROP VIEW IF EXISTS `v_RevenueByMonth`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_RevenueByMonth` AS select year(`r`.`RentalDate`) AS `Year`,month(`r`.`RentalDate`) AS `Month`,sum(`r`.`TotalGrossAmount`) AS `TotalRevenue` from `rental` `r` group by year(`r`.`RentalDate`),month(`r`.`RentalDate`) order by year(`r`.`RentalDate`) desc,month(`r`.`RentalDate`) desc;

-- ----------------------------
-- View structure for v_UpcomingMaintenance
-- ----------------------------
DROP VIEW IF EXISTS `v_UpcomingMaintenance`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_UpcomingMaintenance` AS select `m`.`MaintenanceID` AS `MaintenanceID`,`c`.`CarID` AS `CarID`,`c`.`LicensePlateNumber` AS `LicensePlateNumber`,`m`.`MaintenanceDate` AS `MaintenanceDate`,`m`.`Description` AS `Description`,`m`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `EmployeeFirstName`,`e`.`LastName` AS `EmployeeLastName` from ((`maintenance` `m` join `car` `c` on(`m`.`CarID` = `c`.`CarID`)) left join `employee` `e` on(`m`.`EmployeeID` = `e`.`EmployeeID`)) where `m`.`MaintenanceDate` >= curdate() order by `m`.`MaintenanceDate`;

-- ----------------------------
-- View structure for v_UpcomingReservations
-- ----------------------------
DROP VIEW IF EXISTS `v_UpcomingReservations`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_UpcomingReservations` AS select `res`.`ReservationID` AS `ReservationID`,`res`.`ReservationDate` AS `ReservationDate`,`res`.`PickupDate` AS `PickupDate`,`res`.`ReturnDate` AS `ReturnDate`,`c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `CustomerFirstName`,`c`.`LastName` AS `CustomerLastName`,`c`.`Email` AS `CustomerEmail`,`car`.`CarID` AS `CarID`,`car`.`LicensePlateNumber` AS `LicensePlateNumber`,`m`.`MakeName` AS `Make`,`car`.`Model` AS `Model` from ((((`reservation` `res` join `customer` `c` on(`res`.`CustomerID` = `c`.`CustomerID`)) join `reservationcar` `rc` on(`res`.`ReservationID` = `rc`.`ReservationID`)) join `car` on(`rc`.`CarID` = `car`.`CarID`)) left join `make` `m` on(`car`.`MakeID` = `m`.`MakeID`)) where `res`.`PickupDate` between curdate() and curdate() + interval 7 day and `res`.`ReservationStatus` = 'Active' order by `res`.`PickupDate`;

-- ----------------------------
-- Procedure structure for AddCustomer
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddCustomer`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Procedure structure for AddReservation
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddReservation`;
delimiter ;;

;;
delimiter ;

-- ----------------------------
-- Function structure for CalculateDiscountAmount
-- ----------------------------
DROP FUNCTION IF EXISTS `CalculateDiscountAmount`;
delimiter ;;
CREATE DEFINER=`huza_martyna`@`%` FUNCTION `CalculateDiscountAmount`(RentalStartDate DATE,
    ExpectedReturnDate DATE,
    TotalNetAmount DECIMAL(8,2)
) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
    DECLARE RentalDays INT;
    DECLARE DiscountAmount DECIMAL(5,2) DEFAULT 0.00;

    SET RentalDays = DATEDIFF(ExpectedReturnDate, RentalStartDate) + 1;

    SELECT DiscountPercentage INTO DiscountAmount
    FROM discount
    WHERE RentalDays BETWEEN MinRentalDays AND MaxRentalDays
    OR (MaxRentalDays IS NULL AND MinRentalDays <= RentalDays)
    ORDER BY MinRentalDays DESC
    LIMIT 1;

    IF DiscountAmount IS NULL THEN
        SET DiscountAmount = 0.00;
    END IF;

    RETURN ROUND(TotalNetAmount * DiscountAmount / 100, 2);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GenerateInvoiceWithAddresses
-- ----------------------------
DROP PROCEDURE IF EXISTS `GenerateInvoiceWithAddresses`;
delimiter ;;
CREATE DEFINER=`huza_martyna`@`%` PROCEDURE `GenerateInvoiceWithAddresses`(
  IN input_RentalID INT UNSIGNED,
  IN input_VATRate DECIMAL(5, 2),
  IN input_InvoiceStatus VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci, # Paid or Unpaid but enum is not allowed so varchar it 
  IN input_CompanyName VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyAddressLine1 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyAddressLine2 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyCity VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyState VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyPostalCode VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CompanyCountry VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerID INT UNSIGNED,
  IN input_CustomerAddressLine1 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerAddressLine2 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerCity VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerState VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerPostalCode VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci,
  IN input_CustomerCountry VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci
)
BEGIN
  DECLARE new_InvoiceID INT UNSIGNED;
  DECLARE invoice_total_net DECIMAL(8, 2) DEFAULT 0.00;
  DECLARE invoice_total_vat DECIMAL(7, 2) DEFAULT 0.00;
  DECLARE invoice_total_gross DECIMAL(8, 2) DEFAULT 0.00;

  # Validate InvoiceStatus input
  IF input_InvoiceStatus NOT IN ('Paid', 'Unpaid') THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid InvoiceStatus value. Must be "Paid" or "Unpaid".';
  END IF;

  # Create the invoice
  INSERT INTO invoice (
    CompanyName, CompanyAddressLine1, CompanyAddressLine2, 
    CompanyCity, CompanyState, CompanyPostalCode, CompanyCountry,
    CustomerName, CustomerAddressLine1, CustomerAddressLine2, 
    CustomerCity, CustomerState, CustomerPostalCode, CustomerCountry,
    CustomerID, IssueDate, DueDate, InvoiceStatus
  )
  SELECT 
    input_CompanyName, input_CompanyAddressLine1, input_CompanyAddressLine2,
    input_CompanyCity, input_CompanyState, input_CompanyPostalCode, input_CompanyCountry,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    input_CustomerAddressLine1, input_CustomerAddressLine2,
    input_CustomerCity, input_CustomerState, input_CustomerPostalCode, input_CustomerCountry,
    input_CustomerID,
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 7 DAY), # Default payment deadline: 7 days
    input_InvoiceStatus
  FROM customer c
  WHERE c.CustomerID = input_CustomerID;

  # Get the newly inserted InvoiceID to use later with the invoicePosition
  SELECT InvoiceID
  INTO new_InvoiceID
  FROM invoice
  WHERE CustomerID = input_CustomerID
    AND IssueDate = CURDATE()
    AND DueDate = DATE_ADD(CURDATE(), INTERVAL 7 DAY)
    AND InvoiceStatus = input_InvoiceStatus
    AND InvoiceID = LAST_INSERT_ID(); # This will work. Why? Cuz it's for a given session (no need to worry about the other users) and since the last insert was into an invoice table (the insert above) we will get the last invoice ID


  # Insert cars into invoicePosition
  INSERT INTO invoiceposition (
    InvoiceID, ProductType, ProductReferenceID,
    Quantity, UnitNetPrice, VATRate
  )
  SELECT
    new_InvoiceID,
    'Car' AS ProductType,
    rc.CarID AS ProductReferenceID,
    rc.RentalDuration AS Quantity,
    rc.DailyRateApplied AS UnitNetPrice,
    input_VATRate
  FROM rentalcar rc
  WHERE rc.RentalID = input_RentalID;

  # Insert amenities into invoicePosition
  INSERT INTO invoiceposition (
    InvoiceID, ProductType, ProductReferenceID,
    Quantity, UnitNetPrice, VATRate
  )
  SELECT
    new_InvoiceID,
    'Amenity' AS ProductType,
    ra.AmenityID AS ProductReferenceID,
    ra.Quantity AS Quantity,
    ra.DailyRateApplied AS UnitNetPrice,
    input_VATRate
  FROM rentalamenity ra
  WHERE ra.RentalID = input_RentalID;

  # Calc totals for the invoice
  SELECT 
    SUM(NetAmount) AS TotalNet,
    SUM(VATAmount) AS TotalVAT,
    SUM(GrossAmount) AS TotalGross
  INTO 
    invoice_total_net, invoice_total_vat, invoice_total_gross
  FROM invoiceposition
  WHERE InvoiceID = new_InvoiceID;

  # Update invoice with totals
  UPDATE invoice
  SET 
    TotalNetAmount = invoice_total_net,
    TotalVAT = invoice_total_vat,
    TotalGrossAmount = invoice_total_gross
  WHERE InvoiceID = new_InvoiceID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UpdateInvoiceStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateInvoiceStatus`;
delimiter ;;
CREATE DEFINER=`huza_martyna`@`%` PROCEDURE `UpdateInvoiceStatus`(IN p_invoice_id INT)
BEGIN
  DECLARE total_payments DECIMAL(8,2);
  DECLARE invoice_total DECIMAL(8,2);

  SELECT SUM(Amount) INTO total_payments FROM payment WHERE InvoiceID = p_invoice_id;
  SELECT TotalGrossAmount INTO invoice_total FROM invoice WHERE InvoiceID = p_invoice_id;

  IF total_payments >= invoice_total THEN
    UPDATE invoice SET InvoiceStatus = 'Paid' WHERE InvoiceID = p_invoice_id;
  ELSEIF total_payments > 0 THEN
    UPDATE invoice SET InvoiceStatus = 'Unpaid' WHERE InvoiceID = p_invoice_id;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table employee
-- ----------------------------
DROP TRIGGER IF EXISTS `employee_password_update`;
delimiter ;;
CREATE TRIGGER `employee_password_update` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
  IF NEW.PasswordHash = OLD.PasswordHash THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nowe hasło nie może być takie same jak stare hasło.';
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table payment
-- ----------------------------
DROP TRIGGER IF EXISTS `ValidatePayment`;
delimiter ;;
CREATE TRIGGER `ValidatePayment` AFTER INSERT ON `payment` FOR EACH ROW BEGIN
  DECLARE total_payments DECIMAL(8,2);
  DECLARE invoice_total DECIMAL(8,2);

  SELECT SUM(Amount) INTO total_payments FROM payment WHERE InvoiceID = NEW.InvoiceID;
  SELECT TotalGrossAmount INTO invoice_total FROM invoice WHERE InvoiceID = NEW.InvoiceID;

  IF total_payments > invoice_total THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Suma płatności przekracza sumę na fakturze.';
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
