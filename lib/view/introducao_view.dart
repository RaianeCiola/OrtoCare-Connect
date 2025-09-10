import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroducaoView extends StatelessWidget {
  final List<Map<String, dynamic>> topicos = [
    {
      "icone": FontAwesomeIcons.userDoctor,
      "titulo": "Dúvidas e inseguranças",
      "texto":
          "Durante a preparação para uma cirurgia craniofacial, é natural que surjam dúvidas e inseguranças. "
          "Muitas vezes, as informações passadas ao paciente ainda são limitadas ou insuficientes.",
    },
    {
      "icone": FontAwesomeIcons.handHoldingMedical,
      "titulo": "Autonomia e consentimento",
      "texto":
          "O consentimento informado é um direito garantido, mas explicar procedimentos complexos exige mais do que uma conversa rápida no consultório. "
          "É preciso espaço de escuta e diálogo verdadeiro.",
    },
    {
      "icone": FontAwesomeIcons.images,
      "titulo": "Limitações das imagens",
      "texto":
          "Imagens de 'antes e depois' são comuns, mas podem gerar expectativas irreais. "
          "Instituições médicas, como a SBCP, desencorajam seu uso como única forma de orientação.",
    },
    {
      "icone": FontAwesomeIcons.lightbulb,
      "titulo": "Novas formas de orientar",
      "texto":
          "Explicações devem respeitar o tempo e a linguagem de cada paciente. "
          "Ferramentas educativas mais claras e acessíveis ajudam a criar confiança.",
    },
    {
      "icone": FontAwesomeIcons.bookMedical,
      "titulo": "Propósito do projeto",
      "texto":
          "Este aplicativo nasceu com o objetivo de unir saúde e educação, criando recursos que ajudem pacientes a entender melhor a cirurgia ortognática.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Introdução"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: topicos.length,
        itemBuilder: (context, index) {
          final item = topicos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ExpansionTile(
              leading: Icon(item["icone"], color: Colors.blue),
              title: Text(
                item["titulo"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item["texto"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
