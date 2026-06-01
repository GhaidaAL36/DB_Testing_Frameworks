-- create database
CREATE DATABASE employee_management;
USE employee_management;

-- create tables
CREATE TABLE Role
(
    role_id     INT AUTO_INCREMENT PRIMARY KEY,
    role        VARCHAR(24),
    description VARCHAR(128)
);

CREATE TABLE Department
(
    department_id   INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(24),
    manager_id      INT
);

CREATE TABLE Employee
(
    employee_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(24) NOT NULL,
    last_name     VARCHAR(24) NOT NULL,
    email         VARCHAR(30) NOT NULL UNIQUE,
    phone         VARCHAR(10),
    join_date     DATE,
    department_id INT,
    role_id       INT,
    is_active     BOOLEAN,

    CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES Department (department_id),
    CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES Role (role_id)
);

CREATE TABLE Salary
(
    salary_id      INT AUTO_INCREMENT PRIMARY KEY,
    employee_id    INT,
    amount         DECIMAL(10, 2),
    effective_date DATE,

    CONSTRAINT fk_salary_employee FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

CREATE TABLE Attendance
(
    attendance_id   INT AUTO_INCREMENT PRIMARY KEY,
    employee_id     INT,
    status          VARCHAR(10) CHECK (status IN ('present', 'absent', 'late')),
    attendance_date DATE,
    check_in        TIME,
    check_out       TIME,

    CONSTRAINT fk_attendance_employee FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

