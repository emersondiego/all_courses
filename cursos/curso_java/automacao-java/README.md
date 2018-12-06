# WebDriver com Java

## Requisitos

- IDE (NetBeans, IntelliJ, Eclipse)
- JDK 

### Usando IntelliJ

```
1 - Create New Project
2 - Criar projeto baseado em Maven (gerenciador de dependências)
3 - Informar GroupId e ArtifactId
  Ex. GroupId: br.com.meuPrimeiroTeste / ArtifactId: meuPrimeiroTeste
4 - Escolher repositório e escolher nome do projeto (meu-primeiro-teste) e Finalize
```

### Configurando arquivo pom.xml

``Precisamos de duas depedências: Junit e SeleniumWebdriver``

- [Selenium](https://mvnrepository.com/artifact/org.seleniumhq.selenium/selenium-java)
- [Junit](https://mvnrepository.com/artifact/junit/junit)

1 - Dentro do arquivo pom.xml adicione as dependência do projeto:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>br.com.meuPrimeiroTeste</groupId>
    <artifactId>meuPrimeiroTeste</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- https://mvnrepository.com/artifact/junit/junit -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.seleniumhq.selenium/selenium-java -->
        <dependency>
            <groupId>org.seleniumhq.selenium</groupId>
            <artifactId>selenium-java</artifactId>
            <version>3.141.59</version>
        </dependency>
    </dependencies>
</project>
```

Obs: IntelliJ pergunta se deseja importar automaticamente, confirme.

### Criar arquvos de testes

1 - Em src > tests, criar package chamado test

2 - Criar ua classe java chamada SignTest
Obs: Para uma classe ser considerada de teste é necessário informar @Test, deve forma será importado o Junit para a classe.


3 - No selenium webdriver é necessário que seja apontado o driver que seja utilizado, em nosso caso será o ChromeDriver. Dessa forma devemos fazer o download no [site](http://chromedriver.chromium.org/downloads) e 

- Descompacte o executavel em algum diretório que deseja;
- No código java será necessário informr o path do arquivo, exemplo:
```java
System.setProperty("webdriver.chrome.driver", "/home/emerson/chromedriver");
```

```
Desta forma soeu projeto ja estará pronto para ser automatizado
```

#### Detalhes da classe de teste

```java
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
        System.setProperty("webdriver.chrome.driver", "/home/emerson/chromedriver"); //Caminho do arquivo chromedriver
        WebDriver navegador = new ChromeDriver(); //Instanciando Webdriver

        navegador.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //Incluido espera implicita


        navegador.get("https://automacaocombatista.herokuapp.com/users/new"); //Carregar navegador com url informada

        navegador.findElement(By.name("user[name]")).sendKeys("Testandooo"); //preenche campo definido
        navegador.findElement(By.name("user[lastname]")).sendKeys("Oliveira");
        navegador.findElement(By.name("user[email]")).sendKeys("teste@email.com.br");

        navegador.findElement(By.cssSelector("input[name=\"commit\"]")).click(); //Clicando no botão

        String cadastrado = navegador.findElement(By.id("notice")).getText(); //Guardando texto do elemento numa variavel
        assertEquals("Usuário Criado com sucesso", cadastrado); //Validando o resultado esperado

        navegador.quit(); //Fechando o navegador
    }
}
```