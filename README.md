# ConvolucionMARIE
Proyecto Final de Organización de Computadores. Este proyecto implementa una convolución en el lenguaje ensamblador de MARIE y provee herramientas complementarias en Java y Python para facilitar la verificación y la generación de datos. A continuación, se describen los archivos incluidos y sus funciones:


## Archivos del proyecto:

1. convolucionMARIE.asm
Este archivo contiene el código fuente en ensamblador para la máquina MARIE que realiza la operación de convolución entre dos matrices, X y Y. Este programa simula el cálculo directo de convoluciones en MARIE, mostrando el resultado paso a paso para su comprensión y análisis.

2. ConvolucionComprobacion.java
Este archivo es un programa en Java diseñado para validar los resultados obtenidos en MARIE. Implementa la misma operación de convolución que el código de MARIE pero con una ejecución más rápida y moderna.
Permite a los usuarios comparar los resultados entre MARIE y una implementación funcional en Java para asegurarse de que el programa en ensamblador funciona correctamente.

3. generadorMatriz.ipynb
Este archivo es un cuaderno de Python Jupyter Notebook que ayuda a generar las matrices X y Y necesarias para el cálculo de la convolución.
Genera matrices con dimensiones y valores personalizados ingresados por el usuario.
Los resultados pueden copiarse fácilmente y pegarse en el código de MARIE o en el programa en Java para realizar pruebas consistentes.


## Instrucciones de uso:

Generar las matrices X y Y:

Abra el archivo generadorMatriz.ipynb en Jupyter Notebook o cualquier entorno compatible.
Ejecute el código para generar las matrices X y Y.
Copie los valores generados y péguelos en las variables correspondientes del código en MARIE y Java.
Ejecutar el programa en MARIE:

Cargue el archivo convolucionMARIE.asm en el ensamblador de MARIE.
Ejecute el programa y anote los resultados de la convolución.
Verificar los resultados en Java:

Compile y ejecute ConvolucionComprobacion.java.
Asegúrese de ingresar las mismas matrices X y Y utilizadas en MARIE.
Compare los resultados obtenidos en Java con los generados en MARIE.


## Requisitos:

MARIE: Un entorno para ensamblar y ejecutar código MARIE.

Java: Un entorno JDK (Java Development Kit) para compilar y ejecutar el archivo Java.

Python: Un intérprete de Python con soporte para Jupyter Notebook instalado.


## Propósito del proyecto:

Este proyecto tiene como objetivo:

Demostrar el funcionamiento de un cálculo de convolución en MARIE, un lenguaje diseñado para enseñar conceptos básicos de arquitectura de computadoras.
Proporcionar herramientas auxiliares (Java y Python) para validar y facilitar la experimentación con la implementación en MARIE.
