import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Logo com tamanho responsivo
              Image.asset(
                'lib/image/logo_SF.png',
                width: screenHeight * 0.50, // aumenta proporcionalmente
                height: screenHeight * 0.35,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              // Nome do app com tipografia aprimorada
              /* const Text(
                'ORTO CARE CONNECT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.blueAccent,
                ),
              ),*/
              const Spacer(),

              // Botão "Entrar"
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'info');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 22, 42, 94),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
