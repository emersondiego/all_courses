package curso_nara;

import java.util.Scanner;

public class Urionlinejudge1009 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String name = sc.next();
        double salario = sc.nextDouble();
        double vendas = sc.nextDouble();

        double total = salario + vendas * 0.15;

        System.out.print(String.format("TOTAL = R$ %.2f", total));

    }
}