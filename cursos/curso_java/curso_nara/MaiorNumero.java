package curso_nara;
import java.util.Scanner;

public class MaiorNumero {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n1 = sc.nextInt();
        int n2 = sc.nextInt();

        if (n1 > n2) {
            System.out.println("O primeiro numero digitado é maior");
        } else if (n1 < n2) {
            System.out.println("O segundo numero digitado é maior");
        } else if (n1 == n2) {
            System.out.println("Numeros digitados são iguais");
        }
    }
}
