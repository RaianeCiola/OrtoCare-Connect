import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefinicaoView extends StatefulWidget {
  @override
  _DefinicaoViewState createState() => _DefinicaoViewState();
}

class _DefinicaoViewState extends State<DefinicaoView> {
  final Set<int> expandedIndices = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 15, 74, 127),
        title: const Text("Definição", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

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
            const SizedBox(height: 12),
            const Text(
              "A cirurgia reparadora da face é um campo que une ciência e sensibilidade para restaurar a harmonia e a função facial."
              "Envolve técnicas que vão desde a reconstrução de estruturas ósseas até procedimentos que melhoram a estética e o bem-estar do paciente."
              "Toque nos tópicos abaixo para entender melhor seus conceitos e indicações.",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            
            // CARDS 
            _buildMainCard(
              index: 0,
              icone: FontAwesomeIcons.userDoctor,
              titulo: "O que é Cirurgia Reparadora da Face?",
              conteudo: const Text(
                "A cirurgia reparadora da face é uma área da medicina que une ciência, técnica e sensibilidade. "
                "Ela busca restaurar a forma e a função de partes do corpo afetadas por condições congênitas, acidentes, doenças ou cirurgias anteriores "
                "além de promover autoestima e qualidade de vida ao paciente.",
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
            ),

            _buildMainCard(
              index: 1,
              icone: FontAwesomeIcons.peopleArrows,
              titulo: "Reparadora x Estética",
              conteudo: const Text(
                "A cirurgia plástica se divide em dois grandes ramos:\n\n"
                "•	Cirurgia Reparadora: atua para corrigir malformações, repor estruturas perdidas e recuperar funções importantes como a mastigação, a fala ou a respiração.\n"
                "•	Cirurgia Estética: busca harmonizar proporções do corpo ou do rosto, promovendo bem-estar e confiança.\n"
                "\nNa prática, as duas áreas se complementam ao corrigir uma função, muitas vezes também se melhora a estética facial.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),

            _buildMainCard(
              index: 2,
              icone: FontAwesomeIcons.brain,
              titulo: "O que é a Cirurgia Crânio-Maxilo-Facial?",
              conteudo: const Text(
                "É uma subespecialidade da cirurgia plástica voltada para o tratamento de deformidades, traumas e alterações ósseas da face e do crânio. "
                "Exige treinamento especializado e o trabalho conjunto de diferentes profissionais, como ortodontistas, fonoaudiólogos e otorrinos.",
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
            ),

            _buildMainCard(
              index: 3,
              icone: FontAwesomeIcons.notesMedical,
              titulo: "Quando é indicada?",
              conteudo: Column(
                children: [
                  _buildSubCard(
                    "Deformidades dentofaciais (Cirurgia Ortognática)",
                    "Indicada quando há desalinhamento dos ossos da face, afetando a mordida, a estética e a respiração. "
                        "É realizada junto com o ortodontista e busca restabelecer harmonia e função facial.",
                  ),
                  _buildSubCard(
                    "Malformações congênitas",
                    "Incluem fissuras labiopalatinas, craniossinostoses (fechamento precoce do crânio) e microssomias faciais. "
                        "O tratamento é individualizado e visa restaurar a anatomia e as funções faciais.",
                  ),
                  _buildSubCard(
                    "Traumas na face",
                    "Envolve fraturas em ossos faciais, como mandíbula ou órbitas oculares. "
                    "A cirurgia repara as estruturas danificadas e devolve a simetria facial.",
                  ),
                  _buildSubCard(
                    "Tratamento de tumores na face ou crânio",
                    "Após a remoção de tumores benignos ou malignos, são realizadas reconstruções que devolvem a forma e a função à região afetada.",
                  ),
                  _buildSubCard(
                    "Transtornos da articulação temporomandibular (ATM)",
                    "Em casos graves de dor, travamento ou desgaste articular, a cirurgia pode ser indicada para restaurar o movimento e aliviar sintomas.",
                  ),
                  _buildSubCard(
                    "Apneia obstrutiva do sono (SAHOS)",
                    "Para pacientes com apneia severa, a cirurgia pode reposicionar estruturas da face para ampliar as vias respiratórias.",
                  ),
                ],
              ),
            ),

            _buildMainCard(
              index: 4,
              icone: FontAwesomeIcons.userNurse,
              titulo: "Quem realiza esse tipo de cirurgia?",
              conteudo: const Text(
                "O cirurgião plástico craniofacial é o profissional habilitado para atuar em regiões delicadas como o crânio e a face. "
                "Ele trabalha em conjunto com uma equipe multiprofissional "
                "garantindo um tratamento completo e seguro ao paciente.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),

            _buildMainCard(
              index: 5,
              icone: FontAwesomeIcons.heart,
              titulo: "Nossa missão",
              conteudo: const Text(
                "Mais do que reconstruir, a cirurgia reparadora da face tem o propósito de devolver função, forma e autoestima. "
                "Cada caso é planejado com atenção e empatia, garantindo um cuidado integral e humanizado ao paciente.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

//metodo sos cards
  Widget _buildMainCard({
    required int index, //vai identificar o card
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
          onExpansionChanged: (expanded) { // atualiza  para controlar a expansão individual
            setState(() {
              if (expanded) {
                expandedIndices.add(index);
              } else {
                expandedIndices.remove(index);
              }
            });
          },
          //Definição das cores antes e depois da expansão
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

//subcard do quando é indicado
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
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              descricao,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
