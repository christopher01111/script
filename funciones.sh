#!/bin/bash
clear
function menu(){
			echo "*******************"
			echo "       Menu        "
			echo "*******************"
			echo " Eliga una opcion  "
			echo "*******************"
			echo ""
			echo "1.- eliminar proceso ID"
			echo "2.- mostrar lista de usuario con procesos ejecutandose"
			echo "3.- Generar reporte"
			echo "4.- Salir"
			echo ""
			echo "Eliga una opcion"
			read opcion
			if [ $opcion = 1 ]
			then	
				eliminar
			fi
			if [ $opcion = 2 ]
			then
				listar
			fi
			if [ $opcion = 3 ]
			then
				echo "indique el nombre del archivo"
				read report
				echo ""
				echo "usted se encuentra en la siguiente ruta:"
				pwd
				echo ""
				echo "Indique la ruta donde se creara el archivo $report"
				read ruta
				touch $ruta/$report.txt
				#chmod 775 $report.txt
				echo "se ha creado el archivo $report en la ruta $ruta"
				chmod 755 $ruta/$report.txt
				reporte
			fi
			if [ $opcion = 4 ]
			then
			echo ""	
			echo "Hasta luego"
			exit			
			fi
			menu
		}
function eliminar(){
			echo ""
			echo "Indique el nombre del proceso que desea eliminar (ejemplo: firefox):"
			echo ""
			read proceso
			echo ""
			echo " el ID del proceso $proceso es:"
			pgrep $proceso
			echo "eliga el ID del  proceso que desea eliminar:"
			read id
			echo "esta seguro de querer eliminar el ID del proceso $id(s/n)?"
			read process
			if [ $process = s]
			then
				kill -9 $id
				echo "el proceso $id fue eliminado"
			 ps aux | grep $proceso 
			fi
			if [ $process = n ]
			then
				menu
			fi
			ps aux | grep $proceso
			echo ""
			echo ""
			menu
		}
function listar(){
			ps aux
			echo ""
			echo " Indique el ID del proceso que desea eliminar"
			echo ""
			read id
			kill -9 $id
			echo "el proceso con el ID $id se ha eliminad"
			ps aux | grep $id
			menu
		}	
function reporte(){
			echo "Indique que desea agregar al reporte"
			echo ""
			echo "1.- Agregar nombre de servidor"
			echo "2.- Listar usuarios"
			echo "3.- Listar grupos"
			echo "4.- salir"
			echo ""
			echo "ingrese opcion"
			read opcion
			if [ $opcion = 1 ]
			then
				hostname >> $ruta/$report.txt
				echo ""
				echo "desea agregar algo mas(s/n)"
				read opcion1
				if [ $opcion1 = s ]
				then
					reporte
				fi
				if [ $opcion1 = n ]
				then
					menu
				fi
			fi
			if [ $opcion = 2 ]
			then
				cat /etc/passwd >> $ruta/$report.txt
				echo ""
				echo "desea agregar algo mas(s/n)"
				read opcion2 
				if [ $opcion2 = s ]
				then
					reporte
				fi
				if [ $opcion2 = n ]
				then
					menu
				fi
			fi
			if [ $opcion = 3 ]
			then
				cat /etc/group >> $ruta/$report.txt
				echo ""
				echo "Desea agregar algo mas(s/n)"
				read opcion3
				if [ $opcion3 = s ]
				then
					reporte
				fi
				if [ $opcion3 = n ]
				then
					menu
				fi
			fi
			if [ $opcion = 4 ]
			then
				break
				menu
			fi		
		}	
menu
	
#scripting
