import 'package:flutter/material.dart';

class IntroducaoView extends StatelessWidget {
  const IntroducaoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> blocos = [
      {
        "titulos": ["Dúvidas e inseguranças", "Autonomia e consentimento"],
        "textos": [
          "Durante a preparação para uma cirurgia craniofacial, é natural que surjam dúvidas e inseguranças. "
              "O que observamos na prática clínica é que a forma como essas informações chegam ao paciente ainda é limitada e, muitas vezes, insuficiente.",
          "Embora a autonomia do paciente e o consentimento informado sejam direitos garantidos, "
              "falta um verdadeiro espaço de escuta e entendimento. Explicar um procedimento complexo requer mais do que apenas uma conversa rápida no consultório.",
        ],
      },
      {
        "titulos": ["Novas abordagens", "Propósito do projeto"],
        "textos": [
          "É preciso desenvolver novas formas de explicar o que será feito, respeitando o tempo, a linguagem e o momento de cada pessoa. "
              "As ferramentas devem ser claras, realistas, acessíveis e promover confiança.",
          "Foi com esse olhar ampliado, unindo saúde e educação, que nasceu o propósito deste projeto: "
              "criar estratégias educativas inovadoras para pacientes em cirurgia craniofacial.",
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 74, 127),
        title: const Text(
          "Introdução",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
     body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/image/fundo3.png"),
            fit: BoxFit.cover, 
          //  opacity: 0.15, 
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            const SizedBox(height: 30),

            // Conteúdo dos blocos 
            ...blocos.expand((bloco) {
              return List.generate(bloco["titulos"].length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bloco["titulos"][i],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 45, 96),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bloco["textos"][i],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 17,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
