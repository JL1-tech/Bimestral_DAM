import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> Perguntas = [
    {
      'Pergunta': 'Quem é o melhor Professor do Mundo?',
      'opcoes': ['Evaldo', 'Mariano', 'Francisco', 'Todas as Opções'],
      'correta': 'Todas as Opções',
    },
    {
      'Pergunta' : 'Quem é o King do MCVM?',
      'opcoes': ['Evaldo', 'Felipe', 'Karol', 'Cacau'],
      'correta': 'Evaldo',
    },
    {
      'Pergunta': 'Qual a caracteristica que define o Professor Evaldo?',
      'opcoes': ['Evaldo', 'Alegria', 'Tristeza', 'Raiva'],
      'correta': 'Evaldo',
    },
    {
      'Pergunta': 'Quem é o mais Gatão do MCVM?',
      'opcoes': ['Claúdio', 'Lívio', 'Evaldo', 'Sabino'],
      'correta': 'Evaldo',
    },
    {
      'Pergunta': 'Qual camisa de banda o Professor Evaldo mais usa?',
      'opcoes': ['The Beatles', 'Evanescence', 'Queen', 'U2'],
      'correta': 'Evanescence',
    }
  ];

  // Inicializa os valores do Quiz
  int perguntaAtual = 0;
  int pontos = 0;
  String? mensagem;
  bool quizFinalizado = false;

  // Função Resposta
  void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = Perguntas[perguntaAtual]['correta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta) {
        pontos++;
        mensagem = 'Resposta Correta, Cria';
      } else {
        mensagem = 'Errou, Seu Merda';
      }
    });

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        mensagem = null;
        if (perguntaAtual < Perguntas.length - 1) {
          perguntaAtual++;
        } else {
          quizFinalizado = true;
        }
      });
    });
  }

  // Método para reiniciar o quiz
  void reiniciarQuiz() {
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Meu Quiz')),
        body: Center(
          child: quizFinalizado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Boa, Cara', textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    Text('Sua Pontuação: $pontos/${Perguntas.length}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: reiniciarQuiz,
                      child: Text('Recomeçar'),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("data:image/jpeg;base64,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", width: 150, height: 150),
                    SizedBox(height: 20),
                    Text(Perguntas[perguntaAtual]['Pergunta'], textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    ...Perguntas[perguntaAtual]['opcoes'].map<Widget>((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ElevatedButton(
                          onPressed: mensagem == null ? () => verificarResposta(opcao) : null,
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    if (mensagem != null)
                      Text(mensagem!),
                    SizedBox(height: 20),
                    Text('Pontuação: $pontos')  
                  ],
                ),
        ),
      ),
    );
  }
}
