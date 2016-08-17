Proceso JuegoDeLaVida
	//Desarrollado por:
	//Mauricio Villanueva
	
	//Se declaran variables a utilizar.
	vecino<-0
	opcionSalir<-0
	opcionNada<-0
	nCol<-0
	nFil<-0
	opMen<-0
	opSubmen<-0
	
	//Genera menú inicial y condiciona el acceso con un ciclo.
	Repetir
		Escribir "****El Juego de la Vida****"
		Escribir ""
		Escribir "Seleccione una opción"
		Escribir "1 : Al azar"
		Escribir "2 : Predeterminado"
		Leer opMen
	Hasta Que opMen>0 && opMen <3 
	
	//Se ingresa a un submenú dependiendo de la opción seleccionada.
	Segun opMen Hacer
		//Al ser la opción 1 al azar, se podrá elejir la cantidad 
		//de filas y columnas, con máximo de 18x18 y minimo de 2x2.
		1:	Repetir
				Escribir "Ingrese Cantidad de Filas (Min 2, Max 18)"
				Leer nFil
				Escribir "Ingrese Cantidad de Columnas (Min 2, Max 18)"
				Leer nCol
				Dimension mundo[nFil,nCol];//Creamos el arreglo bidimensional.
				Dimension mundo_res[nFil,nCol];//creamos un arreglo bidimensional para respaldo y poder comparar.
				Para j<-1 Hasta nFil Con Paso 1 Hacer
					Para i<-1 Hasta nCol Con Paso 1 Hacer
						mundo[j,i]<-AZAR(2) 
					FinPara
				FinPara
				Limpiar Pantalla
			Hasta Que nFil>1 && nFil<21 && nCol>1 && nCol<21 
		2:	//Para las opciones predeterminadas creamos un arreglo
			//definido y lo rellenamos con "0" mientras.
			nFil<- 18
			nCol<-18
			Dimension mundo[nFil,nCol];
			Dimension mundo_res[nFil,nCol];//creamos un arreglo bidimensional para respaldo y poder comparar.
			Para j<-1 Hasta nFil Con Paso 1 Hacer
				Para i<-1 Hasta nCol Con Paso 1 Hacer
					mundo[j,i]<-0 
				FinPara
			FinPara
			//Creamos un Submenú para seleccionar la forma predeterminada.
			Repetir
				Escribir "Seleccione una forma predeterminada"
				Escribir "1 : Bloque"
				Escribir "2 : Barco"
				Escribir "3 : Parpadeador"
				Escribir "4 : Sapo"
				Escribir "5 : Planeador"
				Escribir "6 : Nave Ligera"
				Leer opSubmen
			Hasta Que opSubmen>0 && opSubmen<7 
			//Al arreglo que contenía inicialmente sólo ceros,
			//le insertamos números 1 dependiendo de la forma seleccionada.
			Segun opSubmen Hacer
				1:	mundo[8,8]<-1
					mundo[8,9]<-1
					mundo[9,8]<-1
					mundo[9,9]<-1
				2:	mundo[8,8]<-1
					mundo[8,9]<-1
					mundo[9,8]<-1
					mundo[9,10]<-1
					mundo[10,8]<-1
				3:	mundo[9,8]<-1
					mundo[9,9]<-1
					mundo[9,10]<-1
				4:	mundo[9,8]<-1
					mundo[9,9]<-1
					mundo[9,10]<-1
					mundo[10,9]<-1
					mundo[10,10]<-1
					mundo[10,11]<-1
				5:	mundo[8,8]<-1
					mundo[8,9]<-1
					mundo[8,10]<-1
					mundo[9,8]<-1
					mundo[10,9]<-1
				6:	mundo[7,8]<-1
					mundo[7,11]<-1
					mundo[8,7]<-1
					mundo[9,7]<-1
					mundo[9,11]<-1
					mundo[10,7]<-1
					mundo[10,8]<-1
					mundo[10,8]<-1
					mundo[10,10]<-1
			FinSegun
			
	FinSegun
	//éste ciclo repetitivo mostrara la evolución de las celdas o celulas.
	Repetir
		Limpiar Pantalla
		//Copiamos la matriz original en la matriz de respaldo
		//para posteriormente realizar las comparaciones.
		Para j<-1 Hasta nFil Con Paso 1 Hacer
			Para i<-1 Hasta nCol Con Paso 1 Hacer
				mundo_res[j,i]<-mundo[j,i] 
			FinPara
		FinPara
		//Recorremos el arreglo creado ya rellenado
		//y vamos mostrando por pantalla "." y "O"
		//para diferenciar de mejor manera el 
		//estado de las celulas (vivas o muertas).
		Para j<-1 Hasta nFil Con Paso 1 Hacer
			Para i<-1 Hasta nCol Con Paso 1 Hacer
				si mundo[j,i]==0
					Escribir sin saltar " . "
				Sino
					escribir Sin Saltar " O "
				FinSi
				Si i==nCol
					Escribir ""
				FinSi
			FinPara
		FinPara
		//Recorremos el arreglo nuevamente
		//y al posicionarnos en cada celda
		//verificamos si las 8 celdas
		//que están alrededor están vivas o muertas
		//y aplicamos el cambio de estado
		//dependiendo de las reglas.
		Para j<-1 Hasta nFil Con Paso 1 Hacer
			Para i<-1 Hasta nCol Con Paso 1 Hacer
				
				//Celda a la Izquierda.
				Si j>1 && mundo_res[j-1,i]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//Celda a la Derecha.
				Si j<nCol && mundo_res[j+1,i]==1 entonces
						vecino<-vecino+1
				FinSi
				
				//Celda de Arriba.
				Si i>1 && mundo_res[j,i-1]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//Celda de Abajo.
				Si i<nFil && mundo_res[j,i+1]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//Celda Izquierda,Arriba.
				Si i>=2 && j >=2 && mundo_res[j-1,i-1]==1 entonces
						vecino<-vecino+1
				FinSi
				
				//Celda Izquierda,Abajo.
				Si i<nFil && j >=2 && mundo_res[j-1,i+1]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//Celda Derecha,Arriba.
				Si i>=2 && j<nCol && mundo_res[j+1,i-1]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//Celda Derecha,Abajo.
				Si i<nFil && j<nCol && mundo_res[j+1,i+1]==1 entonces
					vecino<-vecino+1
				FinSi
				
				//El juego estándar, en que una célula muerta nace  si tiene 3 células vecinas vivas, 
				//Si está viva, sigue viva si tiene 2 o 3 células vecinas vivas y muere en otro caso.
				Si mundo[j,i]==0 && vecino==3
					mundo[j,i]<-1
				FinSi
				Si vecino== 2 | vecino==3
					si mundo[j,i]==1
					mundo[j,i]<-1
					FinSi
				FinSi
				si mundo[j,i]==1 
					si vecino<2 | vecino>3
						mundo[j,i]<-0
					finsi
				FinSi
				
				//colocamos la variale en 0 nuevamente para verificar
				//la siguiente celda.
				vecino<-0
			FinPara
		FinPara
		
		//Retrasar (para apreciar los cambios) y limpiar la pantalla.
		Esperar 0.5 segundos
		Limpiar pantalla
		//Imprimimos el arreglo con los cambios realizados.
		Para j<-1 Hasta nFil Con Paso 1 Hacer
			Para i<-1 Hasta nCol Con Paso 1 Hacer
				si mundo[j,i]==0
					Escribir sin saltar " . "
				Sino
					escribir Sin Saltar " O "
				FinSi
				Si i==nCol
					Escribir ""
				FinSi
			FinPara
		FinPara
		
		
	Hasta Que opcionSalir==1
	
FinProceso
