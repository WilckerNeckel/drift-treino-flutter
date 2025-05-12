import 'package:powersync/powersync.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyBackendConnector extends PowerSyncBackendConnector {
  PowerSyncDatabase db;

  MyBackendConnector(this.db);
  final authToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InBvd2Vyc3luYy0xMjMifQ.eyJzdWIiOiJjbTlsZjAxbTIwMDAwb2tranhicmIxbGZjIiwiZW1wcmVzYUlkIjoiMSIsImtpZCI6InBvd2Vyc3luYy0xMjMiLCJhdWQiOiJwb3dlcnN5bmMiLCJpYXQiOjE3NDcwODgyMDcsImV4cCI6MTc0NzA5MTgwN30.jD2daBADWU4vXEJbAdtZsvCjjsg7yLmXVXELmOJr9Xv60dG3IMZ-wTzFtKAzxj9Trn6qag2O1WjzNwHEr0IE1Ejmgy8gGxgAHN5luViH3gn8wLtCTd2Lp8sXN_V0qpKF6FenPKUtrlS7uWPjcV4RP4YqcFoLyl8RFuJ9cw9TXYfjH-LhAEeaLf2upDQegdYkvn8sPLezAZHIwoy2YlSmh8SDtY58riicdtxTV9wsMsxPVQJ3-40ygl0GPZG_oGKUHF5Bb58NB3uC2VFgTBWpQG_HeirqDUa2G7WFcZ2rQ1DCWV0iJR1d6ojdZDxWeI_2OZRy_Aawh-_PV7ywzW3w1w";

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    const authUri = 'http://10.0.2.2:3000/api/auth/login/funcionario';
    final authEndpoint = Uri.parse(authUri);
    final powerSyncEndpoint = "http://10.0.2.2:8080";

    const username = "admin@nexsyn.com";
    const password = "12345678";

    final response = await http.post(
      authEndpoint,
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
      endpoint: powerSyncEndpoint,
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
      Uri.parse('http://10.0.2.2:3000/api/powersync/sync-updates'),
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
