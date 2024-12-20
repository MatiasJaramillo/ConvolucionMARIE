	Jump startProgram
DigitString, HEX 002	//array 'DigitString' guarda string de numero de maximo 5 digitos
	DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
KIndex, HEX 00B	//indice del primer elemento de K
KRows, DEC 003	//numero de filas de K
KColumns, DEC 003	//numero de columnas de K
KMatriz, DEC 009 	//matriz K, de tamaño 9 (3x3)
	DEC -005
    DEC -006
    DEC -007
    DEC -008
    DEC -009
    DEC -010
    DEC -011
    DEC -012
    DEC -013
//desde aqui pegar cualquier matriz X y Y**********************
XIndex, HEX 018	//indice de primer elemento de X
XRows, DEC 004	//numero de filas de X
XColumns, DEC 004	//numero de columnas de X
XMatriz, DEC 016	//matriz X
	DEC 001
    DEC 002
    DEC 003
    DEC 004
    DEC 001
    DEC 002
    DEC 003
    DEC 004
    DEC 001
    DEC 002
    DEC 003
    DEC 004
    DEC 001
    DEC 002
    DEC 003
    DEC 004
YIndex, HEX 02C	//indice de primer elemento de Y
YRows, DEC 004	//numero de filas de Y
YColumns, DEC 004	//numero de columnas de Y
YMatriz, DEC 016	//matriz Y
	DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
    DEC 000
//hasta aqui pegar matrices X y Y *********************
 
startProgram, Load KIndex	//inicio del programa principal
	Store convKIndex
	Load KMatriz
	Store convKSize
	Load KRows
	Store convKRows
	Load KColumns
	Store convKCols	//se guardan los parametros para la subrutina 'convolucion'
	
    Load YIndex
	Store convYIndex
    Store convYStart
	Load YMatriz
	Store convYSize
	Load YRows
	Store convYRows
	Load YColumns
	Store convYCols	//se guardan los parametros de la subrutina 'convolucion'
	
    Load XIndex
	Store convXIndex
	Load XMatriz
	Store convXSize
	Load XRows
	Store convRows
	Load XColumns
	Store convCols	//se guardan los parametros de la subrutina 'convolucion'
	
    JnS convolucion	//se corre la subrutina 'convolucion'
    //final del programa
	Halt		
    
convolucion, HEX 000
	Load X	//imprimir texto
    Output
    Load TwoDots
	Output
	Load NewLine
	Output
	
	Load convXIndex	//imprimir matriz X
	Store PMIndex
	Load convRows
	Store PMRows
	Load convCols
	Store PMCols
	Load convXSize
	Store PMSize
	JnS printMatriz
    
    Load NewLine
	Output
    
    Load K	//imprimir texto
    Output
    Load TwoDots
	Output
	Load NewLine
	Output

	Load convKIndex	//imprimit matriz K
	Store PMIndex
	Load convKRows
	Store PMRows
	Load convKCols
	Store PMCols
	Load convKSize
	Store PMSize
	JnS printMatriz
    
    Load convXIndex	//guardar parametros para la subrutina 'convAnidada'
	Store convAXIndex	
	Load convXSize
	Store convAXSize
	Load convRows
	Store convAXRows
	Load convCols
	Store convAXCols
	
    Load convKIndex	//guardar parametros para la subrutina 'convAnidada'
	Store convAKIndex
	Load convKSize
	Store convAKSize
	Load convKRows
	Store convAKRows
	Load convKCols
	Store convAKCols
    
convLoop1, Load convRows	//comenzar convolucion
	Subt convRowCount	//recorrer filas
	Skipcond 800
    Jump endConvLoop1
convLoop2, Load convCols
	Subt convColCount	//recorrer columnas
	Skipcond 800
    Jump endConvLoop2
    
    Load convRowCount	//guardar parametros de fila y columna para la subrutina 'convAnidada'
	Store i
    Load convColCount
	Store j
	
    JnS convAnidado	//hacer operaciones de convolucion
	Load convAReturn	//retornar resultado de convolucion
	StoreI convYIndex	//guardar en la posicion actual de la matriz Y
	
    Load convYIndex	//incrementar indixe de la matriz Y
	Add One
	Store convYIndex
    
	Load convColCount	//incrementar contador para el loop columnas
	Add One
	Store convColCount
    Jump convLoop2	//regresar al inicio del loop columnas
