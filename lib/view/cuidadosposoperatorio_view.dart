import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CuidadosPosOperatoriosView extends StatelessWidget {
  const CuidadosPosOperatoriosView({Key? key}) : super(key: key);

  static const Color azulPrincipal = Color(0xFF1E88E5); 
  static const Color azulClaro = Color(
    0xFFE8F3FF,
  ); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Cuidados Pós-Operatórios",
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        //backgroundColor: Color(0xFFE8F3FF),
        //backgroundColor: Color.fromARGB(255, 19, 103, 152),
        backgroundColor: Color.fromARGB(255, 15, 74, 127),
      ),
      //  backgroundColor: Colors.blue.shade50,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              "O período após a cirurgia é fundamental para recuperação. "
              "Veja os cuidados organizados por categoria:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            MainCard(
              // icon: Icons.health_and_safety,
              icon: MdiIcons.toothbrush,
              titulo: "Cuidados bucais",
              subcards: [
                SubCard(
                  titulo: "Higiene",
                  descricao:
                      "• Mantenha a escovação adequada dos dentes, mesmo nos primeiros dias após a cirurgia.\n"
                      "• Ultilize fio dental quando possível.\n"
                      "• Prefira enxaguatórios sem álcool para evitar irritações e promover uma boa cicatrização.",
                ),
                SubCard(
                  titulo: "Elásticos de contenção",
                  descricao:
                      "Caso tenha sido orientado, use os elásticos conforme a prescrição da equipe, respeitando horários e forma de colocação.",
                ),
              ],
            ),

            MainCard(
              icon: Icons.local_pharmacy,
              titulo: "Medicação e acompanhamento",
              subcards: [
                SubCard(
                  titulo: "Medicamentos",
                  descricao:
                      "• Tome os medicamentos nos horários e doses exatas prescritas.\n• Os analgésicos controlam a dor, "
                      "os antibióticos previnem infecções e outros medicamentos ajudam no conforto e cicatrização.\n"
                      "• Não interrompa nenhum medicamento por conta própria, mesmo que se sinta melhor.",
                ),
                SubCard(
                  titulo: "Consultas de retorno",
                  descricao:
                      "•	Compareça a todos os retornos previamente agendados, com a equipe médica e multiprofissional.\n"
                      "•	Esses encontros são essenciais para acompanhar sua evolução e adaptar o tratamento conforme necessário.",
                ),
              ],
            ),

            MainCard(
              icon: Icons.live_help ,
              titulo: "Suporte durante a recuperação",
              subcards: [
                SubCard(
                  titulo: "Dúvidas ou sintomas",
                  descricao:
                      "Informe imediatamente seu médico se notar qualquer intercorrência ou se surgir uma dúvida durante a recuperação",
                ),
                SubCard(
                  titulo: "Fisioterapia",
                  descricao:
                      "Inicie a fisioterapia especializada assim que for liberado pela equipe médica, isso ajudará a evitar rigidez e acelerará sua recuperação funcional.",
                ),
              ],
            ),

            MainCard(
              icon: Icons.directions_walk,
              titulo: "Atividades e repouso",
              subcards: [
                SubCard(
                  titulo: "Evitar esforço físico",
                  descricao:
                       "• Evite esforços físicos como levantar peso e praticar esportes nas primeiras 2-3 semanas. "
                      "\n• Seu corpo precisa de energia para cicatrizar.\n• Retorne gradualmente às atividades, "
                      "sempre com a liberação da equipe. ",
                ),
                SubCard(
                  titulo: "Movimentação em casa",
                  descricao:
                     "• Faça caminhadas lentas pela casa várias vezes ao dia para estimular a circulação sanguínea "
                      "e prevenir complicações como trombose.\n• Evite ficar muito tempo na mesma posição.\n "
                      "•Movimente-se com cuidado, especialmente nos primeiros dias quando pode sentir tonturas.",
                ),
              ],
            ),

            MainCard(
              icon: Icons.thermostat,
              titulo: "Cuidados com inchaço",
              subcards: [
                SubCard(
                  titulo: "Compressas de gelo",
                  descricao:
                         "•	Faça compressas geladas por até 48 horas após a cirurgia.\n"
"•	Use sempre um saco plástico envolto em um pano fino ou toalha, para evitar queimaduras na pele.",
                ),
                SubCard(
                  titulo: "Exposição ao calor",
                  descricao:
                      "• Evite ambientes muito quentes, sol direto, banhos quentes prolongados e alimentos "
                      "quentes nas primeiras semanas.\n • O calor dilata os vasos sanguíneos e pode aumentar "
                      "o inchaço e retardar a cicatrização.\n• Mantenha-se em ambiente fresco e confortável.",
                ),
              ],
            ),

            MainCard(
              icon: Icons.bedtime,
              titulo: "Posição ao dormir",
              subcards: [
                SubCard(
                  titulo: "Cabeceira elevada",
                  descricao:
                      "• Durma com a cabeça elevada durante as primeiras semanas.\n "
                      "• Esta posição ajuda a reduzir o inchaço facial, melhora a respiração e proporciona "
                      "mais conforto.\n• Evite dormir de lado ou de bruços para não pressionar as áreas operadas.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MainCard extends StatefulWidget {
  final IconData icon;
  final String titulo;
  final List<Widget> subcards;

  const MainCard({
    Key? key,
    required this.icon,
    required this.titulo,
    required this.subcards,
  }) : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> with TickerProviderStateMixin {
  static const Color azulPrincipal = Color(0xFF1E88E5);

  bool _expanded = false;
  late final AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      vsync: this,  // evita renderização desnecessária
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() { // Libera recursos da animação
    _rotateController.dispose();
    super.dispose();
  }

// Método que alterna entre aberto e fechado
  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _rotateController.forward();
      } else {
        _rotateController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: Column(
        children: [
          // Linha do cabeçalho
          InkWell(
            onTap: _toggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: _expanded
                  ? const Color.fromARGB(255, 25, 45, 96)
                  : Colors.white,
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: _expanded
                        ? Colors.white
                        : const Color.fromARGB(255, 25, 45, 96),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _expanded
                            ? Colors.white
                            : const Color.fromARGB(255, 25, 45, 96),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  RotationTransition( // Tween define o intervalo da rotação 180°
                    turns: Tween<double>( 
                      begin: 0.0,
                      end: 0.5,
                    ).animate(_rotateController),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: _expanded
                          ? Colors.white
                          : const Color.fromARGB(255, 25, 45, 96),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Conteúdo do card 
          AnimatedCrossFade(
            firstChild: Container(height: 0.0),
            secondChild: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(children: widget.subcards),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),  // tempo da animação
          ),
        ],
      ),
    );
  }
}

/// SUBCARD COM SOMBRA E FUNDO AZUL CLARINHO
class SubCard extends StatelessWidget {
  final String titulo;
  final String descricao;

  const SubCard({Key? key, required this.titulo, required this.descricao})
    : super(key: key);

  static const Color azulPrincipal = Color.fromRGBO(25, 45, 96, 1);
  static const Color azulClaro = Color(0xFFE8F3FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 3),  // desloca a sombra para baixo
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          iconColor: azulPrincipal,
          collapsedIconColor: azulPrincipal,
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          collapsedBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                descricao,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
