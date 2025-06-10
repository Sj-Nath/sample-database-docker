#!/bin/bash
set -e

echo "⏳ Waiting for PostgreSQL to start..."
sleep 5

for folder in /data-folders/*; do
    if [ -d "$folder" ]; then
        echo "📁 Processing folder: $(basename "$folder")"

        if [ -f "$folder/schema.sql" ]; then
            echo "📄 Applying schema for $(basename "$folder")"
            psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$folder/schema.sql"
            
            echo "📜 Extracting table order from schema.sql"
            table_order=$(grep -i "create table" "$folder/schema.sql" | awk '{print $3}' | tr -d '"' | tr '\n' ' ')
        fi

        for table in $table_order; do
            csv_file="$folder/$table.csv"
            if [ -f "$csv_file" ]; then
                echo "📥 Importing $csv_file into table $table"
                psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\copy $table FROM '$csv_file' WITH (FORMAT csv, HEADER true)"
            else
                echo "⚠️  Skipping $table: CSV file not found."
            fi
        done
    fi
done

echo "✅ All data loaded successfully."
