-- 28/1/2021
-- Question 1
CREATE TABLE countries(
    country_id varchar (10),
    country_name varchar (100),
    region_id number ,
);

-- Question 2
CREATE TABLE IF NOT EXISTS countries(
    country_id varchar (10),
    country_name varchar (100),
    region_id number ,
);

-- Question 3
CREATE TABLE IF NOT EXISTS dup_countries LIKE countries;

-- Question 4
CREATE TABLE IF NOT EXISTS dup_countries AS SELECT * FROM countries;

-- Question 5
CREATE TABLE countries(
    country_id varchar (10) NOT NULL,
    country_name varchar (100) NOT NULL,
    region_id number NOT NULL,
);

-- Question 6
CREATE TABLE IF NOT EXISTS jobs (
    job_id varchar (10) NOT NULL,
    job_title varchar (100) NOT NULL,
    min_salary decimal (10, 0),
    max_salary decimal (10, 0)
    CHECK (max_salary <= 25000)
);

-- Question 7
CREATE TABLE IF NOT EXISTS countries (
    country_id varchar (10),
    country_name varchar (100),
    CHECK (country_name IN('italy', 'india', 'china')),
    region_id decimal (20, 0),
);

-- Question 8
CREATE TABLE IF NOT EXISTS jobs_history (
    emoloyee_id varchar (10) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CHECK (end_date LIKE '--/--/----'),
    job_id varchar (10) NOT NULL,
    department_id varchar (10) NOT NULL,
);

-- Question 9
CREATE TABLE IF NOT EXISTS countries (
    country_id varchar (10) NOT NULL UNIQUE,
    country_name varchar (100) NOT NULL,
    region_id varchar (10) NOT NULL,
);

-- Question 10
CREATE TABLE IF NOT EXISTS job (
    job_id varchar (10) NOT NULL,
    job_title varchar (100) NOT NULL DEFAULT ' ',
    min_salary decimal (10, 0) DEFAULT 8000,
    max_salary decimal (10, 0) DEFAULT NULL
);

-- Question 11
CREATE TABLE IF NOT EXISTS countries (
    country_id varchar (10) NOT NULL UNIQUE PRIMARY KEY,
    country_name varchar (100) NOT NULL,
    region_id varchar (10) NOT NULL,
    UNIQUE (country_id)
);

-- Question 12
CREATE TABLE IF NOT EXISTS countries (
    country_id varchar (10) NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMNT,
    country_name varchar (100) NOT NULL,
    region_id varchar (10) NOT NULL,
    UNIQUE (country_id)
);

-- Question 13
CREATE TABLE IF NOT EXISTS countries (
    country_id varchar (10) NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMNT,
    country_name varchar (100) NOT NULL,
    region_id varchar (10) NOT NULL UNIQUE,
    UNIQUE (country_id)
);

-- Question 14
CREATE TABLE IF NOT EXISTS job_history (
    employee_id varchar (10) NOT NULL PRIMARY KEY,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id varchar (10) NOT NULL,
    department_id decimal (10, 0) DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES  jobs(job_id)
);

-- Question 15
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar (10) NOT NULL PRIMARY KEY,
    first_name varchar(20) DEFAULT NULL,
    last_name varchar(25) NOT NULL,
    email varchar(25) NOT NULL,
    phonenumber varchar(20) DEFAULT NULL,
    hire_date date NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(8,2) DEFAULT NULL,
    commission decimal(3,3) DEFAULT NULL,
    manager_id varchar (10) DEFAULT NULL,
    department_id varchar (10) DEFAULT NULL,
    FOREIGN KEY (manager_id, department_id) REFERENCES departments (manager_id, department_id)
);

-- Question 16
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar (10) NOT NULL PRIMARY KEY,
    first_name varchar(50) DEFAULT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phonenumber varchar(10) DEFAULT NULL,
    hire_date date NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(10,0) DEFAULT NULL,
    commession decimal(3,3) DEFAULT NULL,
    manager_id varchar (10) DEFAULT NULL,
    department_id varchar (10) DEFAULT NULL,
    FOREIGN KEY(job_id) REFERENCES  jobs(job_id),
    FOREIGN KEY(department_id) REFERENCES  departments(department_id),
)ENGINE=InnoDB;

-- Question 17
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar (10) NOT NULL PRIMARY KEY,
    first_name varchar(50) DEFAULT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phonenumber varchar(10) DEFAULT NULL,
    hire_date date NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(10,0) DEFAULT NULL,
    commession decimal(3,3) DEFAULT NULL,
    manager_id varchar (10) DEFAULT NULL,
    department_id varchar (10) DEFAULT NULL,
    FOREIGN KEY(job_id) REFERENCES  jobs(job_id) ON UPDATE CASCADE ON DELETE RESTRICT ,
    FOREIGN KEY(department_id) REFERENCES  departments(department_id),
)ENGINE=InnoDB;

-- Question 18
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar(10) NOT NULL PRIMARY KEY,
    first_name varchar(20) DEFAULT NULL,
    last_name varchar(25) NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(10, 0) DEFAULT NULL,
    FOREIGN KEY(job_id) REFERENCES  jobs(job_id) ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB;

-- Question 19
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar(10) NOT NULL PRIMARY KEY,
    first_name varchar(20) DEFAULT NULL,
    last_name varchar(25) NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(10, 0) DEFAULT NULL,
    FOREIGN KEY(JOB_ID) REFERENCES  jobs(JOB_ID) ON DELETE SET NULL ON UPDATE SET NULL
)ENGINE=InnoDB;

-- Question 20
CREATE TABLE IF NOT EXISTS employees (
    employee_id varchar(10) NOT NULL PRIMARY KEY,
    first_name varchar(20) DEFAULT NULL,
    last_name varchar(25) NOT NULL,
    job_id varchar(10) NOT NULL,
    salary decimal(10, 0) DEFAULT NULL,
    FOREIGN KEY(JOB_ID) REFERENCES  jobs(JOB_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB;