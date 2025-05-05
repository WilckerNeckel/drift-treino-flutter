import 'package:flutter/material.dart';
import 'package:project/application/impressora_data_provider.dart';
import 'package:project/database/DatabaseInstance.dart';
import 'package:project/database/database.dart';
import 'package:project/entities/impressora/impressora.dart';
import 'package:project/repositories/impressora_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final impressoraDataProvider =
      ImpressoraDataProvider(ImpressoraDriftRepository(db));

  // final impresora = await impressoraDataProvider.getByIdentifier("CozinhaAntiga");
  // final newImpressora = impresora.copyWith(nome: "CozinhaMuitoAntiga");

  // await impressoraDataProvider.update(newImpressora);
  await impressoraDataProvider.create(ImpressoraObj.create(
      nome: "Cozinha",
      modelo: "Bematec",
      ativo: true,
      tipoConexao: "tcp/ip",
      ip: "192.168.1.250",
      porta: "91000",
      tipoImpressao: "comanda"));

  runApp(MyApp(database: db));
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
  final impressoraDataProvider =
      ImpressoraDataProvider(ImpressoraDriftRepository(db));

  Future<List<ImpressoraObj>> _fetchItems() {
    return impressoraDataProvider.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: FutureBuilder<List<ImpressoraObj>>(
        future: _fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No clients found'));
          }
          final clients = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  client.nome,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
