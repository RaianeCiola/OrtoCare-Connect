import 'package:flutter/material.dart';
import '../controller/avaliacao_controller.dart';
import '../model/avaliacao.dart';


class QuestionarioView extends StatefulWidget {
  const QuestionarioView({Key? key}) : super(key: key);

  @override
  State<QuestionarioView> createState() => _QuestionarioViewState();
}

class _QuestionarioViewState extends State<QuestionarioView> {
  // Variáveis de estado
  String? genero;
  String? diagnostico;
  int? idade;
  Map<String, int?> respostas = {};

  // Controladores de texto
  final TextEditingController _recursosController = TextEditingController();
  final TextEditingController _comentariosController = TextEditingController();

  @override
  void dispose() {
    _recursosController.dispose();
    _comentariosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionário"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "INSTRUMENTO DE COLETA DE DADOS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),

              // Idade
              const Text("Idade:"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  idade = int.tryParse(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite sua idade",
                ),
              ),
              const SizedBox(height: 16),

              // Gênero
              const Text("Gênero:"),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Masculino"),
                    value: "Masculino",
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value),
                  ),
                  RadioListTile<String>(
                    title: const Text("Feminino"),
                    value: "Feminino",
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value),
                  ),
                  RadioListTile<String>(
                    title: const Text("Prefiro não informar"),
                    value: "Prefiro não informar",
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Diagnóstico
              const Text("Você já foi diagnosticado com alguma condição que requer cirurgia ortognática?"),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Sim"),
                    value: "Sim",
                    groupValue: diagnostico,
                    onChanged: (value) => setState(() => diagnostico = value),
                  ),
                  RadioListTile<String>(
                    title: const Text("Não"),
                    value: "Não",
                    groupValue: diagnostico,
                    onChanged: (value) => setState(() => diagnostico = value),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Perguntas de múltipla escolha (Likert 1-5)
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
              ..._buildLikertQuestion(
                "Você considera que os recursos multimídia ajudaram na sua compreensão do tema",
                "q5",
              ),
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

              const SizedBox(height: 20),

              // Feedback geral
              const Text("Quais recursos você gostaria de ver aprimorados no aplicativo?"),
              TextField(
                controller: _recursosController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite aqui...",
                ),
              ),
              const SizedBox(height: 16),

              const Text("Você tem algum comentário ou sugestão adicional?"),
              TextField(
                controller: _comentariosController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite aqui...",
                ),
              ),

              const SizedBox(height: 30),

              // Botão enviar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Avaliacao avaliacao = Avaliacao(
                      idade: idade ?? 0,
                      genero: genero ?? "",
                      diagnosticoCirurgia: diagnostico == "Sim",
                      conhecimentoPrevio: respostas["q1"] ?? 0,
                      compreensaoPosUso: respostas["q2"] ?? 0,
                      confortoDiscussaoRiscos: respostas["q3"] ?? 0,
                      clarezaInformacoes: respostas["q4"] ?? 0,
                      utilidadeMultimidia: respostas["q5"] ?? 0,
                      autonomiaDecisao: respostas["q6"] ?? 0,
                      designNavegabilidade: respostas["q7"] ?? 0,
                      satisfacaoGeral: respostas["q8"] ?? 0,
                      recursosParaMelhorar: _recursosController.text,
                      comentariosAdicionais: _comentariosController.text,
                    );

                    AvaliacaoController().salvarAvaliacao(context, avaliacao);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("ENVIAR", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para construir as perguntas Likert (1 a 5)
  List<Widget> _buildLikertQuestion(String question, String key) {
    return [
      const SizedBox(height: 10),
      Text(question, style: const TextStyle(fontWeight: FontWeight.w500)),
      Column(
        children: List.generate(5, (index) {
          int value = index + 1;
          return RadioListTile<int>(
            title: Text(value.toString()),
            value: value,
            groupValue: respostas[key],
            onChanged: (val) {
              setState(() {
                respostas[key] = val;
              });
            },
          );
        }),
      ),
      const SizedBox(height: 10),
    ];
  }
}
