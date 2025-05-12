import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project/AppInitializer.dart';
import 'package:project/application/impressora_data_provider.dart';
import 'package:project/database/database.dart';
import 'package:project/entities/impressora/impressora.dart';
import 'package:project/repositories/impressora_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyRootApp());
}

class MyRootApp extends StatelessWidget {
  const MyRootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppInitializerResult>(
      future: AppInitializer.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: Text('Erro: ${snapshot.error}')),
            ),
          );
        }

        return MyApp(database: snapshot.data!.driftDb);
      },
    );
  }
}


class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Drift Training', database: database),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final AppDatabase database;

  const MyHomePage({
    super.key,
    required this.title,
    required this.database,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final impressoraDataProvider =
      ImpressoraDataProvider(ImpressoraDriftRepository(widget.database));

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _ipController = TextEditingController();

  Future<List<ImpressoraObj>> _fetchItems() async {
    try {
      return await impressoraDataProvider.getAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _addImpressora() async {
    if (_formKey.currentState?.validate() != true) return;

    try {
      final novaImpressora = ImpressoraObj.create(
        nome: _nomeController.text,
        modelo: 'modelo_test',
        ativo: true,
        tipoConexao: 'USB',
        ip: _ipController.text,
        porta: '9100',
        tipoImpressao: 'térmica',
        empresaId: '1',
      );

      await impressoraDataProvider.create(novaImpressora);

      // Atualiza UI
      setState(() {
        _nomeController.clear();
        _ipController.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔽 Formulário
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Informe o nome'
                        : null,
                  ),
                  TextFormField(
                    controller: _ipController,
                    decoration: const InputDecoration(labelText: 'IP'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe o IP' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addImpressora,
                    child: const Text('Adicionar Impressora'),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            const Text(
              'Lista de Impressoras',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // 🔽 Lista
            Expanded(
              child: FutureBuilder<List<ImpressoraObj>>(
                future: _fetchItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhuma impressora encontrada.'));
                  }

                  final impressoras = snapshot.data!;
                  return ListView.builder(
                    itemCount: impressoras.length,
                    itemBuilder: (context, index) {
                      final i = impressoras[index];
                      return ListTile(
                        title: Text(i.nome),
                        subtitle: Text(i.ip),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Future<void> deleteLocalDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final dbPath = '${dir.path}/app.db';

  final dbFile = File(dbPath);
  if (await dbFile.exists()) {
    await dbFile.delete();
    print('✅ Banco local deletado com sucesso!');
  } else {
    print('⚠️ Banco local não encontrado.');
  }
}