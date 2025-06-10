-- Create schema
CREATE SCHEMA IF NOT EXISTS crm;
ALTER DATABASE mydb SET datestyle = 'ISO, DMY';


-- 1. customer_information
CREATE TABLE crm.customer_information (
    customer_id             VARCHAR(100) PRIMARY KEY,
    email_address           VARCHAR(255) NOT NULL,
    contact_number          VARCHAR(25),
    customer_suburb         VARCHAR(100),
    customer_zip_code       VARCHAR(10),
    db_update_date          TIMESTAMP,
    insurance_expiry_date   DATE,
    original_source         VARCHAR(100),
    insurance_status        VARCHAR(50)
);
-- 2. crm_contact_log_1
CREATE TABLE crm.crm_contact_log_1 (
    customer_id             VARCHAR(100) NOT NULL,
    contact_date            DATE NOT NULL,
    contact_type            VARCHAR(100)
);

-- 3. crm_contact_log_2
CREATE TABLE crm.crm_contact_log_2 (
    customer_id             VARCHAR(100) NOT NULL,
    contact_date            DATE NOT NULL,
    contact_type            VARCHAR(100)
);
-- 4. log_tracking_completed_file
CREATE TABLE crm.log_tracking_completed_file (
    customer_id                 VARCHAR(100) NOT NULL,
    parent_product              VARCHAR(100),
    claim_date                  DATE,
    documentation_date          DATE,
    status                      VARCHAR(50),
    claim_category              VARCHAR(100),
    claim_tracking_number       VARCHAR(100),
    vendor_id                   INT,
    storage_fee                 NUMERIC(10,2),
    insurance_amount            NUMERIC(10,2),
    holding_fee                 NUMERIC(10,2),
    total_acquisition_cost      NUMERIC(12,2)
);
