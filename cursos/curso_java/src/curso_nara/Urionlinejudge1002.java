package curso_nara;

import java.util.Scanner;

public class Urionlinejudge1002 {
    public static void main(String[] args) {
        double n = 3.14159;

        Scanner sc = new Scanner(System.in);
        double raio = sc.nextDouble();

        double area = n * raio * raio;
        System.out.println(String.format("A=%.4f", area));
    }
}