endConvLoop2, Load convRowCount
	Add One		//incrementar contador para el loop filas
	Store convRowCount
	Load Zero	//reiniciar el contador para el loop de columnas
	Store convColCount	
	Jump convLoop1	//regresar al inicio del loop filas
endConvLoop1, Load Zero
	Store convRowCount	//reiniciar el contador para el loop de filas
    Load convYStart
	Store convYIndex	//se reinicia el indice de la matriz Y 
    
    Load NewLine	//imprimir texto
	Output
    Load Y
    Output
    Load TwoDots
	Output
	Load NewLine
	Output
    
    Load convYIndex	//imprimir matriz Y
	Store PMIndex
	Load convYRows
	Store PMRows
	Load convYCols
	Store PMCols
	Load convYSize
	Store PMSize
	JnS printMatriz
    
    JumpI convolucion	//final de la subrutina 'convolucion'
    
/variables convolucion
convKIndex, HEX 000
convKSize, DEC 000
convKCols, DEC 000
convKRows, DEC 000

convYIndex, HEX 000
convYStart, HEX 000
convYSize, DEC 000
convYCols, DEC 000
convYRows, DEC 000

convXIndex, HEX 000
convXSize, DEC 000
convRows, DEC 000
convRowCount, DEC 000
convCols, DEC 000
convColCount, DEC 000

convAnidado, HEX 000	//subrutina 'convAnidado'
	Load convAKRows
	Store divParam1
	Load Two
	Store divParam2
    JnS div		//se calula la variable kCenter (centro de la longitud de matriz K)
	Load returnDiv
	Store KCenter
convALoop1, Load convAKRows	//loop para recorrer filas
	Subt convAKRowCount
	Skipcond 800
    Jump endConvALoop1
convALoop2, Load convAKCols	//loop para recorrer columnas
	Subt convAKColCount
	Skipcond 800
    Jump endConvALoop2
    
    Load i
    Skipcond 400
    Jump contConvA
    Load One
	Store finalOprimera
    Load convAXRows
    Subt i
    Skipcond 400
    Jump contConvA
    Load Two
	Store finalOprimera
    
    
contConvA, Load convAKRowCount
	Add i
    Subt KCenter
	Store x		//se calcula el offset para las filas de matriz X
    Load convAKColCount
	Add j
    Subt KCenter
	Store y		//se calcula el offset para las columnas de matriz X
cond1, Load x	//condiciones para no calcular posiciones fuera de la matriz X
	Skipcond 000	//condicion de x >= 0
    Jump cond2
    Jump else
cond2, Load convAXRows	//condicion de x < matrizX.length
	Subt x
    Skipcond 800
    Jump else
cond3, Load y	//condicion de y >= 0
	Skipcond 000
	Jump cond4
    Jump else
cond4, Load convAXCols	//condicion de y < matriz[0].length
	Subt y
    Skipcond 800
    Jump else
	
    Load convAKRowCount	//guardar parametros para la subrutina 'get'
	Store getRow
	Load convAKColCount
	Store getCol
	Load convAKIndex
	Store getIndex
	Load convAKSize
	Store getSize
	Load convAKCols
	Store getColumns
    
    JnS get		//se llama 'get' para la fila y columna deseada de la matriz K
	Load getReturn
	Store tempMultParam	//se guarda un parametro temporal para luego multiplicar
	
    Load x	//guardar parametros para la subrutina 'get'
    Store getRow
	Load y
    Store getCol
	Load convAXIndex
	Store getIndex
    Load convAXSize
	Store getSize
	Load convAXCols
	Store getColumns
    
    JnS get
	Load getReturn	//se obtiene la fila y columna deseada de matriz X
	Store multParam2	//se guarda como parametro de 'mult'
    Load tempMultParam	//se trae la variable temporal para el otro parametro de 'mult'
	Store multParam1

	JnS mult	//se realiza la multiplicación
	Load returnMult
    Add sum
	Store sum	//se hace sum += matrizK[k][m] * matrizX[x][y]
    Jump contLoop
    
