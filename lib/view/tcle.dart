import 'package:flutter/material.dart';
import 'dart:io';

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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'TCLE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'gurbas tonple viskano trelof zipra dumplex ranovi caltruz bexuma norfin relaxium vortex klandr diflebu snorflez jaxandor quibracor montrega tulpen gralvex furdano ximble nexur...',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'gurbas tonple viskano trelof zipra dumplex ranovi caltruz bexuma norfin relaxium vortex klandr diflebu snorflez jaxandor quibracor montrega tulpen gralvex furdano ximble nexur...',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
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
              SizedBox(height: 20),

              // Botão CONTINUAR
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: aceitouTermo
                      ? () {
                           Navigator.pushNamed(context, 'menu',); 
                        }
                      : null, // desabilitado se não aceitou
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        aceitouTermo ? Colors.blue : Colors.grey,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
                    // Encerra o app
                    exit(0);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'SAIR',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

              SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    );
  }
}
