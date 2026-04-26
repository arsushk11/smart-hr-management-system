CREATE DATABASE smart_hr_system;
USE smart_hr_system;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    dept_head VARCHAR(100),
    location VARCHAR(100),
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO departments (dept_name, dept_head, location) VALUES
('IT', 'Mr. Salman Khan', 'Floor 3'),
('HR', 'Ms. Ayesha Siddiqui', 'Floor 1'),
('Finance', 'Mr. Tariq Mahmood', 'Floor 2'),
('Sales', 'Ms. Nadia Hussain', 'Floor 4'),
('Operations', 'Mr. Bilal Chaudary', 'Floor 2');

SELECT * FROM departments;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    dept_id INT,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    join_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    city VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees
(full_name, email, phone, dept_id, designation, salary, join_date, city)
VALUES
('Ahmad Raza', 'ahmad@company.com', '03000', 1, 'Senior Developer', 75000, '2020-03-15', 'Kalyan'),
('Sara Malik', 'sara@company.com', '03111', 2, 'HR Manager', 65000, '2019-07-01', 'Thane'),
('Bilal Khan', 'bilal@company.com', '03222', 3, 'Accountant', 55000, '2021-01-10', 'Mulund'),
('Ayesha Noor', 'ayesha@company.com', '03333', 1, 'Junior Developer', 45000, '2020-06-20', 'Dadar'),
('Usman Ali', 'usman@company.com', '03444', 4, 'Sales Executive', 50000, '2020-11-05', 'Bhiwandi'),
('Fatima Shah', 'fatima@company.com', '03555', 1, 'DBA', 70000, '2019-04-12', 'Mira Road'),
('Zain Ahmed', 'zain@company.com', '03007777777', 5, 'Operations Manager', 80000, '2018-09-01', 'Kurla'),
('Hina Mir', 'hina@company.com', '03008888888', 2, 'HR Executive', 42000, '2022-02-14', 'Airoli'),
('Omar Farooq', 'omar@company.com', '03009999999', 4, 'Senior Sales', 60000, '2020-08-30', 'Panvel'),
('Mariam Khan', 'mariam@company.com', '03001010101', 3, 'Finance Manager', 72000, '2019-12-01', 'Mumbra');

SELECT * FROM employees;

