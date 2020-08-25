# TP-MyS
## Trabajo Práctico Final - Microarquitecturas y Softcores

El presente trabajo práctico corresponde al desarrollo de una calculadora que permite realizar cuatro funciones básicas, que son la de sumar, restar, multiplicar y dividir números enteros utilizando VHDL como lenguaje de programación.

Se utilizó el componente desarrollado (Calculadora) para crear una IP mediante el IP Packager de Vivado, seguidamente se creó un proyecto que 
conecta la IP generada y una IP que permite controlar los led de la placa Arty Z7-10 (para visualizar la operación realizada) al sistema de procesamiento ZYNQ7 utilizando el bus AXI4 Lite, se desarrolló una interfaz con un menú en lenguaje C que permite a un usuario ingresar la operación a realizar y mostrar el resultado del mismo.

El módulo Sumador/Restador permite realizar la suma/resta de número enteros con signo, característica no implementada en los módulos División y Multiplicación que solo admite número enteros sin signo

<img src="https://github.com/KayboProject/TP-MyS/blob/master/image/Screenshot_4.jpg" width="200" height="200" /><img src="https://github.com/KayboProject/TP-MyS/blob/master/image/Screenshot_3.jpg" width="500"/>

### Presentación
[https://docs.google.com/presentation/d/1-NR2PYbzTOPi50rXaUMDl-ZQHtH8nMT3KsmR6dgMCA4/edit#slide=id.p1](https://docs.google.com/presentation/d/1-NR2PYbzTOPi50rXaUMDl-ZQHtH8nMT3KsmR6dgMCA4/edit#slide=id.p1)
