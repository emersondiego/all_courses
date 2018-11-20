package curso_nara;

import java.util.Scanner;

public class Urionlinejudge1013 {
    public static void main (String[] args) {
        Scanner sc = new Scanner(System.in);
        String number = sc.nextLine();

        String[] parts = number.split(" ");
        String p1 = parts[0];
        String p2 = parts[1];
        String p3 = parts[2];

        System.out.println("======CONVERTENDO_PARA_INTEGER============");
        Integer i1 = Integer.valueOf(p1);
        Integer i2 = Integer.valueOf(p2);
        Integer i3 = Integer.valueOf(p3);

        int resultado = (i1 + i2 + Math.abs(i1 - i2)) / 2;

        int res = (resultado + i3 + Math.abs(resultado - i3)) / 2;

        System.out.println("=========================================");
        System.out.println(res + " é o maior");
    }
}