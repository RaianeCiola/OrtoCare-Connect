import 'package:flutter/material.dart';

class ComplicacoesRiscosView extends StatefulWidget {
  const ComplicacoesRiscosView({Key? key}) : super(key: key);

  @override
  State<ComplicacoesRiscosView> createState() => _ComplicacoesRiscosViewState();
}

class _ComplicacoesRiscosViewState extends State<ComplicacoesRiscosView> {
  final Set<int> expandedIndices = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 74, 127),

      
        title: FittedBox(
          fit: BoxFit.scaleDown, // faz o texto diminuir se necessário
          child: const Text(
            "Complicações e Riscos Cirúrgicos",
            style: TextStyle(
              color: Colors.white,
            
            ),
          ),
        ),
        centerTitle: true,
      ),

      backgroundColor: Colors.white,
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
              "Toda cirurgia envolve riscos, e com a cirurgia craniofacial não é diferente. "
              "Apesar de toda a tecnologia e preparo da equipe, alguns efeitos e complicações podem ocorrer. "
              "Toque nos tópicos abaixo para conhecer melhor:",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            _buildMainCard(
              index: 0,
              icone: Icons.healing,
              titulo: "Complicações mais comuns no pós-operatório",
              conteudo: Column(
                children: [
                  _buildSubCard("Dor",
                      "A dor é esperada nos primeiros dias após a cirurgia, sendo parte natural do processo de recuperação. Utilizamos medicamentos específicos para mantê-la sob controle, permitindo que você descanse e se recupere com mais conforto. A intensidade diminui progressivamente a cada dia."),
                  _buildSubCard("Edema (inchaço)",
                      "O inchaço no rosto é esperado e tende a ser mais intenso nos primeiros dias. Manter a cabeça elevada e fazer compressas frias ajudam a reduzir o desconforto e aceleram a melhora."),
                  _buildSubCard("Equimoses (manchas roxas)",
                      "São como hematomas que aparecem ao redor dos olhos e bochechas. São temporárias e fazem parte do processo de cicatrizaçãoo. Elas somem naturalmente em cerca de 2 semanas, mudando de cor até desaparecer."),
                  _buildSubCard("Dificuldade para abrir a boca",
                      "A limitação para abrir a boca ocorre devido ao inchaço e adaptação muscular pós-cirúrgica. É temporária e melhora com exercícios específicos e orientação do cirurgião. Com a fisioterapia e o tempo, você recuperará gradualmente os movimentos normais da mandíbula."),
                ],
              ),
            ),
            _buildMainCard(
              index: 1,
              icone: Icons.warning_amber_rounded,
              titulo: "Complicações específicas",
              conteudo: Column(
                children: [
                  _buildSubCard("Má adaptação das placas",
                      "As placas e parafusos de titânio usados para fixar os ossos podem, em casos raros, não se adaptar perfeitamente. Em alguns casos, pode causar algum desconforto ou adaptação inadequada, onde pode ser necessário uma pequena intervenção para ajuste ou remoção."),
                  _buildSubCard("Má oclusão dentária",
                      "É quando os dentes superiores e inferiores não encaixam perfeitamente após a cirurgia. Se ocorrer, é feito o acompanhamento pelo cirurgião e ortodontista e costuma ser ajustado com o uso de elásticos e aparelho ortodôntico ou, em casos específicos, com um pequeno reposicionamento cirúrgico. \n"
                       "Seu ortodontista acompanhará isso de perto."),
                  _buildSubCard("Obstrução nasal",
                      "É comum ter dificuldade para respirar pelo nariz nas primeiras semanas devido ao inchaço interno. Isso melhora gradualmente, mas em alguns casos pode persistir, exigindo cuidados especificos ou medicações para desobstruir as vias aéreas."),
                  _buildSubCard("Parestesia",
                      "É a sensação de dormência ou formigamento em lábios, queixo ou bochechas, que ocorre porque os nervos sensoriais foram reposicionados. Na maioria dos casos é temporária e melhora em meses, mas em uma pequena porcentagem de pacientes pode ser permanente."),
                  _buildSubCard("Paralisia facial",
                      "Diferente da parestesia, aqui há uma dificuldade de movimentar alguns músculos da face. Na maioria das vezes é temporário e ocorre se algum nervo for afetado durante o procedimento. Casos permanentes são muito raros e a equipe toma todos os cuidados para preservar esses nervos durante a cirurgia."),
                  _buildSubCard("Infecção",
                      "Como em qualquer cirurgia, existe risco de infecção na região operada. A higiene bucal adequada, o uso correto dos antibióticos e o acompanhamento regular reduzem significativamente esse risco."),
                  _buildSubCard("Necessidade de novos procedimentos",
                      "Em alguns casos, pode ser necessário realizar pequenas cirurgias complementares ou ajustes ortodônticos para aperfeiçoar o resultado final. Isso faz parte do processo de reabilitação."),
                  _buildSubCard("Complicações graves",
                      "São muito raras, mas podem incluir sangramentos importantes, internação prolongada ou complicações respiratórias. A equipe médica é treinada para prevenir e tratar qualquer intercorrência com segurança."),
                ],
              ),
            ),
            _buildMainCard(
              index: 2,
              icone: Icons.handshake,
              titulo: "Cuidado compartilhado",
              conteudo: const Text(
                "O sucesso da cirurgia depende também da sua participação:\n\n"
                "• Esclareça dúvidas antes da cirurgia;\n"
                "• Siga todas as orientações médicas;\n"
                "• Compareça aos retornos e acompanhamentos;\n"
                "• Entenda que ajustes podem ser necessários ao longo do tempo.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
            _buildMainCard(
              index: 3,
              icone: Icons.people_alt,
              titulo: "Decisão consciente, responsabilidade compartilhada",
              conteudo: const Text(
                "Você tem o direito de participar das decisões sobre seu tratamento. "
                "Inclua pessoas de confiança nesse processo para maior segurança. "
                "A equipe médica está comprometida em cuidar de você, mas a sua participação é fundamental.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard({
    required int index,
    required IconData icone,
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
            icone,
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

  Widget _buildSubCard(String titulo, String descricao) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color.fromARGB(255, 244, 244, 244),
      elevation: 3,
      child: ExpansionTile(
        title: Text(
          titulo,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black),
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
