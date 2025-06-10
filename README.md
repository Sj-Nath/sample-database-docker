# Sample database creation from csv file

This project sets up a PostgreSQL database environment with schemas and tables for managing CRM data and bike sales data (which can be extended to any other imports). It also includes tools for database administration and data initialization.

## Project Structure

- **`compose.yaml`**: Docker Compose file to set up PostgreSQL, pgAdmin, and Adminer services.
- **`init-db/init.sh`**: Script to initialize the database with schemas and data from CSV files.
- **`data/crm_data/schema.sql`**: SQL file defining the schema for CRM data.
- **`data/bike_sales/schema.sql`**: SQL file defining the schema for bike sales data.

## Prerequisites

- Docker and Docker Compose installed on your system.

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Sj-Nath/sample-database-docker.git
   cd sample-database-docker
   ```

2. Start the services using Docker Compose:
   ```bash
   docker-compose up
   ```

3. Wait till all services are running & Verify:
   - PostgreSQL: Accessible on port `5433`.
   - pgAdmin: Accessible at `http://localhost:5051` (default email: `pgadmin4@pgadmin.org`, password: `admin`).
   - Adminer: Accessible at `http://localhost:8081`.

## Folder Structure for Data Initialization

- Each folder under `data-folders` should represent a dataset (e.g., `crm_data`, `bike_sales`).
- Each folder should contain:
  - `schema.sql`: SQL file defining the schema.
  - `<schma>.<table_name>.csv`: CSV files for each table defined in the schema.

## Example Folder Structure

```
data-folders/
├── bike_sales
│   ├── production.brands.csv
│   ├── production.categories.csv
│   ├── production.products.csv
│   ├── production.stocks.csv
│   ├── sales.customers.csv
│   ├── sales.order_items.csv
│   ├── sales.orders.csv
│   ├── sales.staffs.csv
│   ├── sales.stores.csv
│   └── schema.sql
└── crm_data
    ├── crm.crm_contact_log_1.csv
    ├── crm.crm_contact_log_2.csv
    ├── crm.customer_information.csv
    ├── crm.log_tracking_completed_file.csv
    └── schema.sql
```

## Services Overview

### PostgreSQL
- **Port**: `5433`
- **Default Credentials**:
  - User: `postgres`
  - Password: `changeme`
  - Database: `mydb`

### pgAdmin
- **URL**: `http://localhost:5051`
- **Default Credentials**:
  - Email: `pgadmin4@pgadmin.org`
  - Password: `admin`

### Adminer
- **URL**: `http://localhost:8081`

## Troubleshooting

- If the database initialization fails, check the logs of the `postgres` container:
  ```bash
  docker logs postgres_container
  ```

- Ensure that the schema and CSV files are correctly formatted and placed in the appropriate folders.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
