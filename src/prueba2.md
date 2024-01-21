Crear un pseudocódigo Groovy para Actualizar/Insertar el rango Inicial y Rango Final de una tabla: RANGOS

Dicha tabla tiene los siguientes campos:

ID_RANGO - Integer
Anho - Integer
Bimestre - Integer
Rango_Inicial - String
Rango_Final - String
Ultima_actualizacion - TimeStamp


El procedimiento recibirá los siguientes datos desde un frontal, llegando como un mapa llamado ctx con los siguientes datos:

ctx.FechaModificacion -> String
ctx.BimestresModificacion -> integer
ctx.rangoInicial -> String (Formato "AA-123456678")
ctx.rangoFin -> String (Formato "AA-123456678")


Dicho procedimiento debe tener un método de validación que compruebe, si no cumple todos los prerequisitos no puede continuar:

* La fecha introducida debe ser un timeStamp válido (yyyy-MM-dd HH:mm:ss.SSS)
* Debe haber al menos 1000 valores entre rango Inicial y Final
* Solo se puede actualizar o insertar un periodo futuro

Una vez comprobados los datos buscará si existe un registro para modificar, en caso contrario lo insertará.


Notas:
Este script dispone de Helpers para realizar un par de acciones:
info - Muestra información por consola: Ej: info "Esto es un mensaje"

sqlQuery - Realiza una consulta contra la bbdd y devuelve un array con el resultado. Recibe como parámetros la bbdd, query, mapa de parámetros.
Ej:
query = "SELECT * FROM RANGOS WHERE ID_RANGO = :RANGO"
params = [:]
params.RANGO = 1
resultado = sqlQuery(bbdd,query,params)

sqlUpdate - Realiza una inserción o un update contra la bbdd y devuelve un array con el resultado. Recibe como parámetros la bbdd, query, mapa de parámetros.
Ej:
query = "UPDATE RANGOS SET RANGOINICIAL = :RANGOINICIAL WHERE ID_RANGO = :RANGO"
params = [:]
params.RANGO = 1
resultado = sqlUpdate(bbdd,query,params)