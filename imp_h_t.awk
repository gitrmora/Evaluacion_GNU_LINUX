#!/usr/bin/awk -f 
# René Mora Maya

BEGIN{}
# Cuando la línea contiene 2 campos
# Como resultado crea un arreglo "horas" cuyos índices
# corresponden al campo 1 y el valor al campo 2
NF==2{horas[$1]++;horas[$1]+=$2}
# Cuando la línea contiene 3 campos
# Como resultado crea un arreglo "trabajos" cuyos índices
# corresponden al campo 2 y el valor al campo 3
NF==3{trabajos[$2]++;trabajos[$2]+=$3}
# Impresión de los arreglos "horas" y "trabajos" para cada índice
END{for(i in horas){print "|",i,"|",horas[i],"|",trabajos[i],"|"}}
