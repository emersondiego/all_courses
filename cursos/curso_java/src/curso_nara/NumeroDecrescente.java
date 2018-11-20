package curso_nara;

import java.util.Scanner;

public class NumeroDecrescente {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n1 = sc.nextInt();

        for (int n = n1; n >= 0; n = n - 1) {
            System.out.println("Decrescente: " + n);
        }
    }
}