else, Load convAKRowCount	//guardar parametros para la subrutina 'get'
	Store getRow
	Load convAKColCount
	Store getCol
	Load convAKIndex
	Store getIndex
	Load convAKSize
	Store getSize
	Load convAKCols
	Store getColumns
    
    JnS get		//se llama 'get' para la fila y columna deseada de la matriz K
	Load getReturn
	Store tempMultParam	//se guarda un parametro temporal para luego multiplicar
    
cond1b, Load x	//condiciones para no calcular posiciones fuera de la matriz X
	Skipcond 000	//condicion de x >= 0
    Jump cond2b
    Store xTemp
cond2b, Load convAXRows	//condicion de x < matrizX.length
	Subt x
    Skipcond 800
    Store xTemp
cond3b, Load y	//condicion de y >= 0
	Skipcond 000
	Jump cond4b
    Store yTemp
cond4b, Load convAXCols	//condicion de y < matriz[0].length
	Subt y
    Skipcond 800
    Store yTemp
    Load xTemp
    Skipcond 000
    Jump cond2c
    Jump cond1c
    
cond1c, Load yTemp
    Skipcond 000
    Jump cond3c
    Load i	//guardar parametros para la subrutina 'get'
    Store getRow
    Load j	//guardar parametros para la subrutina 'get'
    Store getCol
    Jump contB
cond2c, Load XRows
	Subt One
	Subt xTemp
    Skipcond 400
    Jump contCond2c
    Jump cond1d
contCond2c, Load convAKRowCount
	Store getRow
    Load j	//guardar parametros para la subrutina 'get'
    Store getCol
    Jump contB
cond3c, Load XColumns
	Subt One
	Subt yTemp
    Skipcond 400
    Jump contCond3c
    Jump cond3d
contCond3c, Load i
	Store getRow
	Load convAKColCount
	Store getCol
    Jump contB
    
cond1d, Load XColumns
	Subt One
	Subt yTemp
    Skipcond 400
    Jump cond2d
	Load i	//guardar parametros para la subrutina 'get'
    Store getRow
    Load j	//guardar parametros para la subrutina 'get'
    Store getCol
    Jump contB
cond2d, Load convAKRowCount
	Store getRow
    Load j	//guardar parametros para la subrutina 'get'
    Store getCol
    Jump contB
cond3d, Load i
	Store getRow
	Load convAKColCount
	Store getCol
    Jump contB
    
contB, Load convAXIndex
	Store getIndex
    Load convAXSize
	Store getSize
	Load convAXCols
	Store getColumns
    
    JnS get
	Load getReturn	//se obtiene la fila y columna deseada de matriz X
	Store multParam2	//se guarda como parametro de 'mult'
    Load tempMultParam	//se trae la variable temporal para el otro parametro de 'mult'
	Store multParam1
    
    JnS mult	//se realiza la multiplicación
	Load returnMult
    Add sum
	Store sum	//se hace sum += matrizK[k][m] * matrizX[x][y]
    
contLoop, Load convAKColCount	//incrementar el contador para loop de columnas
	Add One
	Store convAKColCount
	Jump convALoop2	//se regresa al loop de columnas
endConvALoop2, Load convAKRowCount	//incrementar el contador de loop de filas
	Add One
	Store convAKRowCount
	Load Zero		//reiniciar el contador de loop de columnas
	Store convAKColCount
	Jump convALoop1	//regresar al inicio de loop filas
endConvALoop1, Load sum
	Store convAReturn	//al finalizar se guarda la suma en una variable de return
	Load Zero	//resetear variables de la subrutina 'contAnidado' para reutilizar
    Store convAKRowCount
	Store sum
    Store KCenter
	Store x
    Store y
    
    JumpI convAnidado	//final de la subrutina 'convAnidado'

/variables convAnidado
finalOprimera, DEC 000
xTemp, DEC 000
yTemp, DEC 00

i, DEC 000
j, DEC 000
x, DEC 000
y, DEC 000
KCenter, DEC 000
sum, DEC 000
convAReturn, DEC 000
tempMultParam, DEC 000

convAKIndex, HEX 000
convAKSize, DEC 000
convAKRows, DEC 000
convAKRowCount, DEC 000
convAKCols, DEC 000
convAKColCount, DEC 000

convAXIndex, HEX 000
convAXSize, DEC 000
convAXCols, DEC 000
convAXRows, DEC 000

printMatriz, HEX 000	//subrutina para imprimir matrices
PMLoop1, Load PMRows	//loop de filas
    Subt PMRowCount
    Skipcond 800
    Jump endPMLoop1
