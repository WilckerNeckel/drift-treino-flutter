import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';
import 'package:project/database/database.dart';
import 'package:project/powersync/my_backend_connector.dart';
import 'package:project/powersync/schema.dart';

class AppInitializerResult {
  final PowerSyncDatabase powerSyncDb;
  final AppDatabase driftDb;

  AppInitializerResult({
    required this.powerSyncDb,
    required this.driftDb,
  });
}

class AppInitializer {
  static Future<AppInitializerResult> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/app.db';

    final powerSyncDb = PowerSyncDatabase(schema: schema, path: dbPath);
    await powerSyncDb.initialize();

    final driftDb = AppDatabase(powerSyncDb);

    final connector = MyBackendConnector(powerSyncDb);
    await powerSyncDb.connect(connector: connector);

    return AppInitializerResult(
      powerSyncDb: powerSyncDb,
      driftDb: driftDb,
    );
  }
}
