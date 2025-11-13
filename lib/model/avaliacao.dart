class Avaliacao {
  final String telefone; 
  final int idade;
  final String genero;
  final bool diagnosticoCirurgia;
  final int conhecimentoPrevio;
  final int compreensaoPosUso;
  final int confortoDiscussaoRiscos;
  final int clarezaInformacoes;
 // final int utilidadeMultimidia;
  final int autonomiaDecisao;
  final int designNavegabilidade;
  final int satisfacaoGeral;
  final String recursosParaMelhorar;
  final String comentariosAdicionais;

  Avaliacao({
    required this.telefone,
    required this.idade,
    required this.genero,
    required this.diagnosticoCirurgia,
    required this.conhecimentoPrevio,
    required this.compreensaoPosUso,
    required this.confortoDiscussaoRiscos,
    required this.clarezaInformacoes,
  //  required this.utilidadeMultimidia,
    required this.autonomiaDecisao,
    required this.designNavegabilidade,
    required this.satisfacaoGeral,
    required this.recursosParaMelhorar,
    required this.comentariosAdicionais,
  });

  Map<String, dynamic> toJson() {
    return {
      "telefone": telefone,
      "idade": idade,
      "genero": genero,
      "diagnosticoCirurgia": diagnosticoCirurgia,
      "conhecimentoPrevio": conhecimentoPrevio,
      "compreensaoPosUso": compreensaoPosUso,
      "confortoDiscussaoRiscos": confortoDiscussaoRiscos,
      "clarezaInformacoes": clarezaInformacoes,
    //  "utilidadeMultimidia": utilidadeMultimidia,
      "autonomiaDecisao": autonomiaDecisao,
      "designNavegabilidade": designNavegabilidade,
      "satisfacaoGeral": satisfacaoGeral,
      "recursosParaMelhorar": recursosParaMelhorar,
      "comentariosAdicionais": comentariosAdicionais,
    };
  }
}
