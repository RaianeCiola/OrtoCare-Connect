import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/avaliacao.dart';


class AvaliacaoController {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("ortocare-connect");

  Future<void> salvarAvaliacao(BuildContext context, Avaliacao avaliacao) async {
    try {
      await collection.add(avaliacao.toJson());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Avaliação salva com sucesso!")),
      );
      Navigator.pop(context); // volta após salvar
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao salvar: $e")),
      );
    }
  }
}
