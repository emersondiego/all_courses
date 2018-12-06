package tests;

import static org.junit.Assert.*;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class SignTest {
    @Test
    public void testFazerLoginNoTaskit() {
        System.setProperty("webdriver.chrome.driver", "/home/emerson/chromedriver");
        WebDriver navegador = new ChromeDriver();
        navegador.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);

        navegador.get("https://automacaocombatista.herokuapp.com/users/new");
        navegador.findElement(By.name("user[name]")).sendKeys("Testandooo");
        navegador.findElement(By.name("user[lastname]")).sendKeys("Oliveira");
        navegador.findElement(By.name("user[email]")).sendKeys("teste@email.com.br");
        navegador.findElement(By.cssSelector("input[name=\"commit\"]")).click();

        String cadastrado = navegador.findElement(By.id("notice")).getText();
        assertEquals("Usuário Criado com sucesso", cadastrado);

        navegador.quit();
    }
}
