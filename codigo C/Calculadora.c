#include "xparameters.h"
#include "calculadora_ip.h"
#include "led_ip.h"
#include "xil_io.h"
//====================================================

int main (void) 
{

	    char opcion;
	    char continuar;
	    int OpA, OpB, resto;
	    int  result;
	    do
	    {
	    	xil_printf( "\n\n   >>> MENU CALCULADORA <<<" );
	    	xil_printf( "\n\n   1. Sumar dos numeros.", 163 );
	    	xil_printf( "\n   2. Restar dos numeros.", 163 );
	    	xil_printf( "\n   3. Multiplicar dos numeros positivos.", 163 );
	    	xil_printf( "\n   4. Dividir dos numeros positivos.", 163 );
	    	xil_printf( "\n   5. Salir.\n" );
	    	LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, 0);
	        /* Filtramos la opción elegida por el usuario */
	    	xil_printf( "\n   Introduzca opcion (1-5): ", 162 );
	        do
	        {
	            scanf( "%c", &opcion);

	        } while ( opcion < '1' || opcion > '5' );
	        /* La opción sólo puede ser '1', '2', '3', '4' o '5' */

	        switch ( opcion )
	        {
	                      /* Opción 1: Sumar */
	            case '1': xil_printf( "\n   Introduzca primer sumando: " );
	            		  LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, 1); //enciendo LED 1
	                      scanf( "%d", &OpA);
	                      xil_printf( "\n   Introduzca segundo sumando: " );
	                      scanf( "%d", &OpB);
	                      CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG0_OFFSET, OpA);
	                      CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG1_OFFSET, OpB);
	                      CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG2_OFFSET, 0);
	                      result = CALCULADORA_IP_mReadReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG4_OFFSET);
	                      xil_printf( "\n   %d + %d = %d\n", OpA, OpB, result);
	                      break;
	                      /* Opción 2: Restar */
	            case '2': xil_printf( "\n   Introduzca minuendo: " );
	            		  LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, 2); //enciendo LED 2
	                      scanf( "%d", &OpA);
	                      xil_printf( "\n   Introduzca sustraendo: " );
	                      scanf( "%d", &OpB);
						  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG0_OFFSET, OpA);
						  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG1_OFFSET, OpB);
						  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG2_OFFSET, 1);
						  result = CALCULADORA_IP_mReadReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG4_OFFSET);
						  xil_printf( "\n   %d - %d = %d\n", OpA, OpB, result );
	                      break;

	                      /* Opción 3: Multiplicar */
	            case '3': xil_printf( "\n   Introduzca primer operando: " );
	            		  LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, 4); //enciendo LED 3
	                      scanf( "%d", &OpA);
	                      xil_printf( "\n   Introduzca segundo operando: " );
	                      scanf( "%d", &OpB);
	                      if (( OpA >= 0 )&&( OpB >= 0 )){
	                    	  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG0_OFFSET, OpA);
	                    	  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG1_OFFSET, OpB);
	                    	  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG2_OFFSET, 2);
	                    	  result = CALCULADORA_IP_mReadReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG4_OFFSET);
	                    	  xil_printf( "\n   %d * %d = %d\n", OpA, OpB, result );
	                      }else{
								  xil_printf( "\n   ERROR: los numeros ingresados deben ser positivos.\n" );
								  xil_printf( "\n   %d div %d = ERROR\n", OpA, OpB);
							  }
	                      break;

	                      /* Opción 4: División entera */
	            case '4': xil_printf( "\n   Introduzca dividendo: " );
      		              LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, 8); //enciendo LED 4
	                      scanf( "%d", &OpA);
	                      xil_printf( "\n   Introduzca divisor: " );
	                      scanf( "%d", &OpB);
	                      if (( OpB != 0 )&&( OpA >= 0 )&&( OpB >= 0 )){
	                    	  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG0_OFFSET, OpA);
							  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG1_OFFSET, OpB);
							  CALCULADORA_IP_mWriteReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG2_OFFSET, 3);
							  resto = CALCULADORA_IP_mReadReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG3_OFFSET);
							  result = CALCULADORA_IP_mReadReg(XPAR_CALCULADORA_IP_0_S_AXI_BASEADDR, CALCULADORA_IP_S_AXI_SLV_REG4_OFFSET);
	                    	  xil_printf( "\n   %d div %d = %d resto %d\n", OpA, OpB, result, resto);
	                      }else{
	                    	  if ( OpB != 0 ){
	                    		  xil_printf( "\n   ERROR: No se puede dividir entre cero.\n" );
	                    		  xil_printf( "\n   %d div %d = ERROR\n", OpA, OpB);
	                    	  }
	                    	  if (( OpA >= 0 )&&( OpB >= 0 )){
	                    		  xil_printf( "\n   ERROR: los numeros ingresados deben ser positivos.\n" );
	                    		  xil_printf( "\n   %d div %d = ERROR\n", OpA, OpB);
	                    	  }
	                      }

		}
	        xil_printf( "\nPresione 'c' para continuar", 162 );
	        do{
	        	scanf( "%c", &continuar);
	        } while(continuar!='c');
	    } while ( opcion != '5' );

	    return 0;

}
