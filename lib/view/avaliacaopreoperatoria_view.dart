import 'package:flutter/material.dart';

class AvaliacaoPreOperatoriaView extends StatelessWidget {
  const AvaliacaoPreOperatoriaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avaliação Pré-operatória"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Antes da cirurgia, o paciente passa por uma série de etapas que ajudam a garantir a segurança e o sucesso do procedimento. "
              "Toque nos tópicos abaixo para saber mais:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            _buildCard(
              icon: Icons.medication_liquid,
              titulo: "🩺 A primeira conversa: escutando sua história",
              texto:
                  "Tudo começa com a anamnese, que é o momento em que o médico escuta você com atenção. "
                  "Nessa entrevista estruturada, são levantadas informações sobre:\n"
                  "• Seu histórico de saúde;\n"
                  "• Sintomas atuais;\n"
                  "• Hábitos de vida;\n"
                  "• Histórico familiar.\n\n"
                  "Essa etapa é essencial para que o profissional compreenda quem é você como paciente — não só a doença ou condição, mas sua realidade, preocupações e necessidades.",
            ),

            _buildCard(
              icon: Icons.search,
              titulo: "🔍 O exame físico: observando o que o corpo mostra",
              texto:
                  "Logo após a conversa, é realizado o exame físico, no qual o médico observa, toca, escuta e analisa diferentes regiões do corpo. "
                  "Esse exame permite:\n"
                  "• Identificar sinais que o paciente talvez nem tenha percebido;\n"
                  "• Confirmar ou levantar suspeitas clínicas;\n"
                  "• Avaliar a gravidade da situação;\n"
                  "• Ajudar no planejamento da melhor abordagem cirúrgica e terapêutica.",
            ),

            _buildCard(
              icon: Icons.image,
              titulo: "🖼️ Exames de imagem: vendo além do que os olhos alcançam",
              texto:
                  "Com base nas informações da consulta, o médico pode solicitar exames de imagem, como:\n"
                  "• Radiografias;\n"
                  "• Tomografias computadorizadas;\n"
                  "• Ressonâncias magnéticas.\n\n"
                  "Esses exames ajudam a confirmar o diagnóstico, entender melhor o quadro clínico e, quando necessário, programar a cirurgia com o uso de tecnologia 3D.",
            ),

            _buildCard(
              icon: Icons.science,
              titulo: "🧪 Exames laboratoriais e avaliações complementares",
              texto:
                  "Uma vez confirmada a indicação cirúrgica, é hora de avaliar o funcionamento do restante do corpo. São solicitados:\n"
                  "• Hemograma completo e outros exames laboratoriais;\n"
                  "• Radiografia de tórax;\n"
                  "• Eletrocardiograma (ECG);\n"
                  "• Avaliação com outros especialistas, se necessário.\n\n"
                  "Essas análises garantem que o organismo esteja em boas condições para o procedimento.",
            ),

            _buildCard(
              icon: Icons.medical_information,
              titulo: "😷 Avaliação com a equipe de anestesia: cuidado personalizado",
              texto:
                  "Depois dessas etapas, você será avaliado por um médico anestesista. O objetivo é:\n"
                  "• Conhecer seu histórico clínico e eventuais alergias;\n"
                  "• Escolher o método anestésico mais adequado;\n"
                  "• Planejar sua segurança durante a cirurgia e o pós-operatório.",
            ),

            _buildCard(
              icon: Icons.favorite,
              titulo: "💬 Estamos com você em cada passo",
              texto:
                  "Cada fase faz parte de um cuidado completo. "
                  "Nosso compromisso é garantir que você compreenda todas as etapas com tranquilidade e confiança.",
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
