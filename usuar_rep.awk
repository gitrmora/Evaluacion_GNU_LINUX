#!/usr/bin/awk -f 
# René Mora Maya

BEGIN{FS="|";A=100}
/JOBS/ {A=NR} 
# Cuando el número de línea es menor a la parte del archivo
# que contiene la frase "JOBS", tiene 5 campos y no
# muestra la palabra "Account"
# Como resultado imprime los campos 1 y 2
NR<A && NF==5 && $1!="Account" {print $1,$2}
# Cuando la línea tiene 6 campos y la palabra "ometeotl"
# Imprime los campos 1,2 y 3
NF==6&&$1=="ometeotl"{print $1,$2,$3}
END{}
