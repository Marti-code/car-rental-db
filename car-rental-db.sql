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

 Date: 10/11/2024 16:31:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for amenity
-- ----------------------------
DROP TABLE IF EXISTS `amenity`;
CREATE TABLE `amenity`  (
  `AmenityID` int(11) NOT NULL AUTO_INCREMENT,
  `AmenityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `AmenityPrice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`AmenityID`) USING BTREE,
  UNIQUE INDEX `AmenityName`(`AmenityName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `CarID` int(11) NOT NULL AUTO_INCREMENT,
  `LicensePlateNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `VIN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Make` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Mileage` int(11) NULL DEFAULT NULL,
  `CarStatus` enum('Available','Rented','Under Maintenance') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Available',
  `VehicleTypeID` int(11) NOT NULL,
  `FuelTypeID` int(11) NOT NULL,
  `OC_DueDate` date NULL DEFAULT NULL,
  `AC_DueDate` date NULL DEFAULT NULL,
  `CanGoAbroad` tinyint(1) NOT NULL DEFAULT 0,
  `DailyRate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CarID`) USING BTREE,
  UNIQUE INDEX `LicensePlateNumber`(`LicensePlateNumber` ASC) USING BTREE,
  UNIQUE INDEX `VIN`(`VIN` ASC) USING BTREE,
  INDEX `FK_Car_VehicleType`(`VehicleTypeID` ASC) USING BTREE,
  INDEX `FK_Car_FuelType`(`FuelTypeID` ASC) USING BTREE,
  CONSTRAINT `FK_Car_FuelType` FOREIGN KEY (`FuelTypeID`) REFERENCES `fueltype` (`FuelTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Car_VehicleType` FOREIGN KEY (`VehicleTypeID`) REFERENCES `vehicletype` (`VehicleTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for caramenity
-- ----------------------------
DROP TABLE IF EXISTS `caramenity`;
CREATE TABLE `caramenity`  (
  `CarID` int(11) NOT NULL,
  `AmenityID` int(11) NOT NULL,
  PRIMARY KEY (`CarID`, `AmenityID`) USING BTREE,
  INDEX `FK_CarAmenity_Amenity`(`AmenityID` ASC) USING BTREE,
  CONSTRAINT `FK_CarAmenity_Amenity` FOREIGN KEY (`AmenityID`) REFERENCES `amenity` (`AmenityID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CarAmenity_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carfeature
-- ----------------------------
DROP TABLE IF EXISTS `carfeature`;
CREATE TABLE `carfeature`  (
  `CarID` int(11) NOT NULL,
  `FeatureID` int(11) NOT NULL,
  PRIMARY KEY (`CarID`, `FeatureID`) USING BTREE,
  INDEX `FeatureID`(`FeatureID` ASC) USING BTREE,
  CONSTRAINT `carfeature_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carfeature_ibfk_2` FOREIGN KEY (`FeatureID`) REFERENCES `feature` (`FeatureID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `DriverLicenseNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `DriverLicenseIssueDate` date NOT NULL,
  `DriverLicenseExpiryDate` date NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`) USING BTREE,
  UNIQUE INDEX `DriverLicenseNumber`(`DriverLicenseNumber` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employeerole
-- ----------------------------
DROP TABLE IF EXISTS `employeerole`;
CREATE TABLE `employeerole`  (
  `EmployeeID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `RoleID`) USING BTREE,
  INDEX `FK_EmployeeRole_Role`(`RoleID` ASC) USING BTREE,
  CONSTRAINT `FK_EmployeeRole_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EmployeeRole_Role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `FeatureID` int(11) NOT NULL AUTO_INCREMENT,
  `FeatureName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`FeatureID`) USING BTREE,
  UNIQUE INDEX `FeatureName`(`FeatureName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fueltype
-- ----------------------------
DROP TABLE IF EXISTS `fueltype`;
CREATE TABLE `fueltype`  (
  `FuelTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `FuelTypeName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`FuelTypeID`) USING BTREE,
  UNIQUE INDEX `FuelTypeName`(`FuelTypeName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `IssueDate` date NOT NULL DEFAULT curdate(),
  `DueDate` date NOT NULL,
  `TotalNetAmount` decimal(10, 2) NULL DEFAULT 0.00,
  `TotalVAT` decimal(10, 2) NULL DEFAULT 0.00,
  `TotalGrossAmount` decimal(10, 2) NULL DEFAULT 0.00,
  `InvoiceStatus` enum('Paid','Unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Unpaid',
  `CustomerID` int(11) NOT NULL,
  `NIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`) USING BTREE,
  INDEX `FK_Invoice_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_Invoice_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invoiceposition
-- ----------------------------
DROP TABLE IF EXISTS `invoiceposition`;
CREATE TABLE `invoiceposition`  (
  `InvoicePositionID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitNetPrice` decimal(10, 2) NOT NULL,
  `NetAmount` decimal(10, 2) GENERATED ALWAYS AS (`Quantity` * `UnitNetPrice`) PERSISTENT,
  `VATRate` decimal(5, 2) NOT NULL,
  `VATAmount` decimal(10, 2) GENERATED ALWAYS AS (`NetAmount` * `VATRate` / 100) PERSISTENT,
  `GrossAmount` decimal(10, 2) GENERATED ALWAYS AS (`NetAmount` + `VATAmount`) PERSISTENT,
  PRIMARY KEY (`InvoicePositionID`) USING BTREE,
  INDEX `FK_InvoicePosition_Invoice`(`InvoiceID` ASC) USING BTREE,
  CONSTRAINT `FK_InvoicePosition_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for maintenance
-- ----------------------------
DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance`  (
  `MaintenanceID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
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
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL DEFAULT curdate(),
  `AmountNet` decimal(10, 2) NOT NULL,
  `VAT` decimal(10, 2) NOT NULL,
  `AmountGross` decimal(10, 2) NOT NULL,
  `PaymentStatus` enum('Completed','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Pending',
  `TransactionID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `InvoiceID` int(11) NOT NULL,
  `PaymentMethodID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentID`) USING BTREE,
  INDEX `FK_Payment_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Payment_PaymentMethod`(`PaymentMethodID` ASC) USING BTREE,
  CONSTRAINT `FK_Payment_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Payment_PaymentMethod` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for paymentmethod
-- ----------------------------
DROP TABLE IF EXISTS `paymentmethod`;
CREATE TABLE `paymentmethod`  (
  `PaymentMethodID` int(11) NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PaymentMethodID`) USING BTREE,
  UNIQUE INDEX `MethodName`(`MethodName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`PermissionID`) USING BTREE,
  UNIQUE INDEX `PermissionName`(`PermissionName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental`  (
  `RentalID` int(11) NOT NULL AUTO_INCREMENT,
  `RentalDate` date NOT NULL DEFAULT curdate(),
  `ExpectedReturnDate` date NOT NULL,
  `ActualReturnDate` date NULL DEFAULT NULL,
  `DiscountApplied` decimal(5, 2) NULL DEFAULT 0.00,
  `TotalNetAmount` decimal(10, 2) NULL DEFAULT 0.00,
  `TotalVAT` decimal(10, 2) NULL DEFAULT 0.00,
  `TotalGrossAmount` decimal(10, 2) NULL DEFAULT 0.00,
  `InvoiceID` int(11) NULL DEFAULT NULL,
  `ReservationID` int(11) NULL DEFAULT NULL,
  `Fine` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`RentalID`) USING BTREE,
  INDEX `FK_Rental_Invoice`(`InvoiceID` ASC) USING BTREE,
  INDEX `FK_Rental_Reservation`(`ReservationID` ASC) USING BTREE,
  CONSTRAINT `FK_Rental_Invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Rental_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rentalcar
-- ----------------------------
DROP TABLE IF EXISTS `rentalcar`;
CREATE TABLE `rentalcar`  (
  `RentalID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `DailyRateApplied` decimal(10, 2) NOT NULL,
  `DiscountAppliedPercentage` decimal(5, 2) NULL DEFAULT 0.00,
  `RentalDuration` int(11) NOT NULL,
  PRIMARY KEY (`RentalID`, `CarID`) USING BTREE,
  INDEX `FK_RentalCar_Car`(`CarID` ASC) USING BTREE,
  CONSTRAINT `FK_RentalCar_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RentalCar_Rental` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rentalcustomer
-- ----------------------------
DROP TABLE IF EXISTS `rentalcustomer`;
CREATE TABLE `rentalcustomer`  (
  `RentalID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`RentalID`, `CustomerID`) USING BTREE,
  INDEX `FK_RentalCustomer_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_RentalCustomer_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RentalCustomer_Rental` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `ReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `ReservationDate` date NOT NULL DEFAULT curdate(),
  `PickupDate` date NOT NULL,
  `ReturnDate` date NOT NULL,
  `ReservationStatus` enum('Active','Cancelled','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT 'Active',
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`) USING BTREE,
  INDEX `FK_Reservation_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reservationcar
-- ----------------------------
DROP TABLE IF EXISTS `reservationcar`;
CREATE TABLE `reservationcar`  (
  `ReservationID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`, `CarID`) USING BTREE,
  INDEX `FK_ReservationCar_Car`(`CarID` ASC) USING BTREE,
  CONSTRAINT `FK_ReservationCar_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ReservationCar_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reservationcustomer
-- ----------------------------
DROP TABLE IF EXISTS `reservationcustomer`;
CREATE TABLE `reservationcustomer`  (
  `ReservationID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`, `CustomerID`) USING BTREE,
  INDEX `FK_ReservationCustomer_Customer`(`CustomerID` ASC) USING BTREE,
  CONSTRAINT `FK_ReservationCustomer_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ReservationCustomer_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`RoleID`) USING BTREE,
  UNIQUE INDEX `RoleName`(`RoleName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `RoleID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`, `PermissionID`) USING BTREE,
  INDEX `FK_RolePermission_Permission`(`PermissionID` ASC) USING BTREE,
  CONSTRAINT `FK_RolePermission_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RolePermission_Role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicletype
-- ----------------------------
DROP TABLE IF EXISTS `vehicletype`;
CREATE TABLE `vehicletype`  (
  `VehicleTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` enum('A','B','C','D','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `SeatingCapacity` int(11) NOT NULL,
  `LuggageCapacity` int(11) NULL DEFAULT NULL,
  `TransmissionType` enum('Automatic','Manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  `MinimumDrivingExperience` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`VehicleTypeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_uca1400_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
