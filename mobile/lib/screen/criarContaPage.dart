import 'package:flutter/material.dart';
import '../service/transacaoService.dart';

class CriarContaPage extends StatefulWidget {
  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();
  final TransacaoService _transacaoService = TransacaoService();

  void _salvarConta() async {
    final nome = _nomeController.text;
    final saldo = double.tryParse(_saldoController.text);

    if (nome.isNotEmpty && saldo != null) {
      await _transacaoService.create({
        'nome': nome,
        'saldo': saldo,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Conta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome da Conta'),
            ),
            TextField(
              controller: _saldoController,
              decoration: InputDecoration(labelText: 'Saldo Inicial'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarConta,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
