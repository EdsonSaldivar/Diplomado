#!/bin/bash

# Edita esta variable de acuerdo a la base de datos que quieras respaldar
database="laravel"

# El usuario por defecto de PostgreSQL. No necesita contraseña si se usa 'sudo -u postgres'.

# Ruta donde te gustaría generar el respaldo
backup_path="."

# Generar el formato de fecha para el archivo de respaldo
timestamp=$(date +%Y%m%d_%H%M%S)

backup_filename="${database}_${timestamp}.sql"

full_backup_path="${backup_path}/${backup_filename}"

# pg_dump es el comando de respaldo para postgres
# Usamos 'sudo -u postgres' para ejecutar pg_dump como el usuario del sistema 'postgres'.
# Esto evita la necesidad de especificar usuario y contraseña para pg_dump,
# ya que el usuario 'postgres' del sistema suele tener acceso peer/ident a la BD.
sudo -u postgres pg_dump -d "$database" > "$full_backup_path"

# Usando el parametro especial $? para confirmar que el respaldo se completó exitosamente
if [ $? -eq 0 ]; then
    echo "¡Respaldo de la base de datos '$database' completado exitosamente en: $full_backup_path!"
else
    echo "Error al crear el respaldo de la base de datos '$database'."
    echo ""
    echo "Por favor, verifica el nombre de la base de datos, y que el servicio de PostgreSQL esté en ejecución."
    echo "Asegúrate de que el usuario que ejecuta este script tenga permisos para usar 'sudo' sin contraseña para el usuario 'postgres'."
fi

exit 0
