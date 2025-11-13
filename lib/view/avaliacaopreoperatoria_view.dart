import 'package:flutter/material.dart';

class AvaliacaoPreOperatoriaView extends StatefulWidget {
  const AvaliacaoPreOperatoriaView({Key? key}) : super(key: key);

  @override
  State<AvaliacaoPreOperatoriaView> createState() =>
      _AvaliacaoPreOperatoriaViewState();
}

class _AvaliacaoPreOperatoriaViewState
    extends State<AvaliacaoPreOperatoriaView> {
  final Set<int> expandedIndices = <int>{}; // guarda o indice dos cards que estão expandidos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 74, 127),
        title: const Text(
          "Avaliação Pré-Operatória",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      /// Fundo com imagem
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/image/fundo3.png"),
            fit: BoxFit.cover, 
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Antes da cirurgia, o paciente passa por uma série de etapas que ajudam a garantir a segurança e o sucesso do procedimento. "
              "Toque nos tópicos abaixo para saber mais:",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            //conteudo dos cards
            _buildMainCard(
              index: 0,
              icon: Icons.medication_liquid,
              titulo: "A primeira conversa: escutando sua história",
              conteudo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tudo começa com a anamnese, que é o momento em que o médico escuta você com atenção. "
                    "Nessa entrevista estruturada, são levantadas informações sobre:\n"
                    "• Seu histórico de saúde;\n"
                    "• Sintomas atuais;\n"
                    "• Hábitos de vida;\n"
                    "• Histórico familiar.\n\n"
                    "Essa etapa é essencial para que o profissional compreenda quem é você como paciente — não só a doença ou condição, mas sua realidade, preocupações e necessidades.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

            _buildMainCard(
              index: 1,
              icon: Icons.search,
              titulo: "O exame físico: observando o que o corpo mostra",
              conteudo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
            
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Logo após a conversa, é realizado o exame físico, no qual o médico observa, toca, escuta e analisa diferentes regiões do corpo. "
                    "Esse exame permite:\n"
                    "• Identificar sinais que o paciente talvez nem tenha percebido;\n"
                    "• Confirmar ou levantar suspeitas clínicas;\n"
                    "• Avaliar a gravidade da situação;\n"
                    "• Ajudar no planejamento da melhor abordagem cirúrgica e terapêutica.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

            _buildMainCard(
              index: 2,
              icon: Icons.image,
              titulo: "Exames de imagem: vendo além do que os olhos alcançam",
              conteudo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Com base nas informações da consulta, o médico pode solicitar exames como:\n"
                    "• Radiografias;\n"
                    "• Tomografias computadorizadas;\n"
                    "• Ressonâncias magnéticas.\n\n"
                    "Esses exames ajudam a confirmar o diagnóstico e permitem planejar a cirurgia em 3D.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

            _buildMainCard(
              index: 3,
              icon: Icons.science,
              titulo: "Exames laboratoriais e avaliações complementares",
              conteudo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Uma vez confirmada a indicação cirúrgica, é hora de avaliar o funcionamento do restante do corpo. São solicitados:\n"
                    "• Hemograma completo e outros exames laboratoriais;\n"
                    "• Radiografia de tórax;\n"
                    "• Eletrocardiograma (ECG);\n"
                    "• Avaliação com outros especialistas, se necessário.\n\n"
                    "Essas análises garantem que o organismo esteja em boas condições para o procedimento.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

            _buildMainCard(
              index: 4,
              icon: Icons.medical_information,
              titulo: "Avaliação com a equipe de anestesia: cuidado personalizado",
              conteudo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  const SizedBox(height: 10),
                  const Text(
                    "Depois dessas etapas, você será avaliado por um médico anestesista. O objetivo é:\n"
                    "• Conhecer seu histórico clínico e eventuais alergias;\n"
                    "• Escolher o método anestésico mais adequado;\n"
                    "• Planejar sua segurança durante a cirurgia e o pós-operatório.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

        
          ],
        ),
      ),
    );
  }

//estrutura do card
  Widget _buildMainCard({
    required int index,
    required IconData icon,
    required String titulo,
    required Widget conteudo,
  }) {
    final isExpanded = expandedIndices.contains(index);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              if (expanded) {
                expandedIndices.add(index);
              } else {
                expandedIndices.remove(index);
              }
            });
          },
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          backgroundColor: isExpanded
              ? const Color.fromARGB(255, 25, 45, 96) 
              : const Color(0xFFE9F2FF), 
          leading: Icon(
            icon,
            color: isExpanded
                ? Colors.white
                : const Color.fromARGB(255, 25, 45, 96),
          ),
          title: Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isExpanded
                  ? Colors.white
                  : const Color.fromARGB(255, 25, 45, 96),
            ),
          ),
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12.0),
              child: conteudo,
            ),
          ],
        ),
      ),
    );
  }
}
