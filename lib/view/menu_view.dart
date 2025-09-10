import 'package:flutter/material.dart';
import 'package:orto_care/view/avaliacaopreoperatoria_view.dart';
import 'package:orto_care/view/complicacoeseriscos_view.dart';
import 'package:orto_care/view/cuidadosposoperatorio_view.dart';
import 'package:orto_care/view/definicao_view.dart';
import 'package:orto_care/view/introducao_view.dart';
import 'package:orto_care/view/procedimentoscirurgicos_view.dart';

import 'questionario_view.dart';


class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> opcoes = [
      "INTRODUÇÃO",
      "DEFINIÇÕES",
      "AVALIAÇÃO PRÉ OPERATÓRIA",
      "PROCEDIMENTOS CIRÚRGICOS",
      "CUIDADOS PÓS OPERATÓRIO",
      "COMPLICAÇÕES E RISCOS CIRÚRGICOS",
      "QUESTIONÁRIO",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "OrtoCare Connect",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Lista de botões
              Expanded(
                child: ListView.separated(
                  itemCount: opcoes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (opcoes[index] == "INTRODUÇÃO") {
                            Navigator.push(
                              context,
                              MaterialPageRoute( builder: (context) =>  IntroducaoView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "DEFINIÇÕES") {
                            Navigator.push(
                              context,
                              MaterialPageRoute( builder: (context) =>  DefinicaoView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "AVALIAÇÃO PRÉ OPERATÓRIA") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AvaliacaoPreOperatoriaView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "PROCEDIMENTOS CIRÚRGICOS") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProcedimentosCirurgicosView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "CUIDADOS PÓS OPERATÓRIO") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CuidadosPosOperatoriosView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "COMPLICAÇÕES E RISCOS CIRÚRGICOS") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ComplicacoesRiscosView(),
                              ),
                            );
                          }
                          if (opcoes[index] == "QUESTIONÁRIO") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuestionarioView(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          opcoes[index],
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
