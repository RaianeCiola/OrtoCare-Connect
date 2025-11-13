import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'OrtoCare Connect',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 22, 42, 94),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // SOBRE O PROJETO 
              const Text(
                'Sobre o projeto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'O OrtoCare Connect é um aplicativo desenvolvido com o objetivo de oferecer apoio informativo e educativo a pacientes que serão submetidos à cirurgia ortognática. '
                'A plataforma reúne conteúdos sobre as etapas do tratamento, cuidados necessários e orientações importantes para o período pré e pós-operatório, '
                'contribuindo para uma experiência mais tranquila e consciente do paciente.',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),

              const SizedBox(height: 20),

              // PESQUISADORES
              const Text(
                'Pesquisadores responsáveis',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'O projeto foi desenvolvido no âmbito do Mestrado Profissional em Saúde e Educação da Universidade de Ribeirão Preto (UNAERP). '
                'O pesquisador responsável é o mestrando Décio de Queiroz Telles Filho, sob orientação do Prof. Dr. Rodrigo de Oliveira Plotze. '
                'Ambos contribuíram com o embasamento científico e metodológico que sustenta o desenvolvimento do aplicativo e sua aplicação educacional na área da saúde.',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),

              const SizedBox(height: 20),

              // DESENVOLVIMENTO
              const Text(
                'Desenvolvimento tecnológico',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'O desenvolvimento técnico do aplicativo foi realizado por Raiane dos Santos Ciola, '
                'graduanda em Engenharia da Computação pela Universidade de Ribeirão Preto (UNAERP).',
                style: TextStyle(fontSize: 14, height: 1.4),
              ),

              const SizedBox(height: 40),

              // BOTÃO 
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'tcle');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 22, 42, 94),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'CONTINUAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
