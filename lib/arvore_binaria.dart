import 'no_arvore.dart';

class ArvoreBinaria {
  NoArvore raiz;

  ArvoreBinaria({required this.raiz});

  void substituirRaiz(NoArvore raiz) {
    this.raiz.valor = raiz.valor;
    this.raiz.direita = null;
    this.raiz.esquerda = null;
  }

  NoArvore inserirNo(NoArvore? noArvore, int valor) {
    if (noArvore == null) {
      noArvore = NoArvore(valor);
    } else if (valor < noArvore.valor) {
      noArvore.esquerda = inserirNo(noArvore.esquerda, valor);
    } else {
      noArvore.direita = inserirNo(noArvore.direita, valor);
    }
    return (noArvore);
  }

  NoArvore? removerNo(NoArvore? noArvore, int valor) {
    if (noArvore == null) {
      print("Elemento não encontrado..: $valor");
      return noArvore;
    }

    // filho à esquerda
    if (valor < noArvore.valor) {
      noArvore.esquerda = removerNo(noArvore.esquerda, valor);
    }
    // filho à direita
    else if (valor > noArvore.valor) {
      noArvore.direita = removerNo(noArvore.direita, valor);
    }

    //nó sem filhos
    else if ((noArvore.esquerda == null) && (noArvore.direita == null)) {
      if (noArvore.valor == valor) {
        return null;
      } else {
        print("Elemento não encontrado..: $valor");
        return noArvore;
      }
    }
    //nó só tem filho a direita
    else if (noArvore.esquerda == null) {
      return noArvore.direita;
    }
    //nó só tem filho a esquerda
    else if (noArvore.direita == null) {
      return noArvore.esquerda;
    }
    //nó tem 2 filhos
    else {
      NoArvore novo = noArvore.esquerda!;
      while (novo.direita != null) {
        novo = novo.direita!;
      }

      noArvore.valor = novo.valor; //troca de informações
      novo.valor = valor;

      noArvore.esquerda = removerNo(noArvore.esquerda, valor);
    }

    return (noArvore);
  }

  /// Em-ordem: Esquerda -> Raiz -> Direita
  void imprimirEmOrdem(NoArvore? noArvore) {
    if (noArvore != null) {
      imprimirEmOrdem(noArvore.esquerda);
      print(noArvore.valor);
      imprimirEmOrdem(noArvore.direita);
    }
  }

  /// Pré-ordem: Raiz -> Esquerda -> Direita
  void imprimirPreOrdem(NoArvore? noArvore) {
    if (noArvore != null) {
      print(noArvore.valor);
      imprimirPreOrdem(noArvore.esquerda);
      imprimirPreOrdem(noArvore.direita);
    }
  }

  /// Pós-ordem: Esquerda -> Direita -> Raiz
  void imprimirPosOrdem(NoArvore? noArvore) {
    if (noArvore != null) {
      imprimirPosOrdem(noArvore.esquerda);
      imprimirPosOrdem(noArvore.direita);
      print(noArvore.valor);
    }
  }

  // Em nível: Imprime os elementos de cada nível, começando pela raiz
  void imprimirEmNivel() {
    List<NoArvore> nivel = [];
    nivel.add(raiz);

    while (nivel.isNotEmpty) {
      NoArvore tempNode = nivel.removeAt(0);
      print(tempNode.valor);

      if (tempNode.esquerda != null) {
        nivel.add(tempNode.esquerda!);
      }

      if (tempNode.direita != null) {
        nivel.add(tempNode.direita!);
      }
    }
  }

// Algoritmo DSW
  void balanceamentoDSW() {
    // Passo 1: Transformar a árvore em uma lista
    List<NoArvore> nos = [];
    inOrdemToList(raiz, nos);

    // Passo 2: Realizar rotações á direita (simples) para equilibrar a lista
    int qtdNos = nos.length;
    int metadeNos = (qtdNos + 1) ~/ 2;

    for (int i = 0; i < metadeNos; i++) {
      raiz = rotacionarDireita(raiz);
    }

    // Passo 3: Reconstruir a árvore a partir da lista balanceada
    reconstruirArvoreBalanceada(qtdNos);
  }

  // Método auxiliar para adicionar os nós da arvore de forma ordenada à lista de nós
  void inOrdemToList(NoArvore? noArvore, List<NoArvore> nos) {
    if (noArvore != null) {
      inOrdemToList(noArvore.esquerda, nos);
      nos.add(noArvore);
      inOrdemToList(noArvore.direita, nos);
    }
  }

  // Rotação à direita
  NoArvore rotacionarDireita(NoArvore? raiz) {
    if (raiz == null || raiz.esquerda == null) {
      return raiz!;
    }

    NoArvore novaRaiz = raiz.esquerda!;
    raiz.esquerda = novaRaiz.direita;
    novaRaiz.direita = raiz;

    return novaRaiz;
  }

  // Método para reconstruir a árvore a partir da lista balanceada
  void reconstruirArvoreBalanceada(int qtdNos) {
    int mediaAux = qtdNos;

    while (mediaAux > 1) {
      mediaAux ~/= 2;
      raiz = rotacionarEsquerda(raiz, mediaAux);
    }
  }

  // Rotação à esquerda
  NoArvore rotacionarEsquerda(NoArvore? raiz, int mediaAux) {
    NoArvore? tempRaiz = raiz;
    NoArvore? prev;

    for (int i = 0; i < mediaAux && tempRaiz != null; i++) {
      prev = tempRaiz;
      tempRaiz = tempRaiz.direita;
    }

    if (tempRaiz != null) {
      prev!.direita = tempRaiz.esquerda;
      tempRaiz.esquerda = prev;
    } else {
      return prev!;
    }

    return tempRaiz;
  }

  int alturaArvore(NoArvore? noArvore) {
    if (noArvore == null) {
      return 0;
    }

    int alturaEsquerda = alturaArvore(noArvore.esquerda);
    int alturaDireita = alturaArvore(noArvore.direita);

    return 1 +
        (alturaEsquerda > alturaDireita ? alturaEsquerda : alturaDireita);
  }
}
