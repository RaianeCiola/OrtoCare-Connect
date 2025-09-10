import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                  ),
                ),
              ),
              SizedBox(height: 30),

              Text(
                'Informações sobre o projeto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Este projeto tem como objetivo informar e apoiar pacientes que passarão por cirurgia ortognática, por meio de um aplicativo educacional e interativo.',
              ),

              SizedBox(height: 20),

              Text(
                'Informações sobre os pesquisadores',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Pesquisadores da área da saúde e tecnologia colaboraram neste projeto, contribuindo com conhecimento técnico e científico.',
              ),

              SizedBox(height: 20),

              Text(
                'Informações sobre os desenvolvedores',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'O desenvolvimento desse aplicativo foi feito pela graduanda de Engenharia da Computação Raiane dos Santos Ciola',
              ),

              Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'tcle');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'CONTINUAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
