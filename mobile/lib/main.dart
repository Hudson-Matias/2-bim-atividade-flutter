import 'package:flutter/material.dart';
import '../screen/listaTransacoes.dart';

void main() {
  runApp(AplicacaoBancaria());
}

class AplicacaoBancaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ListaTransacoesPage(),
    );
  }
}
