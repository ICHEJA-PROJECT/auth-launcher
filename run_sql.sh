#!/bin/bash

# Variables de conexión
export PGPASSWORD="1234567"

HOST="localhost"
PORT="5432"
USER="postgres"
DB="authdb"
FILE="dummy_data.sql"

# Verificar si el archivo existe
if [[ ! -f "$FILE" ]]; then
  echo "❌ Error: El archivo '$FILE' no existe."
  exit 1
fi

# Ejecutar el archivo SQL
echo "🚀 Ejecutando '$FILE' en la base de datos '$DB'..."

psql -h $HOST -p $PORT -U $USER -d $DB -f $FILE

if [[ $? -eq 0 ]]; then
  echo "✅ Script ejecutado exitosamente en '$DB'."
else
  echo "❌ Error al ejecutar el script en '$DB'."
fi
