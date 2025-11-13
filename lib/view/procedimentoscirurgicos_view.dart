import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProcedimentosCirurgicosView extends StatefulWidget {
const ProcedimentosCirurgicosView({Key? key}) : super(key: key);

@override
State<ProcedimentosCirurgicosView> createState() => _ProcedimentosCirurgicosViewState();
}

class _ProcedimentosCirurgicosViewState extends State<ProcedimentosCirurgicosView> {
final Set<int> expandedIndices = <int>{}; //guarda o índice dos cards que estão expandidos

//lista de profissionais
final profissionais = [
 {
 "nome": "Cirurgião Bucomaxilofacial",
 "descricao":
  "Dentista especialista responsável por realizar a cirurgia ortognática. Ele planeja, executa e acompanha o procedimento, reposicionando os ossos da face para corrigir discrepâncias.",
 "icone": FontAwesomeIcons.userDoctor,
 },
 {
 "nome": "Ortodontista",
 "descricao":
  "Profissional que prepara os dentes e a mordida para a cirurgia, utilizando aparelhos ortodônticos antes e após o procedimento.",
 "icone": MdiIcons.toothOutline,
 },
 {
 "nome": "Anestesiologista",
 "descricao":
  "Médico responsável por aplicar a anestesia geral e monitorar os sinais vitais durante toda a cirurgia, garantindo segurança e conforto.",
 "icone": MdiIcons.stethoscope
 },
 {
 "nome": "Fisioterapeuta",
 "descricao":
  "Atua no pós-operatório ajudando na reabilitação facial, reduzindo o inchaço e fortalecendo a musculatura.",
 "icone": Icons.accessibility_new
 },
 {
 "nome": "Fonoaudiólogo",
 "descricao":
  "Auxilia na reabilitação das funções de fala, mastigação e deglutição, ajudando o paciente a se adaptar às novas posições da face.",
 "icone": Icons.record_voice_over
 },
 {
 "nome": "Nutricionista",
 "descricao":
  "Orienta o paciente sobre a alimentação adequada nas fases pré e pós-operatória, garantindo nutrição e cicatrização adequadas.",
 "icone": Icons.restaurant
 },
 {
 "nome": "Psicólogo",
 "descricao":
  "Oferece suporte emocional ao paciente, ajudando a lidar com a ansiedade e a adaptação às mudanças físicas e emocionais.",
 "icone": Icons.psychology
 },
 {
 "nome": "Equipe de Enfermagem",
 "descricao":
  "Cuida do paciente antes e depois da cirurgia, monitorando sinais vitais, administrando medicamentos e orientando sobre os cuidados necessários.",
 "icone": FontAwesomeIcons.userNurse
 },
];

@override
Widget build(BuildContext context) {
 return Scaffold(
appBar: AppBar(
  
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: const Color.fromARGB(255, 15, 74, 127),

  
  title: FittedBox(
  fit: BoxFit.scaleDown, // faz o texto diminuir se necessário
  child: const Text(
  " Procedimentos Cirúrgicos",
   style: TextStyle(
   color: Colors.white,
   // fontWeight: FontWeight.bold,
   ),
  ),
  ),
  centerTitle: true,
 ),
 backgroundColor: Colors.white,
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
   "A cirurgia ortognática é realizada com planejamento cuidadoso, "
   "envolvendo diferentes etapas que garantem segurança e bons resultados. "
   "Explore os tópicos abaixo para entender melhor cada fase do procedimento:",
   style: TextStyle(fontSize: 16, height: 1.5),
   textAlign: TextAlign.justify,
   ),
   const SizedBox(height: 20),

//cards
_buildMainCard(
 index: 0,
 icone: Icons.question_mark,
 titulo: "O que acontece na Cirurgia Ortognática",
 conteudo:  Column( 
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [
   Center(
    child: Image.asset(
     'lib/image/CRANIO.png',
     height: 200,
     fit: BoxFit.contain,
    ),
   ),
  const SizedBox(height: 12),
   const Text(
    "A cirurgia ortognática reposiciona os ossos da face (maxila, mandíbula e mento) "
    "para corrigir alterações estéticas e funcionais (mastigação, fala, respiração). "
    "É um procedimento de alta precisão, planejado com modelos 3D e simulações digitais, "
    "garantindo um resultado alinhado às suas necessidades.",
    textAlign: TextAlign.justify,
    style: TextStyle(fontSize: 15, height: 1.4),
   ),
  ],
 ),
),
   
   _buildMainCard(
   index: 1,
   icone: MdiIcons.headOutline,
   titulo: "Cirurgia da Maxila (Le Fort I)",
   conteudo:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
     "Corrige alterações na parte superior da face. Durante o procedimento:",
     style: TextStyle(fontSize: 15, height: 1.4),
    ),
    SizedBox(height: 8),
    Text(
     "• A maxila é separada do crânio com cortes controlados.\n"
     "• É colocada na nova posição planejada, guiada por uma goteira de acrílico.\n"
     "• A fixação é feita com miniplacas e parafusos de titânio, sem a necessidade de manter a boca 'travada' por muito tempo.",
     style: TextStyle(fontSize: 15, height: 1.5),
     textAlign: TextAlign.justify
    ),
    ],
   ),
   ),

  
   _buildMainCard(
   index: 2,
   icone: MdiIcons.headOutline,
   titulo: "Cirurgia da Mandíbula (Osteotomia Sagital)",
   conteudo: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
     "Corrige alterações na parte inferior do rosto. Durante o procedimento:",
     style: TextStyle(fontSize: 15, height: 1.4),
    ),
    SizedBox(height: 8),
    Text(
     "• Cortes são feitos na parte de trás da mandíbula, separando-a em dois segmentos.\n"
     "• Os segmentos são ajustados para harmonizar a mordida, com auxílio da goteira de acrílico.\n"
     "• A fixação interna é feita com miniplacas ou parafusos de titânio, proporcionando firmeza.",
     style: TextStyle(fontSize: 15, height: 1.5),
     textAlign: TextAlign.justify,
    ),
    ],
   ),
   ),

   
   _buildMainCard(
   index: 3,
   icone: MdiIcons.headOutline,
   titulo: "Mentoplastia (Cirurgia do Queixo)",
   conteudo: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
     "Realizada para harmonizar o queixo com o restante da face, melhorando o equilíbrio facial. É feita por dentro da boca.",
     style: TextStyle(fontSize: 15, height: 1.4),
    ),
    SizedBox(height: 8),
    Text(
     "• O osso do queixo pode ser avançado, recuado, elevado ou abaixado.\n"
     "• É feita com mínimo descolamento para proteger nervos e estrutura óssea.\n"
     "• Pode ser usada em combinação com a cirurgia da maxila e/ou mandíbula.",
     style: TextStyle(fontSize: 15, height: 1.5),
    ),
    ],
   ),
   ),

   
   _buildMainCard(
   index: 4,
   icone: Icons.access_time,
   titulo: "Tempo de Duração da Cirurgia",
   conteudo: const Text(
    "O tempo varia de acordo com a complexidade do caso (se é apenas maxila, mandíbula ou ambos), mas em média dura entre 4 e 6 horas.",
    style: TextStyle(fontSize: 15, height: 1.5),
   ),
   ),

   
   _buildMainCard(
   index: 5,
   icone: Icons.local_hospital,
   titulo: "Internação Hospitalar",
   conteudo: const Text(
    "Após a cirurgia, o paciente permanece internado por aproximadamente 2 a 3 dias, "
    "para observação, monitoramento e primeiros cuidados, antes de receber alta.",
    style: TextStyle(fontSize: 15, height: 1.5),
   ),
   ),

  
   _buildMainCard(
   index: 6,
   icone: Icons.groups,
   titulo: "Equipe Envolvida",
   conteudo: _buildEquipeGrid(context),
   ),


  ],
  ),
 ),
 );
}

