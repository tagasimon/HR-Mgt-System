# DFCU HR Management System

This repository contains two projects:
1. **API**: A RESTful API for managing employee data.
2. **Flutter Project**: A cross-platform mobile (Android/iOS) and web application that consumes the API.

## Table of Contents
- [DFCU HR Management System](#dfcu-hr-management-system)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [API Project](#api-project)
    - [Endpoints Overview](#endpoints-overview)
  - [Flutter Project](#flutter-project)
    - [Platforms Supported](#platforms-supported)


## Overview

- **API**: The API serves as the backend of the HR Management System, allowing for operations like registering new employees, fetching employee data, and updating employee details.
- **Flutter App**: The Flutter application interacts with the API, providing a user-friendly interface to manage employee records on mobile devices (Android/iOS) and the web.

## API Project

- **URL**: [https://hr-mgt-system.onrender.com](https://hr-mgt-system.onrender.com)
- The API allows for:
  - Registering a new staff member.
  - Fetching details of all employees or a specific employee.
  - Updating an employee's details.

### Endpoints Overview
| Endpoint                          | Method | Description                                      |
|-----------------------------------|--------|--------------------------------------------------|
| `/api/register`                   | POST   | Registers a new staff member.                    |
| `/api/staff`                      | GET    | Retrieves employee data.                         |
| `/api/staff/<employee_number>`    | PUT    | Updates details of a specific employee.          |

For detailed API documentation, visit the live API link above.

## Flutter Project

The Flutter project is a mobile and web client that interacts with the HR Management API. It provides the following features:
- **Register Employee**: Add a new employee using a simple form.
- **View Employee Data**: Browse all registered employees or search for specific employee details.
- **Update Employee**: Modify details of existing employees.

### Platforms Supported
- **Mobile**: Android and iOS
- **Web**: Browser-based application
