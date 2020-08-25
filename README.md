# TP-MyS
## Trabajo Práctico Final - Microarquitecturas y Softcores

<div class=text-justify>
El presente trabajo práctico corresponde al desarrollo de una calculadora que permite realizar cuatro funciones básicas, que son la de sumar, restar, multiplicar y dividir números enteros utilizando VHDL como lenguaje de programación.</div>

<div class=text-justify>Se utilizó el componente desarrollado (Calculadora) para crear una IP mediante el IP Packager de Vivado, seguidamente se creó un proyecto que 
conecta la IP generada y una IP que permite controlar los led de la placa Arty Z7-10 (para visualizar la operación realizada) al sistema de procesamiento ZYNQ7 utilizando el bus AXI4 Lite, se desarrolló una interfaz con un menú en lenguaje C que permite a un usuario ingresar la operación a realizar y mostrar el resultado del mismo.</div>