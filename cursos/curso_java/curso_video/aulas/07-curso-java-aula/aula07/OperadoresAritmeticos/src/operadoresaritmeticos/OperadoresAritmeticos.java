/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operadoresaritmeticos;

/**
 *
 * @author GustavoGuanabara
 */
public class OperadoresAritmeticos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        /*  === OPERADORES ARITMÉTICOS SIMPLES === */
        int n1 = 3;
        int n2 = 5;
        float m = (n1 + n2)/2;
        System.out.println("A média é igual a " + m);
        
        /* === OPERADORES UNÁRIOS DE INCREMENTO === */
        int numero = 10;
        int valor = 4 + numero++; // Tente também com o --
        System.out.println(valor);
        System.out.println(numero);
        
        /* === OPERADORES DE INCREMENTO === */
        int x = 4;
        x *= 2; // Similar a x = x + 2
        System.out.println(x);
        
        /* === ARREDONDAMENTO === */
        float v = 8.4f;
        int ar = (int) Math.round(v); // Tente também o ceil e o floor
        System.out.println(ar); 
        
        /* === NÚMEROS ALEATÓRIOS === */
        double ale = Math.random();
        int n = (int) (15 + ale * (50-15)); // Número aleatório de 15 a 50
        System.out.println(n);
    }
    
}
