import 'dart:math';

import 'package:arvore_binaria/arvore_binaria.dart';
import 'package:arvore_binaria/no_arvore.dart';

void main(List<String> arguments) {
  List<int> valoresInseridos = [];

  final int valorRaiz = Random().nextInt(101);
  print('Valor do Nó Raiz: $valorRaiz');
  ArvoreBinaria arvoreBinaria = ArvoreBinaria(raiz: NoArvore(valorRaiz));

  // Sorteio de 19 números e inserção na árvore
  for (int i = 0; i < 19; i++) {
    int randomNumber = Random().nextInt(101);
    print('Nó inserido: $randomNumber');
    arvoreBinaria.inserirNo(arvoreBinaria.raiz, randomNumber);
    valoresInseridos.add(randomNumber);
  }

  print("\n\nEM ORDEM:\n");
  arvoreBinaria.imprimirEmOrdem(arvoreBinaria.raiz);
  print("\n\nPRÉ ORDEM:\n");
  arvoreBinaria.imprimirPreOrdem(arvoreBinaria.raiz);
  print("\n\nPÓS ORDEM:\n");
  arvoreBinaria.imprimirPosOrdem(arvoreBinaria.raiz);
  print("\n\nEM NÍVEL:\n");
  arvoreBinaria.imprimirEmNivel();

  print('------------------- REMOÇÃO -------------------');

  // Remover 5 nós da árvore
  for (int i = 0; i < 5; i++) {
    int? randomNumber;
    while (!valoresInseridos.contains(randomNumber)) {
      randomNumber = Random().nextInt(101);
      print('Nó a ser removido: $randomNumber');
      arvoreBinaria.removerNo(arvoreBinaria.raiz, randomNumber);
    }
  }

  print("\n\nEM ORDEM:\n");
  arvoreBinaria.imprimirEmOrdem(arvoreBinaria.raiz);
  print("\n\nPRÉ ORDEM:\n");
  arvoreBinaria.imprimirPreOrdem(arvoreBinaria.raiz);
  print("\n\nPÓS ORDEM:\n");
  arvoreBinaria.imprimirPosOrdem(arvoreBinaria.raiz);
  print("\n\nEM NÍVEL:\n");
  arvoreBinaria.imprimirEmNivel();
}
