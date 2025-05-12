import 'package:powersync/powersync.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyBackendConnector extends PowerSyncBackendConnector {
  PowerSyncDatabase db;

  MyBackendConnector(this.db);
  final authToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjbTlsZjAxbTIwMDAwb2tranhicmIxbGZjIiwiZW1wcmVzYUlkIjoiMSIsImtpZCI6InBvd2Vyc3luYy01ZjY5OWEyMWY0IiwiYXVkIjoicG93ZXItc2luYyIsImlhdCI6MTc0NzA3MjU1MCwiZXhwIjoxNzQ3MDc2MTUwfQ.aU9TwvXzTvuArkrTY0BRDpp9_4yiCSyd0RF4xQFbenWxE-uaBXeIlumotlMthUtuLz_0mBAPClMA2yzH4WzRhq5k4AjiSyLOXAhbwEp1HCnH173Mrxgj3gR4q1xHrKscoCKQkqZmLN8F0Uk0ZesbVcGRaBe7gYRw8T5uV_BmXaQSI7iHKX0zUUmNbx8-KeBjWdMtNXkzE-pgvIfVV2C_RLckOWuiihyMkRF3t5Dd1VRap2_Js08KVW5sOtdBYdPIPJELYHcn9KkiZcjD7QqKuMaYBra470kqTeHOMyA6nu-KbG3vnQ0u5SKIYoeCW-z9An55v5DbWAcTqIB-ZGduZA";

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    const uri = 'http://localhost:3000/api/auth/login/funcionario';
    final endpoint = Uri.parse(uri);
    const username = "admin@nexsyn.com";
    const password = "12345678";

    final response = await http.post(
      endpoint,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar token");
    }

    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    final token = responseBody["accessToken"];

    return PowerSyncCredentials(
      endpoint: uri,
      token: token,
    );
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) return;

    final changes = transaction.crud.map((op) {
      return {
        'op': op.op.name, // 'put', 'patch' ou 'delete'
        'table': op.table,
        'data': op.opData,
      };
    }).toList();

    final response = await http.post(
      Uri.parse('http://localhost:3000/api/powersync/sync-updates'),
      headers: {
        'Content-Type': 'application/json',
        // token opcional se o endpoint exigir autenticação
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(changes),
    );

    if (response.statusCode != 204) {
      throw Exception(
        "Falha ao sincronizar alterações com o servidor: ${response.statusCode}\n${response.body}",
      );
    }

    await transaction.complete();
  }
}