PMLoop2, Load PMCols	//loop de columnas
    Subt PMColCount
    Skipcond 800
    Jump endPMLoop2

    Load PMRowCount       //guardar parametros para subrutina 'get'
    Store getRow          
    Load PMColCount       
    Store getCol          
    Load PMIndex          
    Store getIndex        
    Load PMSize           
    Store getSize        
    Load PMCols           
    Store getColumns      

    JnS get               //llamar 'get' para obtener el elemento de la fila y columna actual
    Load getReturn        
    Store num	//se guarda el elemento en el parametro de la subrutina 'printNumber'
    JnS printNumber	//imprimir el elemento 
    Load Space	//imprimir un espacio
    Output                

    Load PMColCount       //incrementar contador de loop de columnas
    Add One
    Store PMColCount
    Jump PMLoop2

endPMLoop2, Load NewLine
    //imprimir salto de linea al final de cada fila
	Output
    Load PMRowCount       //incrementar contador de loop de filas
    Add One
    Store PMRowCount
    Load Zero             //resetear contador de loop de columnas
    Store PMColCount
    Jump PMLoop1

endPMLoop1, Load Zero     //resetear contador de loop de filas
    Store PMRowCount
    JumpI printMatriz	//final de subrutina 'printMatriz'

/variables printMatriz
PMSize, DEC 000
PMIndex, HEX 000
PMRows, DEC 000
PMRowCount, DEC 000
PMCols, DEC 000
PMColCount, DEC 000

get, HEX 000	//subrutina para extraer un elemento de una matriz con su fila y columna
    Load getRow              
    Store multParam1        //parametro para 'mult'
    Load getColumns          
    Store multParam2        //parametro para 'mult' 
    JnS mult                //realizar 'i * n'
    Load returnMult          
    Add getCol              //realizar 'i * n + j'
    Add getIndex            //realizar '(i * n + j) + index' para el offset
    Store getSearch         
    LoadI getSearch         //extraer el elemento del indice en matriz Y
    Store getReturn         
    JumpI get  	//final de subrutina 'get'

/variables get
getRow, DEC 000
getCol, DEC 000
getResult, DEC 000
getIndex, HEX 000
getSearch, HEX 000
getColumns, DEC 000
getSize, DEC 000
getReturn, DEC 000

printNumber, HEX 000	//subrutina para imprimir numeros
	Load num
	Skipcond 000	//condicion para ver si el numero es negativo
    Jump positive
    Load Neg	//si es negativo, se imprime "-"
	Output
	Load Zero	//se convierte el numero a positivo
	Subt num
	Store num
positive, Load Ten	//una vez que ya es positivo el numero se verifica si esta entre 0-9
	Subt num
	Skipcond 800
    Jump convertLoop
    Load num
    Add FortyEight	//si esta entre 0-9 se imprime el numero ajustando su valor en ASCII
	Output		
	JumpI printNumber	//se termina la subrutina 'printNumber'
convertLoop, Load num	//si el numero es mayor a 10 (tiene 2 o mas digitos)
	Store modParam1
	Load Ten
	Store modParam2
	JnS mod		//se saca el ultimo digito haciendo num % 10
	Load returnMod
	StoreI DigitString	//se guarda cada digito en un array llamado 'DigitString'
    Load num
	Store divParam1		
	Load Ten
	Store divParam2
	JnS div		//se elimina el ultimo digito haciendo num / 10
    Load returnDiv
    Skipcond 400	//si la division num / 10 == 0 se termina para no guardar ceros extra
    Jump contConvert	//si num / 10 != 0 continua el loop
    Jump outputLoop		//si num / 10 = 0 se va directo al output
contConvert, Store num
	Load Six
    Subt DigitString	//se revisa que todavia haya espacio en 'DigitString' para mas digitos
    Skipcond 800
    Jump outputLoop		//si no hay espacio en DigitString, se va directo al output
    Load DigitString	//si hay espacio en DigitString, incrementa el indice para guardar el siguiente digito
	Add One
	Store DigitString
    Jump convertLoop	//regresa al inicio del loop
