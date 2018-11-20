package curso_nara;

import java.util.Scanner;

public class urionlinejudge1010 {
    public static void main(String[] args) {
        System.out.println("Entre com produtos (cod produto, qtde produto e valor produto)");
        Scanner sc = new Scanner(System.in);

        double valorTotal = 0.0;

        for (int i = 1; i <= 2; i++) {

            int cod = sc.nextInt();
            int qtde = sc.nextInt();
            double valorp = sc.nextDouble();

            double peca = (qtde * valorp);
            System.out.println("Peça"+i+" : " + peca);

            valorTotal = valorTotal + peca;

        }
        System.out.println("VALOR A PAGAR: "+ valorTotal);

    }
}