CREATE TABLE attendance (
	att_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    att_date DATE,
    status VARCHAR(20),
    check_in TIME,
    check_out TIME,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance (emp_id, att_date, status, check_in, check_out) VALUES
(21, '2024-01-15', 'Present', '09:00:00', '18:00:00'),
(22, '2024-01-15', 'Present', '09:15:00', '17:45:00'),
(23, '2024-01-15', 'Absent', NULL, NULL),
(24, '2024-01-15', 'Present', '09:30:00', '18:30:00'),
(25, '2024-01-15', 'Late', '10:30:00', '18:00:00'),
(26, '2024-01-15', 'Present', '08:45:00', '17:30:00'),
(27, '2024-01-15', 'Present', '09:00:00', '18:00:00'),
(28, '2024-01-15', 'Absent', NULL, NULL),
(29, '2024-01-15', 'Present', '09:20:00', '17:50:00'),
(30, '2024-01-15', 'Late', '11:00:00', '19:00:00'),
(21, '2024-01-16', 'Present', '09:00:00', '18:00:00'),
(22, '2024-01-16', 'Absent', NULL, NULL),
(23, '2024-01-16', 'Present', '09:10:00', '17:40:00'),
(24, '2024-01-16', 'Present', '09:00:00', '18:00:00'),
(25, '2024-01-16', 'Present', '09:05:00', '17:55:00');

SELECT * FROM attendance;

CREATE TABLE leave_requests (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason TEXT,
    status VARCHAR(20) DEFAULT 'Pending',
    applied_on DATETIME DEFAULT NOW(),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO leave_requests
(emp_id, leave_type, start_date, end_date, reason, status) VALUES
(21, 'Casual', '2024-01-20', '2024-01-21', 'Personal work', 'Approved'),
(23, 'Medical', '2024-01-18', '2024-01-22', 'Hospital treatment', 'Approved'),
(25, 'Annual', '2024-02-01', '2024-02-07', 'Family vacation', 'Pending'),
(28, 'Casual', '2024-01-25', '2024-01-25', 'Home emergency', 'Pending'),
(22, 'Medical', '2024-01-30', '2024-02-02', 'Surgery recovery', 'Approved'),
(27, 'Annual', '2024-03-10', '2024-03-17', 'Travel plans', 'Rejected'),
(24, 'Casual', '2024-01-19', '2024-01-19', 'Personal errand', 'Approved');

SELECT * FROM leave_requests;

CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    month_year VARCHAR(20),
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2) DEFAULT 0,
    deductions DECIMAL(10,2) DEFAULT 0,
    net_salary DECIMAL(10,2),
    paid_on DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO payroll
(emp_id, month_year, basic_salary, bonus, deductions, net_salary, paid_on) VALUES
(21, 'January-2024', 75000, 5000, 2000, 78000, '2024-01-31'),
(22, 'January-2024', 65000, 0, 1500, 63500, '2024-01-31'),
(23, 'January-2024', 55000, 0, 3000, 52000, '2024-01-31'),
(24, 'January-2024', 45000, 2000, 1000, 46000, '2024-01-31'),
(25, 'January-2024', 50000, 3000, 500, 52500, '2024-01-31'),
(26, 'January-2024', 70000, 5000, 2000, 73000, '2024-01-31'),
(27, 'January-2024', 80000, 10000, 3000, 87000, '2024-01-31'),
(28, 'January-2024', 42000, 0, 1000, 41000, '2024-01-31'),
(29, 'January-2024', 60000, 4000, 1500, 62500, '2024-01-31'),
(30, 'January-2024', 72000, 5000, 2500, 74500, '2024-01-31');

SELECT * FROM payroll;

CREATE VIEW employee_directory AS
SELECT
    e.emp_id,
    e.full_name AS employee_name,
    e.designation,
    d.dept_name AS department,
    d.dept_head,
    e.salary,
    e.city,
    e.status,
    e.join_date
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.full_name;

SELECT * FROM employee_directory;

CREATE VIEW payroll_summary AS
SELECT
    e.full_name AS employee_name,
    d.dept_name AS department,
    p.month_year,
    p.basic_salary,
    p.bonus,
    p.deductions,
    p.net_salary,
    CASE
        WHEN p.net_salary >= 70000 THEN 'High'
        WHEN p.net_salary >= 50000 THEN 'Medium'
        ELSE 'Standard'
    END AS salary_band
FROM payroll p
INNER JOIN employees e ON p.emp_id = e.emp_id
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY p.net_salary DESC;

SELECT * FROM payroll_summary;

CREATE VIEW attendance_report AS
SELECT
    e.full_name AS employee_name,
    d.dept_name AS department,
    a.att_date,
    a.status AS attendance_status,
    a.check_in,
    a.check_out
FROM attendance a
INNER JOIN employees e ON a.emp_id = e.emp_id
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY a.att_date, d.dept_name;

SELECT * FROM attendance_report;

CREATE VIEW leave_status_view AS
SELECT
    e.full_name AS employee_name,
    d.dept_name AS department,
    lr.leave_type,
    lr.start_date,
    lr.end_date,
    DATEDIFF(lr.end_date, lr.start_date) + 1 AS total_days,
    lr.reason,
    lr.status AS leave_status
FROM leave_requests lr
INNER JOIN employees e ON lr.emp_id = e.emp_id
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY lr.applied_on DESC;

SELECT * FROM leave_status_view;

DELIMITER $$

CREATE PROCEDURE get_department_summary(IN dept_name VARCHAR(100))
BEGIN
    -- Department info
    SELECT
        d.dept_name,
        d.dept_head,
        COUNT(e.emp_id) AS total_employees,
        ROUND(AVG(e.salary), 2) AS avg_salary,
        MAX(e.salary) AS max_salary,
        MIN(e.salary) AS min_salary
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id
    WHERE d.dept_name = dept_name
    GROUP BY d.dept_name, d.dept_head;

    -- Employees in department
    SELECT
        full_name,
        designation,
        salary,
        city,
        join_date
    FROM employee_directory
    WHERE department = dept_name
    ORDER BY salary DESC;
END$$

DELIMITER ;

CALL get_department_summary('IT');
CALL get_department_summary('Finance');

DELIMITER $$

CREATE PROCEDURE get_pending_leaves()
BEGIN
    SELECT
        employee_name,
        department,
        leave_type,
        start_date,
        end_date,
        total_days,
        reason
    FROM leave_status_view
    WHERE leave_status = 'Pending'
    ORDER BY start_date ASC;
END$$

DELIMITER ;

CALL get_pending_leaves();

DELIMITER $$

CREATE PROCEDURE get_employee_profile(IN employee_name VARCHAR(100))
BEGIN
    -- Basic Info
    SELECT
        e.full_name,
        e.email,
        e.phone,
        e.designation,
        d.dept_name,
        e.salary,
        e.join_date,
        e.city,
        e.status
    FROM employees e
    INNER JOIN departments d ON e.dept_id = d.dept_id
    WHERE e.full_name = employee_name;

    -- Latest Payroll
    SELECT
        month_year,
        basic_salary,
        bonus,
        deductions,
        net_salary
    FROM payroll_summary
    WHERE employee_name = employee_name;

    -- Leave History
    SELECT
        leave_type,
        start_date,
        end_date,
        total_days,
        leave_status
    FROM leave_status_view
    WHERE employee_name = employee_name;
END$$

DELIMITER ;

CALL get_employee_profile('Ahmed Raza');
CALL get_employee_profile('Fatima Shah');

CREATE TABLE hr_audit_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    action_type VARCHAR(50),
    table_name VARCHAR(50),
    record_id INT,
    description TEXT,
    action_time DATETIME DEFAULT NOW()
);

DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO hr_audit_log
    (action_type, table_name, record_id, description)
    VALUES
    (
        'NEW HIRE',
        'employees',
        NEW.emp_id,
        CONCAT(NEW.full_name, ' joined as ', NEW.designation, ' with salary ', NEW.salary)
    );
END$$

DELIMITER ;

INSERT INTO employees
(full_name, email, phone, dept_id, designation, salary, join_date, city)
VALUES
('Arsalan Shaikh', 'arsalan@company.com', '03001234567',
1, 'Junior DBA', 48000, '2024-01-15', 'Bhiwandi');

-- Trigger automatically log 
SELECT * FROM hr_audit_log;

DELIMITER $$

CREATE TRIGGER after_salary_change
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO hr_audit_log
        (action_type, table_name, record_id, description)
        VALUES
        (
            'SALARY UPDATE',
            'employees',
            NEW.emp_id,
            CONCAT(
                NEW.full_name,
                ' salary changed from ',
                OLD.salary,
                ' to ',
                NEW.salary
            )
        );
    END IF;
END$$

DELIMITER ;

UPDATE employees SET salary = 52000
WHERE full_name = 'Arsalan Shaikh';

SELECT * FROM hr_audit_log;

DELIMITER $$

CREATE TRIGGER after_leave_insert
AFTER INSERT ON leave_requests
FOR EACH ROW
BEGIN
    INSERT INTO hr_audit_log
    (action_type, table_name, record_id, description)
    VALUES
    (
        'LEAVE APPLIED',
        'leave_requests',
        NEW.leave_id,
        CONCAT(
            'Employee ID ', NEW.emp_id,
            ' applied for ', NEW.leave_type,
            ' leave from ', NEW.start_date,
            ' to ', NEW.end_date
        )
    );
END$$

DELIMITER ;


-- Department Wise Payroll
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(net_salary) AS total_payroll,
    ROUND(AVG(net_salary), 2) AS avg_net_salary,
    MAX(net_salary) AS highest_salary,
    MIN(net_salary) AS lowest_salary
FROM payroll_summary
GROUP BY department
ORDER BY total_payroll DESC;

-- Attendance Summary
SELECT
    department,
    COUNT(*) AS total_records,
    SUM(CASE WHEN attendance_status = 'Present' THEN 1 ELSE 0 END) AS present_days,
    SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) AS absent_days,
    SUM(CASE WHEN attendance_status = 'Late' THEN 1 ELSE 0 END) AS late_days
FROM attendance_report
GROUP BY department
ORDER BY absent_days DESC;

-- Leave Analysis
SELECT
    department,
    leave_type,
    COUNT(*) AS total_requests,
    SUM(total_days) AS total_days_requested,
    SUM(CASE WHEN leave_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN leave_status = 'Pending' THEN 1 ELSE 0 END) AS pending,
    SUM(CASE WHEN leave_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected
FROM leave_status_view
GROUP BY department, leave_type
ORDER BY department;

-- Top Earners
SELECT
    employee_name,
    department,
    net_salary,
    salary_band,
    RANK() OVER (ORDER BY net_salary DESC) AS salary_rank
FROM payroll_summary;

-- Complete HR Dashboard Query
SELECT
    'Total Employees' AS metric,
    COUNT(*) AS value
FROM employees
WHERE status = 'Active'

UNION ALL

SELECT
    'Total Monthly Payroll',
    SUM(net_salary)
FROM payroll
WHERE month_year = 'January-2024'

UNION ALL

SELECT
    'Pending Leaves',
    COUNT(*)
FROM leave_requests
WHERE status = 'Pending'

UNION ALL

SELECT
    'Absent Today',
    COUNT(*)
FROM attendance
WHERE status = 'Absent'
AND att_date = '2024-01-15';