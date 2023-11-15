import 'no_arvore.dart';

class ArvoreBinaria {
  final NoArvore raiz;

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
}
