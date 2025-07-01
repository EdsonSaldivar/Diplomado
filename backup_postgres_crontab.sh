#!/bin/bash

# Edita esta variable de acuerdo a la base de datos que quieras respaldar
database="laravel"

# Edita esta variable de acuerdo al usuario que cuente con los mayores privilegios de la base de datos que deseas respaldar 
username="laravel"

# Edita esta variable de acuerdo al password del usuario de la base de datos que ingresaste en la linea 6
password="123qwe"

# Edita esta variable de acuerdo a la ruta donde quieres que se guarde el respaldo de la base de datos
backup_path="."

# Generar el formato de fecha para el archivo de respaldo
timestamp=$(date +%Y%m%d_%H%M%S)

backup_filename="${database}_${timestamp}.sql"

full_backup_path="${backup_path}/${backup_filename}"

# pg_dump es el comando de respaldo para postgres
PGPASSWORD="$userdatabasepassword" pg_dump -U "$userdatabase" -d "$database" > "$full_backup_path"

# Usando el parametro especial $? para confirmar que el respaldo se completó exitosamente
if [ $? -eq 0 ]; then

    echo "¡Respaldo de la base de datos '$database' completado exitosamente en: $full_backup_path!"

else
    echo "Error al crear el respaldo de la base de datos '$database'."

    echo ""

    echo "Por favor, verifica el nombre de la base de datos, el usuario, la contraseña y los permisos."
fi

exit 0