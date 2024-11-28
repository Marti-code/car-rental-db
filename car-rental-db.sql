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

 Date: 28/11/2024 21:14:54
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
  PRIMARY KEY (`AmenityID`) USING BTREE,
  UNIQUE INDEX `AmenityName`(`AmenityName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amenity
-- ----------------------------
INSERT INTO `amenity` VALUES (1, 'fotelik dziecięcy', 10.00);
INSERT INTO `amenity` VALUES (2, 'przyczepa mała', 35.00);
INSERT INTO `amenity` VALUES (3, 'przyczepa duża', 50.00);
INSERT INTO `amenity` VALUES (4, 'uchwyt na rowery', 15.00);

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `CarID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LicensePlateNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `VIN` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Make` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Year` smallint(4) UNSIGNED NOT NULL,
  `Color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Mileage` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `CarStatus` enum('Available','Rented','Under Maintenance') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Available',
  `VehicleTypeID` smallint(5) UNSIGNED NOT NULL,
  `FuelTypeID` tinyint(3) UNSIGNED NOT NULL,
  `OC_DueDate` date NULL DEFAULT NULL,
  `AC_DueDate` date NULL DEFAULT NULL,
  `CanGoAbroad` enum('Tak','Nie') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Tak',
  `DailyRate` decimal(7, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CarID`) USING BTREE,
  UNIQUE INDEX `LicensePlateNumber`(`LicensePlateNumber` ASC) USING BTREE,
  UNIQUE INDEX `VIN`(`VIN` ASC) USING BTREE,
  INDEX `FK_Car_VehicleType`(`VehicleTypeID` ASC) USING BTREE,
  INDEX `FK_Car_FuelType`(`FuelTypeID` ASC) USING BTREE,
  CONSTRAINT `FK_Car_FuelType` FOREIGN KEY (`FuelTypeID`) REFERENCES `fueltype` (`FuelTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Car_VehicleType` FOREIGN KEY (`VehicleTypeID`) REFERENCES `vehicletype` (`VehicleTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, 'KRA12345', '1HGCM82633A123456', 'Toyota', 'Corolla', 2018, 'Czerwony', 50000, 'Available', 1, 1, '2024-06-15', '2025-06-15', 'Tak', 150.00);
INSERT INTO `car` VALUES (2, 'KRK98765', '1HGCM82633A987654', 'Ford', 'Fiesta', 2019, 'Niebieski', 30000, 'Available', 2, 1, '2024-07-20', '2025-07-20', 'Nie', 120.00);
INSERT INTO `car` VALUES (3, 'WAW54321', '1HGCM82633A543210', 'BMW', 'X5', 2020, 'Czarny', 20000, 'Under Maintenance', 3, 2, '2024-08-01', '2025-08-01', 'Tak', 300.00);
INSERT INTO `car` VALUES (4, 'GD12345', '1HGCM82633A321654', 'Audi', 'A4', 2017, 'Biały', 60000, 'Available', 1, 1, '2024-04-10', '2025-04-10', 'Tak', 180.00);
INSERT INTO `car` VALUES (5, 'WRO67890', '1HGCM82633A567890', 'Mercedes', 'C-Class', 2021, 'Szary', 15000, 'Available', 4, 3, '2024-05-15', '2025-05-15', 'Tak', 250.00);
INSERT INTO `car` VALUES (6, 'POZ11111', '1HGCM82633A111111', 'Volkswagen', 'Golf', 2015, 'Zielony', 80000, 'Available', 2, 1, '2024-09-05', '2025-09-05', 'Nie', 100.00);
INSERT INTO `car` VALUES (7, 'LOD22222', '1HGCM82633A222222', 'Skoda', 'Octavia', 2016, 'Niebieski', 70000, 'Under Maintenance', 2, 1, '2024-02-25', '2025-02-25', 'Tak', 110.00);
INSERT INTO `car` VALUES (8, 'GDA33333', '1HGCM82633A333333', 'Honda', 'Civic', 2018, 'Srebrny', 45000, 'Available', 1, 1, '2024-12-10', '2025-12-10', 'Tak', 130.00);
INSERT INTO `car` VALUES (9, 'SZC44444', '1HGCM82633A444444', 'Hyundai', 'i30', 2022, 'Biały', 10000, 'Available', 2, 1, '2024-03-30', '2025-03-30', 'Tak', 160.00);
INSERT INTO `car` VALUES (10, 'KAT55555', '1HGCM82633A555555', 'Peugeot', '208', 2019, 'Żółty', 25000, 'Available', 2, 1, '2024-08-17', '2025-08-17', 'Tak', 140.00);
INSERT INTO `car` VALUES (11, 'KRK66666', '1HGCM82633A666666', 'Nissan', 'Qashqai', 2021, 'Czerwony', 18000, 'Rented', 3, 2, '2024-11-10', '2025-11-10', 'Tak', 220.00);
INSERT INTO `car` VALUES (12, 'WAW77777', '1HGCM82633A777777', 'Kia', 'Sportage', 2020, 'Czarny', 32000, 'Available', 3, 2, '2024-01-15', '2025-01-15', 'Nie', 200.00);
INSERT INTO `car` VALUES (13, 'GD88888', '1HGCM82633A888888', 'Mazda', 'CX-5', 2018, 'Szary', 55000, 'Under Maintenance', 3, 2, '2024-06-22', '2025-06-22', 'Tak', 190.00);
INSERT INTO `car` VALUES (14, 'POZ99999', '1HGCM82633A999999', 'Renault', 'Clio', 2016, 'Niebieski', 72000, 'Available', 2, 1, '2024-10-05', '2025-10-05', 'Tak', 110.00);
INSERT INTO `car` VALUES (15, 'LOD10101', '1HGCM82633A101010', 'Toyota', 'Yaris', 2021, 'Zielony', 22000, 'Rented', 2, 1, '2024-04-20', '2025-04-20', 'Tak', 140.00);
INSERT INTO `car` VALUES (16, 'GDA20202', '1HGCM82633A202020', 'Ford', 'Focus', 2019, 'Srebrny', 39000, 'Available', 2, 1, '2024-07-15', '2025-07-15', 'Tak', 130.00);
INSERT INTO `car` VALUES (17, 'SZC30303', '1HGCM82633A303030', 'Opel', 'Astra', 2020, 'Biały', 27000, 'Available', 2, 1, '2024-05-10', '2025-05-10', 'Nie', 125.00);
INSERT INTO `car` VALUES (18, 'KAT40404', '1HGCM82633A404040', 'BMW', '3 Series', 2018, 'Czarny', 60000, 'Rented', 4, 2, '2024-06-18', '2025-06-18', 'Tak', 250.00);
INSERT INTO `car` VALUES (19, 'KRK50505', '1HGCM82633A505050', 'Mercedes', 'E-Class', 2022, 'Szary', 14000, 'Available', 4, 3, '2024-12-15', '2025-12-15', 'Nie', 280.00);
INSERT INTO `car` VALUES (20, 'WAW60606', '1HGCM82633A606060', 'Audi', 'Q5', 2017, 'Niebieski', 53000, 'Under Maintenance', 3, 2, '2024-08-01', '2025-08-01', 'Tak', 270.00);

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
  `Status` enum('Aktywne','Nieaktywne') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Aktywne',
  `PasswordHash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'Marek', 'Kowalczyk', 'marek.kowalczyk@example.com', '501 234 567', NULL, NULL, 'Aktywne', 'Qwerty@123');
INSERT INTO `employee` VALUES (2, 'Anna', 'Nowak', 'anna.nowak@example.com', '502 345 678', NULL, NULL, 'Aktywne', 'Passw0rd!21');
INSERT INTO `employee` VALUES (3, 'Tomasz', 'Wiśniewski', 'tomasz.wisniewski@example.com', '503 456 789', NULL, NULL, 'Aktywne', 'Secure#456');
INSERT INTO `employee` VALUES (4, 'Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com', '504 567 890', NULL, NULL, 'Aktywne', 'Kasia2024!');
INSERT INTO `employee` VALUES (5, 'Piotr', 'Lewandowski', 'piotr.lewandowski@example.com', '505 678 901', NULL, NULL, 'Aktywne', 'Lewy%2024');
INSERT INTO `employee` VALUES (6, 'Małgorzata', 'Zielińska', 'malgorzata.zielinska@example.com', '506 789 012', NULL, NULL, 'Aktywne', 'Gosia$2023');
INSERT INTO `employee` VALUES (7, 'Michał', 'Szymański', 'michal.szymanski@example.com', '507 890 123', NULL, NULL, 'Aktywne', 'Mik1234@#');
INSERT INTO `employee` VALUES (8, 'Agnieszka', 'Krawczyk', 'agnieszka.krawczyk@example.com', '508 901 234', NULL, NULL, 'Aktywne', 'Aggie@998');
INSERT INTO `employee` VALUES (9, 'Krzysztof', 'Dąbrowski', 'krzysztof.dabrowski@example.com', '509 012 345', NULL, NULL, 'Aktywne', 'Krzy$890');
INSERT INTO `employee` VALUES (10, 'Paulina', 'Wojciechowska', 'paulina.wojciechowska@example.com', '510 123 456', NULL, NULL, 'Aktywne', 'Paula*567');
INSERT INTO `employee` VALUES (11, 'Jacek', 'Pawlak', 'jacek.pawlak@example.com', '511 234 567', NULL, NULL, 'Aktywne', 'Jacek!321');
INSERT INTO `employee` VALUES (12, 'Dorota', 'Mazur', 'dorota.mazur@example.com', '512 345 678', NULL, NULL, 'Aktywne', 'Dorotka#456');
INSERT INTO `employee` VALUES (13, 'Łukasz', 'Zając', 'lukasz.zajac@example.com', '513 456 789', NULL, NULL, 'Aktywne', 'Lukasz@789');
INSERT INTO `employee` VALUES (14, 'Ewa', 'Pietrzak', 'ewa.pietrzak@example.com', '514 567 890', NULL, NULL, 'Aktywne', 'Ewa%2025');
INSERT INTO `employee` VALUES (15, 'Bartek', 'Górski', 'bartek.gorski@example.com', '515 678 901', NULL, NULL, 'Aktywne', 'Gorski$998');

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
  CONSTRAINT `FK_Invoice_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Invoice_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES (1, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-07', '2024-11-08', 0.00, 0.00, 0.00, 'Paid', 5, NULL, '6871947504');
INSERT INTO `invoice` VALUES (2, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-07', '2024-11-07', 0.00, 0.00, 0.00, 'Paid', 3, NULL, '8850210863');
INSERT INTO `invoice` VALUES (3, '', '', NULL, '', NULL, '', '', '', '', NULL, '', NULL, '', '', '2024-11-08', '2024-11-08', 0.00, 0.00, 0.00, 'Paid', 1, NULL, '8850212024');

-- ----------------------------
-- Table structure for invoiceposition
-- ----------------------------
DROP TABLE IF EXISTS `invoiceposition`;
CREATE TABLE `invoiceposition`  (
  `InvoicePositionID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(10) UNSIGNED NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitNetPrice` decimal(8, 2) NOT NULL,
  `NetAmount` decimal(8, 2) GENERATED ALWAYS AS (`Quantity` * `UnitNetPrice`) PERSISTENT,
  `VATRate` decimal(7, 2) NOT NULL,
  `VATAmount` decimal(7, 2) GENERATED ALWAYS AS (`NetAmount` * `VATRate` / 100) PERSISTENT,
  `GrossAmount` decimal(8, 2) GENERATED ALWAYS AS (`NetAmount` + `VATAmount`) PERSISTENT,
  PRIMARY KEY (`InvoicePositionID`) USING BTREE,
  INDEX `FK_InvoicePosition_Invoice`(`InvoiceID` ASC) USING BTREE,
  CONSTRAINT `FK_InvoicePosition_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoiceposition
-- ----------------------------

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
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL DEFAULT curdate(),
  `AmountNet` decimal(8, 2) NOT NULL,
  `VAT` decimal(7, 2) NOT NULL,
  `AmountGross` decimal(8, 2) NOT NULL,
  `PaymentStatus` enum('Completed','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Pending',
  `TransactionID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `InvoiceID` int(10) UNSIGNED NOT NULL,
  `PaymentMethodID` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`PaymentID`) USING BTREE,
  INDEX `FK_Payment_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Payment_PaymentMethod`(`PaymentMethodID` ASC) USING BTREE,
  CONSTRAINT `FK_Payment_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Payment_PaymentMethod` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, '2024-11-07', 0.00, 23.00, 0.00, 'Completed', '123', 1, 3);
INSERT INTO `payment` VALUES (2, '2024-11-27', 0.00, 23.00, 0.00, 'Pending', '321', 2, 2);
INSERT INTO `payment` VALUES (3, '2024-11-27', 0.00, 23.00, 0.00, 'Pending', '942', 3, 2);

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
  PRIMARY KEY (`RentalID`) USING BTREE,
  INDEX `FK_Rental_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Rental_Reservation`(`ReservationID` ASC) USING BTREE,
  CONSTRAINT `FK_Rental_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Rental_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES (1, '2024-09-05', '2024-09-07', '2024-09-07', 450.00, 103.50, 553.50, 1, 4, 0.00, 0.00);
INSERT INTO `rental` VALUES (2, '2024-01-15', '2024-01-30', '2024-01-30', 1650.00, 379.50, 2029.50, 2, 5, 0.00, 0.00);
INSERT INTO `rental` VALUES (3, '2024-11-04', '2024-11-08', '2024-11-08', 9000.00, 161.00, NULL, 3, 1, 0.00, 0.00);

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
-- Table structure for vehicletype
-- ----------------------------
DROP TABLE IF EXISTS `vehicletype`;
CREATE TABLE `vehicletype`  (
  `VehicleTypeID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Category` enum('A','B','C','D','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `SeatingCapacity` smallint(2) UNSIGNED NOT NULL,
  `LuggageCapacity` smallint(2) UNSIGNED NULL DEFAULT NULL,
  `TransmissionType` enum('Automatic','Manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `MinimumDrivingExperience` smallint(2) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`VehicleTypeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicletype
-- ----------------------------
INSERT INTO `vehicletype` VALUES (1, 'A', 'Auto kompaktowe', 4, 200, 'Manual', 0);
INSERT INTO `vehicletype` VALUES (2, 'B', 'Auto średnie', 5, 400, 'Manual', 1);
INSERT INTO `vehicletype` VALUES (3, 'C', 'SUV', 5, 500, 'Automatic', 2);
INSERT INTO `vehicletype` VALUES (4, 'D', 'Luksusowy sedan', 5, 450, 'Automatic', 3);
INSERT INTO `vehicletype` VALUES (5, 'E', 'Miniwan', 7, 650, 'Automatic', 4);
INSERT INTO `vehicletype` VALUES (6, 'A', 'Mały hatchback', 4, 150, 'Manual', 0);
INSERT INTO `vehicletype` VALUES (7, 'B', 'Sedan', 5, 350, 'Manual', 1);
INSERT INTO `vehicletype` VALUES (8, 'C', 'Duży SUV', 7, 600, 'Automatic', 2);
INSERT INTO `vehicletype` VALUES (9, 'D', 'Luksusowy coupe', 2, 100, 'Automatic', 3);
INSERT INTO `vehicletype` VALUES (10, 'E', 'Minibus', 9, 700, 'Manual', 5);

-- ----------------------------
-- View structure for v_ActiveReservations
-- ----------------------------
DROP VIEW IF EXISTS `v_ActiveReservations`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_ActiveReservations` AS select `res`.`ReservationID` AS `ReservationID`,`res`.`ReservationDate` AS `ReservationDate`,`res`.`PickupDate` AS `PickupDate`,`res`.`ReturnDate` AS `ReturnDate`,`c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`c`.`Email` AS `Email`,`rc`.`CarID` AS `CarID`,`car`.`Make` AS `Make`,`car`.`Model` AS `Model`,`car`.`LicensePlateNumber` AS `LicensePlateNumber` from (((`reservation` `res` join `customer` `c` on(`res`.`CustomerID` = `c`.`CustomerID`)) join `reservationcar` `rc` on(`res`.`ReservationID` = `rc`.`ReservationID`)) join `car` on(`rc`.`CarID` = `car`.`CarID`)) where `res`.`ReservationStatus` = 'Active' and `res`.`PickupDate` >= curdate() order by `res`.`PickupDate`;

-- ----------------------------
-- View structure for v_AvailableCars
-- ----------------------------
DROP VIEW IF EXISTS `v_AvailableCars`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_AvailableCars` AS select `c`.`CarID` AS `CarID`,`c`.`LicensePlateNumber` AS `LicensePlateNumber`,`c`.`Make` AS `Make`,`c`.`Model` AS `Model`,`c`.`Year` AS `Year`,`c`.`Color` AS `Color`,`c`.`DailyRate` AS `DailyRate`,`vt`.`Category` AS `VehicleCategory`,`vt`.`TransmissionType` AS `TransmissionType`,group_concat(distinct `f`.`FeatureName` separator ', ') AS `Features`,group_concat(distinct `a`.`AmenityName` separator ', ') AS `Amenities` from (((((`car` `c` join `vehicletype` `vt` on(`c`.`VehicleTypeID` = `vt`.`VehicleTypeID`)) left join `carfeature` `cf` on(`c`.`CarID` = `cf`.`CarID`)) left join `feature` `f` on(`cf`.`FeatureID` = `f`.`FeatureID`)) left join `caramenity` `ca` on(`c`.`CarID` = `ca`.`CarID`)) left join `amenity` `a` on(`ca`.`AmenityID` = `a`.`AmenityID`)) where `c`.`CarStatus` = 'Available' group by `c`.`CarID`;

-- ----------------------------
-- View structure for v_CarUtilityStats
-- ----------------------------
DROP VIEW IF EXISTS `v_CarUtilityStats`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_CarUtilityStats` AS select `car`.`CarID` AS `CarID`,`car`.`LicensePlateNumber` AS `LicensePlateNumber`,`car`.`Make` AS `Make`,`car`.`Model` AS `Model`,sum(`rc`.`RentalDuration`) AS `TotalRentalDays`,sum(`rc`.`DailyRateApplied` * `rc`.`RentalDuration`) AS `TotalRevenue` from (`car` left join `rentalcar` `rc` on(`car`.`CarID` = `rc`.`CarID`)) group by `car`.`CarID`;

-- ----------------------------
-- View structure for v_PopularCars
-- ----------------------------
DROP VIEW IF EXISTS `v_PopularCars`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_PopularCars` AS select `car`.`CarID` AS `CarID`,`car`.`LicensePlateNumber` AS `LicensePlateNumber`,`car`.`Make` AS `Make`,`car`.`Model` AS `Model`,count(`rentalcar`.`RentalID`) AS `TimesRented` from (`car` left join `rentalcar` on(`car`.`CarID` = `rentalcar`.`CarID`)) group by `car`.`CarID` order by count(`rentalcar`.`RentalID`) desc;

-- ----------------------------
-- View structure for v_RevenueByMonth
-- ----------------------------
DROP VIEW IF EXISTS `v_RevenueByMonth`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_RevenueByMonth` AS select year(`r`.`RentalDate`) AS `Year`,month(`r`.`RentalDate`) AS `Month`,sum(`r`.`TotalGrossAmount`) AS `TotalRevenue` from `rental` `r` group by year(`r`.`RentalDate`),month(`r`.`RentalDate`) order by year(`r`.`RentalDate`) desc,month(`r`.`RentalDate`) desc;

-- ----------------------------
-- View structure for v_UpcomingReservations
-- ----------------------------
DROP VIEW IF EXISTS `v_UpcomingReservations`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_UpcomingReservations` AS select `res`.`ReservationID` AS `ReservationID`,`res`.`ReservationDate` AS `ReservationDate`,`res`.`PickupDate` AS `PickupDate`,`res`.`ReturnDate` AS `ReturnDate`,`c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `CustomerFirstName`,`c`.`LastName` AS `CustomerLastName`,`c`.`Email` AS `CustomerEmail`,`car`.`CarID` AS `CarID`,`car`.`LicensePlateNumber` AS `LicensePlateNumber`,`car`.`Make` AS `Make`,`car`.`Model` AS `Model` from (((`reservation` `res` join `customer` `c` on(`res`.`CustomerID` = `c`.`CustomerID`)) join `reservationcar` `rc` on(`res`.`ReservationID` = `rc`.`ReservationID`)) join `car` on(`rc`.`CarID` = `car`.`CarID`)) where `res`.`PickupDate` between curdate() and curdate() + interval 7 day and `res`.`ReservationStatus` = 'Active' order by `res`.`PickupDate`;

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

SET FOREIGN_KEY_CHECKS = 1;
