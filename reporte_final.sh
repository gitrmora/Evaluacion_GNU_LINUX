#!/usr/bin/bash
# René Mora Maya

########################################
#    Reporte semestral 
########################################
echo "----------------------------------">rep_semestral.txt
echo "----- Reporte semestral    -------">>rep_semestral.txt
echo "----------------------------------">>rep_semestral.txt
echo "| Horas CPU  | Horas IDLE | semestre |">>rep_semestral.txt
echo "---------------------">>rep_semestral.txt

# Reporte semestral
# Se recorren los archivos por número de años con el índice i
# y por el número de meses con el índice j
for i in {17..23}
do
	for j in {1..6} 
	do
		./rep_final.awk REPORTES-SLURM/SLURM-$j-20$i.dat
	done| # Se suman las horas CPU y IDLE para cada archivo
	      # y se guardan en rep_semestral.txt
	awk -v var=$i '{H_CPU+=$1;H_IDLE+=$2}END{print "|",H_CPU,"|", H_IDLE,"|","1-20"var,"|"}'>>rep_semestral.txt
	
	for j in {7..12} 
	do
		./rep_final.awk REPORTES-SLURM/SLURM-$j-20$i.dat
	done| # Se suman las horas CPU y IDLE para cada archivo
	      # y se guardan en rep_semestral.txt
	awk -v var=$i '{H_CPU+=$1;H_IDLE+=$2}END{print "|",H_CPU,"|", H_IDLE,"|","2-20"var,"|"}'>>rep_semestral.txt

done

for j in {1..4}
do
	./rep_final.awk REPORTES-SLURM/SLURM-$j-2024.dat
done| # Se suman las horas CPU y IDLE para cada archivo
	  # y se guardan en rep_semestral.txt
awk '{H_CPU+=$1;H_IDLE+=$2}END{print "|",
H_CPU,"|", H_IDLE,"|","1-2024","|"}'>>rep_semestral.txt

########################################
#    Reporte anual
########################################
echo "----------------------------------">rep_anual.txt
echo "-------  Reporte anual   ---------">>rep_anual.txt
echo "----------------------------------">>rep_anual.txt
echo "| Horas CPU  | Horas IDLE | año |">>rep_anual.txt
echo "----------------------------------">>rep_anual.txt
	
for i in {17..23}
do
	for j in {1..12} 
	do  
		./rep_final.awk REPORTES-SLURM/SLURM-$j-20$i.dat
	done| # Se suman las horas CPU y IDLE para cada archivo
	      # y se guardan en rep_anual.txt
	awk -v var=$i '{H_CPU+=$1;H_IDLE+=$2}END{print "|",H_CPU,"|", H_IDLE,"|","20"var,"|"}'>>rep_anual.txt
done

for j in {1..4}
do
	./rep_final.awk REPORTES-SLURM/SLURM-$j-2024.dat
done| # Se suman las horas CPU y IDLE para cada archivo
	      # y se guardan en rep_anual.txt
awk '{H_CPU+=$1;H_IDLE+=$2}END{print "|",H_CPU,"|",
 H_IDLE,"|","2024","|"}'>>rep_anual.txt
