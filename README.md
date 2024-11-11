# Car Rental Database ![Status](https://img.shields.io/badge/status-ONGOING-brightgreen)

Database schema designed for a car rental service, developed as part of a university assignment.

## Description

The project captures key aspects of a real-world car rental business, including cars, customers, rentals, and additional amenities. The schema is built to ensure data integrity, support scalability, and streamline operations within the rental service domain. 

## Features
### Entity-Relationship Design:
- Cars: Stores information about each car, such as model, type, and availability.
- Customers: Manages customer information, including contact details and rental history.
- Rentals: Tracks rental transactions, linking customers and cars along with rental dates, durations, and prices.
- Amenities: Supports optional amenities that customers can add to their rentals, like GPS, child seats, etc.
- Billing: Organizes billing details, including pricing for car rentals and additional services.
### Database Design Principles:
- The schema is normalized to eliminate redundancy and ensure data consistency.
- Indexing is used on key fields to improve query performance, and primary and foreign key constraints enforce data integrity.
- Scalability considerations are in place to accommodate future expansion of the schema.

## How to use
### Prerequisites
- MariaDB 10.6 or compatible versions

### Example queries
- Retrieve available cars: SELECT * FROM Cars WHERE Status = 'Available';
- More to be added…

## Future Improvements
- Indexing: Introduce and optimize indexes to improve query performance
- Triggers: Implement triggers to automate specific tasks
- User Roles & Permissions: Enhance security by defining roles and permissions
- Test Data & Thorough Testing: Populate the database with test data
- Documentation: Do the documentation
- Views & Stored Procedures: Implement views and procedures for common operations

<img src="https://github.com/github/explore/raw/main/topics/github/github.png" alt=" " height="50">
<img src="https://github.com/github/explore/raw/main/topics/github/github.png" alt=" " height="50">

