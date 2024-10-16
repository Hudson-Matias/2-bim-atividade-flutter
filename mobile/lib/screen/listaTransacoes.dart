import 'package:flutter/material.dart';
import '../service/transacaoService.dart';
import 'criarContaPage.dart';

class ListaTransacoesPage extends StatefulWidget {
  @override
  _ListaTransacoesPageState createState() => _ListaTransacoesPageState();
}

class _ListaTransacoesPageState extends State<ListaTransacoesPage> {
  final TransacaoService _transacaoService = TransacaoService();
  List<dynamic> _transacoes = [];

  @override
  void initState() {
    super.initState();
    _getTransacoes();
  }

  void _getTransacoes() async {
    final transacoes = await _transacaoService.getAll();
    setState(() {
      _transacoes = transacoes;
    });
  }

  void _deleteTransacao(String id) async {
    await _transacaoService.delete(id);
    _getTransacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Contas')),
      body: ListView.builder(
        itemCount: _transacoes.length,
        itemBuilder: (context, index) {
          final transacao = _transacoes[index];
          return ListTile(
            title: Text(transacao['nome']),
            subtitle: Text('Saldo: ${transacao['saldo']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTransacao(transacao['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CriarContaPage()),
          ).then((_) => _getTransacoes());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