/// construção dos cards
Widget _buildMainCard({
 required int index,
 required IconData icone,
 required String titulo,
 required Widget conteudo,
}) {
 final isExpanded = expandedIndices.contains(index);

 return Card(
 color: const Color.fromARGB(255, 255, 255, 255),
 margin: const EdgeInsets.symmetric(vertical: 10),
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
 elevation: 5,
 child: ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: ExpansionTile(
  initiallyExpanded: isExpanded,
  onExpansionChanged: (expanded) {
   setState(() {
   if (expanded) {
    expandedIndices.add(index);
   } else {
    expandedIndices.remove(index);
   }
   });
  },
  tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  backgroundColor: isExpanded ? const Color.fromARGB(255, 25, 45, 96) : const Color(0xFFE9F2FF),
  leading: Icon(icone, color: isExpanded ? Colors.white : const Color.fromARGB(255, 25, 45, 96)),
  title: Text(
   titulo,
   style: TextStyle(
   fontWeight: FontWeight.bold,
   color: isExpanded ? Colors.white : const Color.fromARGB(255, 25, 45, 96),
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

// grid cartçoes clicaveis dos profissionais 
Widget _buildEquipeGrid(BuildContext context) {
 return GridView.builder(
 shrinkWrap: true, //impede overflow no scroll principal
 physics: const NeverScrollableScrollPhysics(),
 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3, //número de colunas
  childAspectRatio: 1.2,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
 ),
 itemCount: profissionais.length,
 itemBuilder: (context, index) {
  final prof = profissionais[index];
  return GestureDetector(
  onTap: () {
   showDialog(
context: context,
builder: (_) => AlertDialog(
 backgroundColor: const Color(0xFFE9F2FF), // azul clarinho
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(15),
 ),
 title: Text(
 prof["nome"] as String,
 style: const TextStyle(
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 25, 45, 96),
 ),
 ),
 content: Text(
 prof["descricao"] as String,
 style: const TextStyle(
  color: Color.fromARGB(255, 25, 45, 96),
  height: 1.4,
 ),
 ),
 actionsAlignment: MainAxisAlignment.end,
 actions: [
 TextButton(
  style: TextButton.styleFrom(
  foregroundColor:const Color.fromARGB(255, 25, 45, 96),
  shape: RoundedRectangleBorder(
   borderRadius: BorderRadius.circular(8),
  ),
  ),
  onPressed: () => Navigator.of(context).pop(),
  child: const Text("Fechar"),
 ),
 ],
),
);

  },
  // Card visual do profissional
  child: Container( 
   decoration: BoxDecoration(
   color: Colors.blue.shade50,
   borderRadius: BorderRadius.circular(12),
   boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.15),
    blurRadius: 6,
    offset: const Offset(2, 2),
    ),
   ],
   ),
   child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
    Icon(prof["icone"] as IconData, color: const Color.fromARGB(255, 25, 45, 96), size: 35),
    const SizedBox(height: 8),
    Text(
    prof["nome"] as String,
    textAlign: TextAlign.center,
    style: const TextStyle(
     color: const Color.fromARGB(255, 25, 45, 96),
     fontWeight: FontWeight.w600,
    ),
    ),
   ],
   ),
  ),
  );
 },
 );
}
}