outputLoop, Load DigitString	//inicio del loop de output, aqui se imprimen las cosas
	Subt Two
    Skipcond 000	//si el indice del array 'DigitString' ya llegó al ultimo digito se detiene el loop
    Jump contOutput	//si no esta en el ultimo digito, continua el loop
    Jump endOutput	//si llego al ultimo digito termina el loop
contOutput, LoadI DigitString	//se carga el valor con el indice actual
	Add FortyEight	//se ajusta a su valor ASCII y se imprime
	Output
	Load DigitString	//se incrementa el indice de 'DigitString'
	Subt One
	Store DigitString
    Jump outputLoop	//se regresa al incio del loop de output
endOutput, Load Two
	Store DigitString	//se resetea el indice de 'DigitString'
    JumpI printNumber	//finaliza la subrutina 'printNumber'

/variables printNumber
num, DEC 000

mult, HEX 000	//funcion para multiplicar un numero por otro
	Load multParam1	//se revisa si el numero es negativo
	Skipcond 000
    Jump nextNum
    Load Zero	//se convierte a positivo
	Subt multParam1
	Store multParam1
    Load isNeg	//si es negativo se resta el indicador
	Subt One
    Store isNeg
nextNum, Load multParam2	//se revisa si el otro numero es negativo
	Skipcond 000
    Jump contMult
    Load Zero	//se convierte a positivo 
	Subt multParam2
	Store multParam2
	Load isNeg	//si es negativo se resta el indicador
	Subt One
	Store isNeg
contMult, Load multParam1
	Store resultMult
loopMult, Load multParam2	//se realiza la multiplicación con sumas repetidas
	Subt countMult
    Skipcond 800
    Jump endMult
	Load resultMult
    Add multParam1
    Store resultMult
    Load countMult
    Add One
    Store countMult
    Jump loopMult
endMult, Load isNeg	//si el indicador es 0 el resultado de la multiplicación se cambia a negativo
	Skipcond 400
    Jump contEndMult	//saltar el cambio a negativo
    Load Zero	//se cambia el resultado a negativo
	Subt resultMult
	Store resultMult
contEndMult, Load resultMult
	Store returnMult	//se carga el resultado en la variable de return
	Load One	//se resetea el contador del loop y el indicador de negativo
	Store countMult
    Store isNeg
	JumpI mult	//finaliza la subrutina 'mult'
    
/variablesMult
multParam1, DEC 000
multParam2, DEC 000
countMult, DEC 001
resultMult, DEC 000
isNeg, DEC 001
returnMult, DEC 000

div, HEX 000		//funcion para dividir un numero para otro
loopDiv, Load divParam1
	Subt divParam2	//se hace la division haciendo restas repetidas 
	Skipcond 000
    Jump contDiv
    Jump endDiv
contDiv, Store divParam1
	Load countDiv	//por cada resta se suma uno al resultado
    Add One
	Store countDiv
	Jump loopDiv
endDiv, Load countDiv	//se guarda el resultado en la variable de return
	Store returnDiv
	Load Zero	//se resetea el contador de resultado
	Store countDiv
	JumpI div	//finaliza la subrutina 'div'
    
/variablesDiv
divParam1, DEC 000
divParam2, DEC 000
countDiv, DEC 000
returnDiv, DEC 000

mod, HEX 000		//modulo: funcion para sacar el modulo de un numero
	Load modParam1
	Store anterior
modLoop, Load modParam1	//se realizan restas repetidas
	Subt modParam2	//si la resta < 0 se termina
	Skipcond 000
    Jump reLoop	//continuar loop
    Jump endMod
reLoop, Store modParam1	
	Store anterior	//se guarda el resultado de la resta para la siguiente vez
	Jump modLoop
endMod, Load anterior	//al terminar, la variable 'anterior' es el resultado del modulo
	Store returnMod
	Load Zero	//se resetean las variables de modulo
	Store anterior
	Store modParam1
	Store modParam2
	JumpI mod	//finaliza la subrutina 'mod'
    
/variablesModulo
modParam1, DEC 000
modParam2, DEC 000
anterior, DEC 000
returnMod, DEC 000

/caracteres
NewLine, DEC 010
Space, DEC 032
X, DEC 088
K, DEC 075
Y, DEC 089
TwoDots, DEC 058
Neg, DEC 045

/numeros
Zero, DEC 000
One, DEC 001
Two, DEC 002
Six, DEC 006
Ten, DEC 010
FortyEight, DEC 048
