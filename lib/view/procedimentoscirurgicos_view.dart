import 'package:flutter/material.dart';

class ProcedimentosCirurgicosView extends StatelessWidget {
  const ProcedimentosCirurgicosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Procedimentos Cirúrgicos"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "A cirurgia ortognática é realizada com planejamento cuidadoso, "
              "envolvendo diferentes etapas que garantem segurança e bons resultados. "
              "Explore os tópicos abaixo para entender melhor cada fase do procedimento:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            _buildCard(
              icon: Icons.medical_services,
              titulo: "🔹 O que acontece durante a cirurgia",
              texto:
                  "A cirurgia ortognática consiste em reposicionar os ossos da face (maxila, mandíbula ou ambos) "
                  "para melhorar a mordida, a função respiratória e a estética facial. "
                  "Os cortes são feitos internamente, evitando cicatrizes visíveis no rosto.",
            ),

            _buildCard(
              icon: Icons.account_tree,
              titulo: "🔹 Tipos de cirurgia ortognática",
              texto:
                  "• Cirurgia da maxila: corrige alterações no osso superior.\n"
                  "• Cirurgia da mandíbula: ajusta o osso inferior.\n"
                  "• Cirurgia bimaxilar: combina os dois procedimentos para maior equilíbrio funcional e estético.",
            ),

            _buildCard(
              icon: Icons.computer,
              titulo: "🔹 Aparelhos e guias cirúrgicos",
              texto:
                  "O planejamento cirúrgico é realizado com softwares 3D. "
                  "Com eles, são confeccionados guias cirúrgicos e placas personalizadas, "
                  "que ajudam o cirurgião a realizar cortes precisos e seguros.",
            ),

            _buildCard(
              icon: Icons.access_time,
              titulo: "⏱️ Tempo de duração da cirurgia",
              texto:
                  "O tempo varia de acordo com a complexidade do caso, mas em média dura entre 4 e 6 horas.",
            ),

            _buildCard(
              icon: Icons.local_hospital,
              titulo: "🏥 Internação hospitalar",
              texto:
                  "Após a cirurgia, o paciente permanece internado por aproximadamente 2 a 3 dias, "
                  "para observação e primeiros cuidados, antes de receber alta.",
            ),

            _buildCard(
              icon: Icons.groups,
              titulo: "👩‍⚕️ Equipe envolvida",
              texto:
                  "O procedimento é realizado por uma equipe multiprofissional, que inclui:\n"
                  "• Cirurgião bucomaxilofacial;\n"
                  "• Anestesiologista;\n"
                  "• Ortodontista;\n"
                  "• Equipe de enfermagem e outros especialistas, se necessário.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String titulo,
    required String texto,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue.shade50, // fundo azul clarinho
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              texto,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          )
        ],
      ),
    );
  }
}
