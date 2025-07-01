#!/bin/bash

# Input para solicitar el nombre de la base de datos
read -p "Porfavor introduce el nombre de la base de datos: " database

echo ""

# Confirmación de selección
echo "De acuerdo, respaldaré la base de datos: $database"
 
echo ""

read -p "Porfavor introduce el nombre de usuario que tiene los mayores privilegios en la base de datos: " userdatabase

echo "Usando el usuario: $userdatabase "

#La flag -s nos ayuda a que el usuario pueda escribir su password sin mostrar en pantalla lo que escribió
read -s -p "Porfavor introduce la contraseña del usuario indicado: " userdatabasepassword

echo "" 

echo "Usaré el usuario $userdatabase con la contraseña proporcionada para respaldar la base de datos $database"

read -p "¿Te gustaría indicar alguna ruta en especifico donde quisieras que guarde el respaldo? (S/N): " confirmarruta

echo ""

# Ruta por defecto
backup_path="." # Ruta del directorio donde se está ejecutando el script

if [[ "$confirmarruta" == "S" || "$confirmarruta" == "s" ]]; then
    read -p "Indica la ruta absoluta donde quieres que mande el respaldo: " absolutepath
    
    echo ""

    # Validar que la ruta ingresada existe
    if [ ! -d "$absolutepath" ]; then

        read -p "La ruta '$absolutepath' no existe. ¿Quieres crearla? (S/N): " create_dir

        echo ""

        if [[ "$create_dir" == "S" || "$create_dir" == "s" ]]; then

            mkdir -p "$absolutepath"

            if [ $? -eq 0 ]; then

                echo "Directorio '$absolutepath' creado exitosamente."

                backup_path="$absolutepath"

            else

                echo "Error al crear el directorio. Usando la ruta por defecto."

            fi
        else

            echo "No se creará el directorio. Usando la ruta por defecto."
        
        fi
    
    else
    
        backup_path="$absolutepath"
    
    fi
    
    echo ""

    echo "Creando respaldo y enviándolo a la ruta: $backup_path"

else

    echo "De acuerdo, usaré mi ruta por defecto la cual es justo donde este script se ejecutó ($backup_path)"

fi

echo ""

# Generar el formato de fecha para el archivo de respaldo
timestamp=$(date +%Y%m%d_%H%M%S)

backup_filename="${database}_${timestamp}.sql"

full_backup_path="${backup_path}/${backup_filename}"

# pg_dump es el comando de respaldo para postgres
PGPASSWORD="$userdatabasepassword" pg_dump -U "$userdatabase" -d "$database" > "$full_backup_path"

#Usando el parametro especial $? para confirmar que el respaldo se completó exitosamente
if [ $? -eq 0 ]; then

    echo "¡Respaldo de la base de datos '$database' completado exitosamente en: $full_backup_path!"

else
    echo "Error al crear el respaldo de la base de datos '$database'."

    echo ""

    echo "Por favor, verifica el nombre de la base de datos, el usuario, la contraseña y los permisos."
fi

exit 0
