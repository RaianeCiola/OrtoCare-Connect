import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../model/avaliacao.dart';
import '../controller/avaliacao_controller.dart';

class QuestionarioView extends StatefulWidget {
  final String? telefoneInicial;
  const QuestionarioView({Key? key, this.telefoneInicial}) : super(key: key);

  @override
  State<QuestionarioView> createState() => _QuestionarioViewState();
}

class _QuestionarioViewState extends State<QuestionarioView> {
  String? genero;
  String? diagnostico;
  int? idade;
  String telefone = "";
  Map<String, int?> respostas = {};  // armazena as respostas das perguntas 1 a 5
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _recursosController = TextEditingController();
  final TextEditingController _comentariosController = TextEditingController();
  bool _carregando = false;
  bool _bloqueado = false; // se o usuário já respondeu
  bool _verificacaoFeita = false; 

// Máscara para entrada de telefone
  final maskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

// Libera recursos quando a tela for fechada
  @override
  void dispose() {
    _telefoneController.dispose();
    _recursosController.dispose();
    _comentariosController.dispose();
    super.dispose();
  }

  Future<void> _verificarTelefone() async {
    final numero = _telefoneController.text.trim();

    // Validação de telefone fixo e celular
    final RegExp regexCelular = RegExp(r'^\(\d{2}\)\s9\d{4}-\d{4}$');
    final RegExp regexFixo = RegExp(r'^\(\d{2}\)\s\d{4}-\d{4}$'); //deixar só o ceelular e tirar esse
    if (!regexCelular.hasMatch(numero) && !regexFixo.hasMatch(numero)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Número inválido. Use o formato (99) 99999-9999 ou (99) 9999-9999.",
          ),
        ),
      );
      return;
    }

    setState(() => _carregando = true);

    try {
      // Consulta no Firestore se o telefone já foi registrado
      final snapshot = await FirebaseFirestore.instance
          .collection('avaliacao_OA')
          .where('telefone', isEqualTo: numero)
          .limit(1)
          .get();

      setState(() {
        _carregando = false;
        telefone = numero;
      });

      if (snapshot.docs.isNotEmpty) {
        // se o usuário já respondeu pergunta se quer ver ou trocar
        final escolha = await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text("Questionário já respondido"),
              content: const Text(
                "Este número já respondeu ao questionário.\n"
                "Deseja ver suas respostas ou informar outro número?",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, 'trocar'),
                  child: const Text("TROCAR NÚMERO"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(ctx, 'ver'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 45, 96),
                  ),
                  child: const Text(
                    "VER RESPOSTAS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );

        if (escolha == 'trocar') {
          _telefoneController.clear();
          return;
        }

        // Se quiser ver respostas preencher e bloquea alteraçao
        final dados = snapshot.docs.first.data();
        setState(() {
          _bloqueado = true;
          _verificacaoFeita = true;
          idade = dados['idade'];
          genero = dados['genero'];
          diagnostico = dados['diagnosticoCirurgia'] ? "Sim" : "Não";
          respostas = {
            "q1": dados['conhecimentoPrevio'],
            "q2": dados['compreensaoPosUso'],
            "q3": dados['confortoDiscussaoRiscos'],
            "q4": dados['clarezaInformacoes'],
            "q5": dados['utilidadeMultimidia'],
            "q6": dados['autonomiaDecisao'],
            "q7": dados['designNavegabilidade'],
            "q8": dados['satisfacaoGeral'],
          };
          _recursosController.text = dados['recursosParaMelhorar'] ?? '';
          _comentariosController.text = dados['comentariosAdicionais'] ?? '';
        });
      } else {
        
        setState(() => _verificacaoFeita = true);
      }
    } catch (e) {
      setState(() => _carregando = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao verificar número: $e")));
    }
  }

//Retorna as altervativas de cada escala Likert conforme a questão
  List<String> _getEscalaLabels(String key) {
    switch (key) {
      case "q1":
        return ["Nenhum conhecimento", "Pouco", "Razoável", "Bom", "Excelente"];
      case "q2":
        return [
          "Nada informado",
          "Pouco informado",
          "Razoável",
          "Bem informado",
          "Muito informado",
        ];
      case "q3":
        return [
          "Nada confortável",
          "Pouco",
          "Razoável",
          "Confortável",
          "Muito confortável",
        ];
      case "q4":
        return [
          "Nada claro",
          "Pouco claro",
          "Razoável",
          "Claro",
          "Muito claro",
        ];
      case "q5":
        return ["Nada útil", "Pouco útil", "Razoável", "Útil", "Muito útil"];
      case "q6":
        return [
          "Nada suficiente",
          "Pouco",
          "Razoável",
          "Suficiente",
          "Muito suficiente",
        ];
      case "q7":
        return [
          "Nada amigável",
          "Pouco",
          "Razoável",
          "Amigável",
          "Muito amigável",
        ];
      case "q8":
        return [
          "Nada satisfeito",
          "Pouco",
          "Razoável",
          "Satisfeito",
          "Muito satisfeito",
        ];
      default:
        return ["1", "2", "3", "4", "5"];
    }
  }

  List<Widget> _buildLikertQuestion(String question, String key) {
    final labels = _getEscalaLabels(key);

    return [
      const SizedBox(height: 10),
      Text(question, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, // 🔹 Aumentado
    height: 1.4,)),
      Column(
        children: List.generate(5, (index) {
          final value = index + 1;
          return RadioListTile<int>(
            title: Text(
              "${value.toString()} - ${labels[index]}",
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),

            value: value,
            groupValue: respostas[key],
            onChanged: _bloqueado
                ? null
                : (val) {
                    setState(() {
                      respostas[key] = val;
                    });
                  },
          );
        }),
      ),
    ];
  }

