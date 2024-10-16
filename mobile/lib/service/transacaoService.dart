import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/service/apiService.dart';

class TransacaoService extends ApiService<Map<String, dynamic>> {
  final String apiUrl = 'http://localhost:3000/transacoes';

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Erro ao carregar transações');
    }
  }

  @override
  Future<void> create(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao criar transação');
    }
  }

  @override
  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar transação');
    }
  }

  @override
  Future<void> update(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar transação');
    }
  }
  
  @override
  Future<Map<String, dynamic>> getById(int id) {
    throw UnimplementedError();
  }
}
