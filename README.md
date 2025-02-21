# Car Rental Database 🚗

Database schema designed for a car rental service, developed as part of a university assignment.

## Description

The project captures key aspects of a real-world car rental business, including cars, customers, rentals, and additional amenities. The schema is built to ensure data integrity, support scalability, and streamline operations within the rental service domain.

## Features

### Entity-Relationship Design:

- Cars: Stores detailed car information, including model, make, type, status, mileage, and availability.
- Customers: Manages customer details such as personal information, driver's license, and rental history.
- Rentals: Tracks rental transactions, connecting customers with cars while storing rental dates, durations, pricing, and discounts.
- Reservations: Allows customers to reserve vehicles before the rental period.
- Amenities: Supports optional add-ons like GPS, child seats, insurance options, etc.
- Billing & Payments: Organizes invoices, VAT calculations, payment processing, and status tracking.
- Employees & Roles: Implements user roles, permissions, and login security for rental employees.
- Maintenance Tracking: Logs maintenance history and ensures vehicle service schedules are followed.

### Database Design Principles:

- Normalized Schema: Reduces redundancy and maintains data consistency.
- Performance Optimization: Uses indexes, partitioning, and optimized queries to enhance performance.
- Data Integrity: Enforces foreign keys, constraints, and transactions to prevent data inconsistencies.
- Automation: Implements triggers and stored procedures for key processes like invoice generation and rental validation.

## Key Implementations

### Functions & Procedures

- IsCarAvailable() → Returns 'Available' or 'Not Available'.
- CalculateDiscountAmount() → Computes applicable rental discounts.
- AddRental() → Adds a new rental transaction with automatic pricing and discounts.
- AddReservation() → Adds a new reservation transaction.
- GenerateInvoiceWithAddresses() → Generates an invoice including both company and customer addresses.
- ExtendRentalTime() → Allows extending an active rental while ensuring availability.
- SettlePayment() → Registers payments and updates invoice status accordingly.

### Triggers

- Audit Logging: Logs updates and deletions in audit tables for payments, employees, rentals, and invoices.
- Password Security: Prevents employees from using the same password upon update.
- Auto-Update Status: Automatically updates car availability, invoice payment status, and reservation status.
- Validate Rental Dates: Ensures rental periods do not overlap using the IsCarAvailable() function.

### Views for Reporting & Insights

- v_UpcomingMaintenance → Lists cars scheduled for upcoming maintenance.
- v_CarsCountRentedByMonth → Shows the number of rentals per month.
- v_TopCustomers → Ranks customers based on total rentals.
- v_CarRevenue → Tracks total revenue generated by each car.
- v_RevenueByMonth → Aggregates monthly rental revenue.
- v_PopularCars → Identifies the most rented vehicles.
