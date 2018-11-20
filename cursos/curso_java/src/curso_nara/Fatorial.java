package curso_nara;

public class Fatorial {
    public static void main (String[] args) {
        long fatorial = 1;
        for (int n = 1; n <= 10; n = n + 1) {
            fatorial = fatorial * n;
        }
        System.out.println("Fatorial de 10: " + fatorial);
    }
}
