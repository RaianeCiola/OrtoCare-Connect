import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class TCLEView extends StatefulWidget {
  const TCLEView({Key? key}) : super(key: key);

  @override
  State<TCLEView> createState() => _TCLEViewState();
}

class _TCLEViewState extends State<TCLEView> {
  bool aceitouTermo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Termo de Consentimento Livre e Esclarecido',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TÍTULO DO PROJETO
                      Text(
                        'Orto Care Connect',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'É um objeto de aprendizagem para esclarecimentos aos pacientes dos procedimentos e riscos da cirurgia ortognática.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),

                      // RESPONSÁVEL
                      Text(
                        'Responsável pelo projeto',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Decio de Queiroz Telles Filho'),
                      SizedBox(height: 8),
                      Text(
                        'Orientador',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Prof. Dr. Rodrigo de Oliveira Plotze'),
                      SizedBox(height: 16),

                      // JUSTIFICATIVA
                      Text(
                        '1 - Justificativa da pesquisa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'A cirurgia ortognática é um procedimento complexo que envolve o reposicionamento dos ossos da face para corrigir problemas de mordida e alinhamento facial. Muitos pacientes enfrentam dificuldades em compreender plenamente os procedimentos envolvidos e os riscos associados. Um objeto de aprendizagem que forneça informações detalhadas e acessíveis pode ajudar a preencher essa lacuna de conhecimento e melhorar a comunicação entre médicos, pacientes e familiares.\n\n'
                        'A decisão de se submeter a uma cirurgia ortognática é um momento importante e pode ser difícil para os pacientes. Um objeto de aprendizagem pode fornecer informações claras e imparciais sobre procedimentos, possíveis complicações e resultados esperados, permitindo decisões bem informadas.\n'
                        'A ansiedade pré-operatória é comum. O OA pode ajudar a reduzir a ansiedade e fornecer uma comunicação adicional entre médico e paciente.\n'
                        'O OA pode ser acessado em diferentes dispositivos, tornando o conteúdo disponível a todos.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),


                      // LOCAL DO ESTUDO
                      Text(
                        '2 - Local do estudo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ambulatório de especialidades do Centro Médico da UNIMED e Clínica Sabra, Santos-SP.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),

                      // PROCEDIMENTOS
                      Text(
                        '3 - Procedimentos a que você será submetido',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Você será convidado a utilizar um aplicativo que esclarece os procedimentos cirúrgicos e, em seguida, responder a um questionário sobre o conteúdo e sua experiência.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),

                      // ASPECTOS ÉTICOS
                      Text(
                        '4 - Aspectos éticos da pesquisa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Não há procedimentos invasivos. O consentimento é necessário para informações pessoais. Você pode retirar o consentimento a qualquer momento sem prejuízo.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),

                      // OUTRAS INFORMAÇÕES
                      Text(
                        '5 - Outras informações',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'A confidencialidade será mantida. As informações serão utilizadas apenas nesta pesquisa. Não há compensação financeira. Dúvidas podem ser tiradas junto ao Comitê de Ética da UNAERP.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 12),

                      Text(
                        'Ribeirão Preto, _____/____/_____',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 12),

                      Text(
                        'Assinatura do participante:',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Aceitação
              Row(
                children: [
                  Switch(
                    value: aceitouTermo,
                    onChanged: (value) {
                      setState(() {
                        aceitouTermo = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Expanded(
                    child: Text(
                      'Aceito os termos da pesquisa',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Botão CONTINUAR
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: aceitouTermo
                      ? () {
                          Navigator.pushNamed(context, 'menu');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: aceitouTermo
                        ? const Color.fromARGB(255, 25, 45, 96)
                        : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'CONTINUAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Botão SAIR
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).maybePop();
                    Future.delayed(const Duration(milliseconds: 200), () {
                      SystemNavigator.pop();
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 25, 45, 96),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'SAIR',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 25, 45, 96),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
