package curso_nara;

public class EntrarBalada {
    public static void main (String[] args) {

        int idade = 15;
        boolean amigoDoDono = true;

        if (idade < 18 || amigoDoDono == false) {
            System.out.println("Não pode entrar!");
        }

        if (idade > 18 || amigoDoDono == true) {
            System.out.println("Pode entrar!");
        }

        if (idade < 18 && !amigoDoDono) {
            System.out.println("Não pode entrar");

        } else {
            System.out.println("Pode entrar");
        }
    }
}
