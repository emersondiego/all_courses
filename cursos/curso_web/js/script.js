// aula aprendendo o basico de java script

//var resposta = confirm("Deseja excluir?");

// console.log(resposta)

// var a = 10;
// var b = 5;

function somar(a,b) {   //aula funcoes
  return a + b;
}

console.log(somar(2,6))


document.getElementById("btn-calcular").onclick = function() {
  var valorA = document.getElementById("valor-a").value;
  var valorB = document.getElementById("valor-b").value;

  // console.log(parseInt(valorA) + parseInt(valorB));
  alert(parseInt(valorA) + parseInt(valorB));

}
