#!/usr/bin/bash
# René Mora Maya

########################################
#    Reporte semestral por usuario
########################################
echo "----------------------------------">rep_usuario_semestral.txt
echo "Reporte semestral por usuario" >>rep_usuario_semestral.txt
echo "----------------------------------">>rep_usuario_semestral.txt

# Archivo de apoyo utilizado por los programas awk
echo "--------Inicio----------" >apoyo_1.dat

# Reporte semestral
# Se recorren los archivos por número de años con el índice i
# y por el número de meses con el índice j
for i in {17..23}
do
	for j in {1..6} 
	do
		# Llamada al programa awk "usuar_rep.awk"
		# Separa en dos bloques con distinto número de campos
		# las horas y el número de trabajos
		./usuar_rep.awk REPORTES-SLURM/SLURM-$j-20$i.dat>>apoyo_1.dat
	done
	
	echo "----------------------------------">>rep_usuario_semestral.txt
	echo "------ Semestre 1-20$i------------">>rep_usuario_semestral.txt
	echo "----------------------------------">>rep_usuario_semestral.txt
	echo "| usuario | horas CPU | trabajos | semestre |">>rep_usuario_semestral.txt
	echo "----------------------------------">>rep_usuario_semestral.txt
	# Imprime el total de horas trabajos para cada usuario
	# Con la opción "-v var=$i" se agrega el semestre
	./imp_h_t.awk apoyo_1.dat | awk -v var=$i '{print $0,"1-20"var,"|"}'>>rep_usuario_semestral.txt
	echo "--------Reinicio----------" >apoyo_1.dat
	
	for j in {7..12} 
	do
		# Separa en dos bloques con distinto número de campos
		# las horas y el número de trabajos
		./usuar_rep.awk REPORTES-SLURM/SLURM-$j-20$i.dat>>apoyo_1.dat
	done
	echo "----------------------------------">>rep_usuario_semestral.txt
	echo "------ Semestre 2-20$i------------">>rep_usuario_semestral.txt
	echo "----------------------------------">>rep_usuario_semestral.txt
	echo "| usuario | horas CPU | trabajos | semestre |">>rep_usuario_semestral.txt
	echo "----------------------------------">>rep_usuario_semestral.txt
	# Imprime el total de horas y trabajos para cada usuario
	# Con la opción "-v var=$i" se agrega el semestre
	./imp_h_t.awk apoyo_1.dat | awk -v var=$i '{print $0,"2-20"var,"|"}'>>rep_usuario_semestral.txt
	echo "--------Reinicio----------" >apoyo_1.dat
done

# Archivo de apoyo utilizado por los programas awk
echo "--------Inicio----------" >apoyo_1.dat

for j in {1..4} 
do
	# Separa en dos bloques con distinto número de campos
	# las horas y el número de trabajos
	./usuar_rep.awk REPORTES-SLURM/SLURM-$j-2024.dat>>apoyo_1.dat
done

echo "----------------------------------">>rep_usuario_semestral.txt
echo "------ Semestre 1-2024------------">>rep_usuario_semestral.txt
echo "----------------------------------">>rep_usuario_semestral.txt
echo "| usuario | horas CPU | trabajos | semestre |">>rep_usuario_semestral.txt
echo "----------------------------------">>rep_usuario_semestral.txt
# Imprime el total de horas y trabajos para cada usuario
# Con la opción "-v var=$i" se agrega el semestre
./imp_h_t.awk apoyo_1.dat | awk '{print $0,"1-2024","|"}'>>rep_usuario_semestral.txt


########################################
#    Reporte anual por usuario
########################################
echo "----------------------------------">rep_usuario_anual.txt
echo "Reporte anual por usuario" >>rep_usuario_anual.txt
echo "----------------------------------">>rep_usuario_anual.txt

# Archivo de apoyo utilizado por los programas awk
echo "--------Inicio----------" >apoyo_1.dat

for i in {17..23}
do
	for j in {1..12} 
	do
		# Separa en dos bloques con distinto número de campos
		# las horas y el número de trabajos
		./usuar_rep.awk REPORTES-SLURM/SLURM-$j-20$i.dat>>apoyo_1.dat
	done
	
	echo "----------------------------------">>rep_usuario_anual.txt
	echo "------     Año 20$i   -----------">>rep_usuario_anual.txt
	echo "----------------------------------">>rep_usuario_anual.txt
	echo "| usuario | horas CPU | trabajos | año |">>rep_usuario_anual.txt
	echo "----------------------------------">>rep_usuario_anual.txt
	# Imprime el total de horas y trabajos para cada usuario
	./imp_h_t.awk apoyo_1.dat | awk -v var=$i '{print $0,"20"var,"|"}'>>rep_usuario_anual.txt
	echo "--------Reinicio----------" >apoyo_1.dat
done

for j in {1..4} 
do
	# Separa en dos bloques con distinto número de campos
	# las horas y el número de trabajos
	./usuar_rep.awk REPORTES-SLURM/SLURM-$j-2024.dat>>apoyo_1.dat
done

echo "----------------------------------">>rep_usuario_anual.txt
echo "------      Año 2024   -----------">>rep_usuario_anual.txt
echo "----------------------------------">>rep_usuario_anual.txt
echo "| usuario | horas CPU | trabajos |">>rep_usuario_anual.txt
echo "----------------------------------">>rep_usuario_anual.txt
# Imprime el total de horas y trabajos para cada usuario
./imp_h_t.awk apoyo_1.dat | awk '{print $0,"2024","|"}'>>rep_usuario_anual.txt

# Eliminación del archivo de apoyo
rm apoyo_1.dat
