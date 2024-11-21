#!/usr/bin/bash
# René Mora Maya

ls REPORTES-SLURM/|
tr " " "\n"| # Renombra  los archivos con estructura SLURM-mes-año.dat
awk -F "-" 'BEGIN {print "#!/usr/bin/bash"}{
if($2>13) 
{print "mv","REPORTES-SLURM/"$0,"REPORTES-SLURM/"$1"-"$3"-"$2".dat"}
else
{print "mv","REPORTES-SLURM/"$0,"REPORTES-SLURM/"$0".dat"}
}
END{}'>out.sh # Se crea el archivo out.sh
chmod +x out.sh # Se le asignan permisos de ejecución
./out.sh # Se ejecuta
rm out.sh # Se elimina