//tela prprincipal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Questionário",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 74, 127),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: AbsorbPointer(
                absorbing:
                    !_verificacaoFeita, // bloqueia interação até verificar
                child: Opacity(
                  opacity: _verificacaoFeita ? 1 : 0.99,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "INSTRUMENTO DE COLETA DE DADOS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text("Idade:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      TextField(
                        enabled: !_bloqueado,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => idade = int.tryParse(value),
                        controller: TextEditingController(
                          text: idade?.toString() ?? "",
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Digite sua idade",
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text("Gênero:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Column(
                        children:
                            ["Masculino", "Feminino", "Prefiro não informar"]
                                .map(
                                  (g) => RadioListTile<String>(
                                    title: Text(g),
                                    value: g,
                                    groupValue: genero,
                                    onChanged: _bloqueado
                                        ? null
                                        : (v) => setState(() => genero = v),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        "Você já foi diagnosticado com alguma condição que requer cirurgia ortognática?",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Column(
                        children: ["Sim", "Não"]
                            .map(
                              (op) => RadioListTile<String>(
                                title: Text(op),
                                value: op,
                                groupValue: diagnostico,
                                onChanged: _bloqueado
                                    ? null
                                    : (v) => setState(() => diagnostico = v),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),

                      ..._buildLikertQuestion(
                        "Antes de usar o aplicativo, você tinha conhecimento sobre o que é cirurgia ortognática",
                        "q1",
                      ),
                      ..._buildLikertQuestion(
                        "Após usar o aplicativo, você se sente mais informado sobre os procedimentos da cirurgia ortognática",
                        "q2",
                      ),
                      ..._buildLikertQuestion(
                        "Após o uso do aplicativo, você se sente confortável em discutir os riscos associados à cirurgia ortognática",
                        "q3",
                      ),
                      ..._buildLikertQuestion(
                        "O aplicativo apresentou informações de forma clara e de fácil compreensão",
                        "q4",
                      ),
                      //tirar esa pergunta 
                      /* ..._buildLikertQuestion(
                       / "Você considera que os recursos multimídia ajudaram na sua compreensão do tema",
                        "q5",
                      ),*/
                      ..._buildLikertQuestion(
                        "O aplicativo forneceu informações suficientes para ajudá-lo a tomar decisões sobre o seu tratamento",
                        "q6",
                      ),
                      ..._buildLikertQuestion(
                        "O aplicativo apresenta um design amigável e fácil de navegar",
                        "q7",
                      ),
                      ..._buildLikertQuestion(
                        "De modo geral, quão satisfeito você está com a experiência de uso do aplicativo",
                        "q8",
                      ),

                      const SizedBox(height: 16),
                      const Text(
                        "Quais recursos você gostaria de ver aprimorados no aplicativo?" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        enabled: !_bloqueado,
                        controller: _recursosController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Você tem algum comentário ou sugestão adicional?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        enabled: !_bloqueado,
                        controller: _comentariosController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Botão de envio
                      if (!_bloqueado)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              final avaliacao = Avaliacao(
                                idade: idade ?? 0,
                                genero: genero ?? "",
                                diagnosticoCirurgia: diagnostico == "Sim",
                                conhecimentoPrevio: respostas["q1"] ?? 0,
                                compreensaoPosUso: respostas["q2"] ?? 0,
                                confortoDiscussaoRiscos: respostas["q3"] ?? 0,
                                clarezaInformacoes: respostas["q4"] ?? 0,
                                // utilidadeMultimidia: respostas["q5"] ?? 0,
                                autonomiaDecisao: respostas["q6"] ?? 0,
                                designNavegabilidade: respostas["q7"] ?? 0,
                                satisfacaoGeral: respostas["q8"] ?? 0,
                                recursosParaMelhorar: _recursosController.text,
                                comentariosAdicionais:
                                    _comentariosController.text,
                                telefone: telefone,
                              );

                              // Salva dados no Firestore
                              AvaliacaoController().salvarAvaliacao(
                                context,
                                avaliacao,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                25,
                                45,
                                96,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              "ENVIAR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //FUNDO EMBAÇADO 
          if (!_verificacaoFeita)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ), // menos desfoque
                child: Container(
                  color: Colors.white.withOpacity(0.5), //  transparente
                  child: Center(
                    child: SingleChildScrollView(
                      // evita overflow com o teclado
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                      ),
                      child: Card(
                        //  color: const Color.fromARGB(255, 251, 253, 255),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Validação de Acesso",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "O número de telefone é solicitado apenas para registrar a sua resposta. "
                                "Ele não será divulgado nem utilizado para contato, garantindo sua privacidade.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _telefoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [maskFormatter],
                                decoration: const InputDecoration(
                                  labelText: "Telefone",
                                  hintText: "(99) 99999-9999",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _carregando
                                      ? null
                                      : _verificarTelefone,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB( 255,25,45, 96, ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  child: _carregando
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "CONTINUAR",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
