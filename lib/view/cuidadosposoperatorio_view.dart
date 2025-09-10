import 'package:flutter/material.dart';

class CuidadosPosOperatoriosView extends StatelessWidget {
  const CuidadosPosOperatoriosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuidados Pós-operatórios"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "O período após a cirurgia é fundamental para recuperação. "
              "Veja os cuidados organizados por categoria:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            _buildMainCard(
              titulo: "🦷 Cuidados bucais",
              subcards: [
                _buildSubCard("Higiene",
                    "Escove os dentes com cuidado, use fio dental quando possível e prefira enxaguatórios sem álcool."),
                _buildSubCard("Elásticos de contenção",
                    "Use conforme prescrição da equipe, respeitando horários."),
              ],
            ),

            _buildMainCard(
              titulo: "💊 Medicação e acompanhamento",
              subcards: [
                _buildSubCard("Medicamentos",
                    "Tome exatamente como prescritos, sem interromper por conta própria."),
                _buildSubCard("Consultas de retorno",
                    "Compareça a todas as consultas para avaliação da evolução."),
              ],
            ),

            _buildMainCard(
              titulo: "📞 Suporte durante a recuperação",
              subcards: [
                _buildSubCard("Dúvidas ou sintomas",
                    "Informe imediatamente sua equipe em caso de intercorrências."),
                _buildSubCard("Fisioterapia",
                    "Inicie assim que liberado, essencial para recuperação funcional."),
              ],
            ),

            _buildMainCard(
              titulo: "🚶 Atividades e repouso",
              subcards: [
                _buildSubCard("Evitar esforço físico",
                    "Não levante peso, não pratique esportes nos primeiros dias."),
                _buildSubCard("Movimentação em casa",
                    "Caminhe devagar para estimular circulação e prevenir trombose."),
              ],
            ),

            _buildMainCard(
              titulo: "🌡️ Cuidados com inchaço",
              subcards: [
                _buildSubCard("Compressas de gelo",
                    "Use por até 48h, sempre envoltas em um pano fino."),
                _buildSubCard("Exposição ao calor",
                    "Evite ambientes quentes e sol direto, pois aumentam o inchaço."),
              ],
            ),

            _buildMainCard(
              titulo: "🛏️ Posição ao dormir",
              subcards: [
                _buildSubCard("Cabeceira elevada",
                    "Durma com dois travesseiros para ajudar na respiração e reduzir inchaço."),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Card principal (branco)
  Widget _buildMainCard(
      {required String titulo, required List<Widget> subcards}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: ExpansionTile(
        leading: const Icon(Icons.info, color: Colors.blue),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: subcards,
      ),
    );
  }

  // Subcard (azul claro)
  Widget _buildSubCard(String titulo, String descricao) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blue.shade50,
      child: ExpansionTile(
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              descricao,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          )
        ],
      ),
    );
  }
}
