import 'package:flutter/material.dart';

class ComplicacoesRiscosView extends StatelessWidget {
  const ComplicacoesRiscosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complicações e Riscos Cirúrgicos"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Toda cirurgia envolve riscos, e com a cirurgia craniofacial não é diferente. "
              "Apesar de toda a tecnologia e preparo da equipe, alguns efeitos e complicações podem ocorrer. "
              "Toque nos tópicos abaixo para conhecer melhor:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Complicações mais comuns
            _buildMainCard(
              titulo: "🔄 Complicações mais comuns no pós-operatório",
              conteudo: Column(
                children: [
                  _buildSubCard("Dor",
                      "É comum nos primeiros dias e geralmente controlada com medicamentos prescritos."),
                  _buildSubCard("Edema (inchaço)",
                      "Ocorre no rosto e pode durar alguns dias. Compressas frias e manter a cabeça elevada ajudam a reduzir."),
                  _buildSubCard("Equimoses (manchas roxas)",
                      "Aparecem ao redor dos olhos e bochechas, desaparecendo gradualmente."),
                  _buildSubCard("Dificuldade para abrir a boca",
                      "Mais intensa nos primeiros dias, mas melhora com o tempo e fisioterapia."),
                ],
              ),
            ),

            // Complicações específicas
            _buildMainCard(
              titulo: "⚠️ Complicações específicas",
              conteudo: Column(
                children: [
                  _buildSubCard("Má adaptação das placas",
                      "Em alguns casos, as placas de fixação podem não se adaptar adequadamente."),
                  _buildSubCard("Má oclusão dentária",
                      "Pode ocorrer desalinhamento da mordida após a cirurgia."),
                  _buildSubCard("Obstrução nasal",
                      "Dificuldade para respirar pelo nariz em alguns casos."),
                  _buildSubCard("Parestesia",
                      "Sensação de dormência em regiões da face, temporária ou definitiva."),
                  _buildSubCard("Paralisia facial",
                      "Pode ocorrer em áreas com nervos sensíveis; pode ser temporária ou rara vez permanente."),
                  _buildSubCard("Infecção",
                      "Inflamações locais que podem exigir antibióticos ou drenagem."),
                  _buildSubCard("Necessidade de novos procedimentos",
                      "Alguns pacientes podem precisar de ajustes ou cirurgias adicionais."),
                  _buildSubCard("Complicações graves",
                      "Casos raros podem envolver internação prolongada, UTI ou risco de morte."),
                ],
              ),
            ),

            // Cuidado compartilhado
            _buildMainCard(
              titulo: "🧭 Cuidado compartilhado",
              conteudo: const Text(
                "O sucesso da cirurgia depende também da sua participação:\n\n"
                "• Esclareça dúvidas antes da cirurgia;\n"
                "• Siga todas as orientações médicas;\n"
                "• Compareça aos retornos e acompanhamentos;\n"
                "• Entenda que ajustes podem ser necessários ao longo do tempo.",
                style: TextStyle(fontSize: 15),
              ),
            ),

            // Decisão consciente
            _buildMainCard(
              titulo: "🤝 Decisão consciente, responsabilidade compartilhada",
              conteudo: const Text(
                "Você tem o direito de participar das decisões sobre seu tratamento. "
                "Inclua pessoas de confiança nesse processo para maior segurança. "
                "A equipe médica está comprometida em cuidar de você, mas a sua participação é fundamental.",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card principal (branco)
  Widget _buildMainCard({required String titulo, required Widget conteudo}) {
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
        children: [
          Padding(padding: const EdgeInsets.all(12.0), child: conteudo),
        ],
      ),
    );
  }

  // Subcard (azul claro dentro do branco)
  Widget _buildSubCard(String titulo, String descricao) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blue.shade50,
      child: ExpansionTile(
        leading: const Icon(Icons.arrow_right, color: Colors.blue),
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
          ),
        ],
      ),
    );
  }
}
