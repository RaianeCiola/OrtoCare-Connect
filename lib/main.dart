import 'package:flutter/material.dart';
import 'package:orto_care/view/avaliacaopreoperatoria_view.dart';
import 'package:orto_care/view/complicacoeseriscos_view.dart';
import 'package:orto_care/view/cuidadosposoperatorio_view.dart';
import 'package:orto_care/view/definicao_view.dart';
import 'package:orto_care/view/info_view.dart';
import 'package:orto_care/view/introducao_view.dart';
import 'package:orto_care/view/menu_view.dart';
import 'package:orto_care/view/procedimentoscirurgicos_view.dart';
import 'view/questionario_view.dart';
import 'view/tcle.dart';
import 'view/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 /* runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
*/
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrtoCare Connect',
      //theme: ThemeData(
      //primarySwatch: Colors.blue,
      //),
      //home: const WelcomeView(),
      //locale: DevicePreview.locale(context), // para mudar o idioma
      // builder: DevicePreview.appBuilder, // aplica o layout
      //
      // ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => WelcomeView(),
        'info': (context) => InfoView(),
        'tcle': (context) => TCLEView(),
        'menu': (context) => MenuView(),
        'quest': (context) => QuestionarioView(),
        'intro': (conext) => IntroducaoView(),
        'defin': (context) => DefinicaoView(),
        'avpre': (context) => AvaliacaoPreOperatoriaView(),
        'procd': (context) => ProcedimentosCirurgicosView(),
        'cuidp': (context) => CuidadosPosOperatoriosView(),
        'compl': (context) =>  ComplicacoesRiscosView()
      },
    );
  }
}
