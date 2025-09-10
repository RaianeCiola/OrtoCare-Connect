import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefinicaoView extends StatelessWidget {
  final List<Map<String, dynamic>> topicos = [
    {
      "icone": FontAwesomeIcons.userDoctor,
      "titulo": "O que é Cirurgia Reparadora da Face?",
      "texto":
          "É uma área da cirurgia plástica que busca restaurar a forma e a função de partes do corpo afetadas por condições congênitas, acidentes, doenças ou cirurgias prévias. "
          "Além disso, pode também trazer melhorias estéticas, sempre respeitando a individualidade de cada paciente.",
    },
    {
      "icone": FontAwesomeIcons.peopleArrows,
      "titulo": "Reparadora x Estética",
      "texto":
          "A cirurgia plástica possui dois grandes ramos:\n"
          "- Reparadora: corrige malformações e recupera funções como mastigação, fala e respiração.\n"
          "- Estética: busca harmonizar proporções do corpo e rosto.\n"
          "Na prática, muitas vezes as duas áreas se complementam.",
    },
    {
      "icone": FontAwesomeIcons.brain,
      "titulo": "Cirurgia Crânio-Maxilo-Facial",
      "texto":
          "Subespecialidade da cirurgia plástica dedicada ao tratamento de deformidades, traumas e alterações ósseas do crânio e da face. "
          "Requer treinamento especializado e, frequentemente, trabalho em equipe com ortodontistas, fonoaudiólogos, otorrinos, psicólogos e outros profissionais.",
    },
    {
      "icone": FontAwesomeIcons.notesMedical,
      "titulo": "Quando é indicada?",
      "texto":
          "Situações comuns em que a cirurgia reparadora da face pode ser recomendada:\n"
          "🦷 Deformidades dentofaciais (cirurgia ortognática)\n"
          "👶 Malformações congênitas (como fissuras labiopalatinas)\n"
          "🤕 Traumas na face (fraturas ósseas)\n"
          "🎗️ Tratamento de tumores\n"
          "😮‍💨 Transtornos da articulação temporomandibular (ATM)\n"
          "😴 Apneia obstrutiva do sono (SAHOS)\n"
          "🧠 Uso de tecnologias como impressão 3D e planejamento virtual",
    },
    {
      "icone": FontAwesomeIcons.userNurse,
      "titulo": "Quem realiza?",
      "texto":
          "O cirurgião plástico craniofacial é o profissional capacitado para esses procedimentos. "
          "Ele atua em conjunto com equipes multiprofissionais, especialmente em casos de fissuras labiopalatinas e tratamentos complexos.",
    },
    {
      "icone": FontAwesomeIcons.heart,
      "titulo": "Nossa missão",
      "texto":
          "Mais do que uma técnica, a cirurgia reparadora da face busca devolver função, forma, autoestima e qualidade de vida. "
          "O cuidado começa sempre com informação clara, escuta atenta e um plano individualizado.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Definição"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Entendendo a Cirurgia Reparadora da Face",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            "A cirurgia reparadora da face une ciência, técnica e sensibilidade. "
            "Ela pode ser necessária em diferentes situações e envolve profissionais de várias áreas da saúde, "
            "sempre com foco no cuidado integral ao paciente.",
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          ...topicos.map((item) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
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
          }).toList(),
        ],
      ),
    );
  }
}
