# 🐚 Mis Scripts de Bash: PostgreSQL Backups y Guía de Parámetros Especiales

¡Bienvenido a mi repositorio de scripts de Bash! Aquí encontrarás dos scripts útiles: uno para realizar **backups de bases de datos PostgreSQL** y otro que sirve como una **guía interactiva sobre los parámetros especiales en Bash**.

---

## 🚀 Contenido del Repositorio

* `backup_postgres.sh`: Un script diseñado para automatizar los respaldos de tus bases de datos PostgreSQL.
* `parametros_especiales.sh`: Un script interactivo que te ayudará a comprender los principales parámetros especiales de Bash (`$0`, `$*`, `$@`, `$#`, `$$`, `$?`) y sus casos de uso.

---

## 💻 Primeros Pasos

Sigue estos sencillos pasos para empezar a usar los scripts:

### 1. Clona el Repositorio

Abre tu terminal y ejecuta el siguiente comando para clonar este repositorio en tu máquina local:

```bash
git clone https://github.com/EdsonSaldivar/Diplomado.git
```

### 2. Darle permisos de ejecución al repositorio

Ejecuta el siguiente comando para poder darle permisos de ejecución a los scripts del repositorio:

```bash
sudo chmod +x -R Diplomado
```

### 3. Entra al repositorio

Con el siguiente comando posicionate dentro del repositorio:

```bash
cd Diplomado/
```

### 4. Ejecutando un script

Estando dentro del repositorio ya podemos ejecutar cualquiera de los scripts que deseemos probar con el siguiente comando:

```bash
./parametros_especiales.sh
```
O podemos ejecutar:

```bash
./backup_postgres.sh
```

### 5. Probar script

* El script `parametros_especiales.sh`: tiene una serie de instrucciones las cuales se te indicaran conforme lo ejecutes, es importante que leeas cada output que este arroja ya que para su correcto funcionamiento se requiere que introduzcas SOLAMENTE los caracteres especiales que este te indica, sí no se colocan el script simplemente se cerrará y no podras obtener los ejemplos y la explicación de cada parametro especial.

* El script `backup_postgres.sh`: Es recomendable ejecutar el script con permisos de sudo, nos solicitará el nombre de la base de datos, sus claves de acceso y opcionalmente una ruta absoluta en donde querramos guardar el respaldo para poder realizar un backup de lo que le indiquemos y despues de que lo terminé el script se cerrará.

### 6. Revisar script

Puedes revisar, editar y modificar los scripts de este repositorio desde el repositorio con el siguiente comando:

```bash
cat backup_postgres.sh
```



