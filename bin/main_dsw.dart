import 'dart:math';

import 'package:arvore_binaria/arvore_binaria.dart';
import 'package:arvore_binaria/no_arvore.dart';

void main(List<String> arguments) {
  List<int> valoresInseridos = [];

  final int valorRaiz = Random().nextInt(101);
  print('Valor do Nó Raiz: $valorRaiz');
  ArvoreBinaria arvoreBinaria = ArvoreBinaria(raiz: NoArvore(valorRaiz));

  // Sorteio de 99 números e inserção na árvore
  for (int i = 0; i < 99; i++) {
    int randomNumber = Random().nextInt(101);
    print('Nó inserido: $randomNumber');
    arvoreBinaria.inserirNo(arvoreBinaria.raiz, randomNumber);
    valoresInseridos.add(randomNumber);
  }

  print("\n\nARVORE:\n");
  arvoreBinaria.imprimirPreOrdem(arvoreBinaria.raiz);
  print("\n\nALTURA: ${arvoreBinaria.alturaArvore(arvoreBinaria.raiz)}\n");

  print("\n\nMétodo DSW:\n");
  print("\n\nConstruindo Arvore Binária Balanciada:\n");

  // Implementação do Algoritmo DSW
  arvoreBinaria.balanceamentoDSW();

  // Acrescenta 20 números na árvore
  for (int i = 0; i < 20; i++) {
    int numeroAleatorio =
        Random().nextInt(101); // Gera números aleatórios de 0 a 100
    arvoreBinaria.inserirNo(arvoreBinaria.raiz, numeroAleatorio);
  }

  // Implementa novamente o Algoritmo DSW para construir uma árvore binária balanceada
  arvoreBinaria.balanceamentoDSW();

  print("\n\nARVORE BALANCEADA:\n");
  arvoreBinaria.imprimirPreOrdem(arvoreBinaria.raiz);
  print("\n\nALTURA: ${arvoreBinaria.alturaArvore(arvoreBinaria.raiz)}\n");
}
