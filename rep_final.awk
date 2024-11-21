#!/usr/bin/awk -f 
# René Mora Maya

BEGIN { FS="|"  } # Separación de los campos con "|"
# Cuando la línea tiene 8 campos y la palabra "ometeotl"
# Imprime los campos 7 y la diferencia entre el campo 7 y 2
NF==8 && $1=="ometeotl"{ print $7,$7-$2 }
END{}
