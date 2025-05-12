import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:drift_sqlite_async/drift_sqlite_async.dart'; // Drift + sqlite_async integration
import 'package:sqlite_async/sqlite_async.dart'; // SQLite async library
part 'database.g.dart';

// tutorial table
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

// my own
class Impressora extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get nome => text().withLength(min: 1, max: 20)();
  TextColumn get modelo => text().withLength(min: 1, max: 20)();
  BoolColumn get ativo => boolean().clientDefault(() => true)();
  TextColumn get tipoConexao => text().withLength(min: 1, max: 20)();
  TextColumn get ip => text().withLength(min: 1, max: 20)();
  TextColumn get porta => text().withLength(min: 1, max: 20)();
  TextColumn get tipoImpressao => text().withLength(min: 1, max: 20)();
  TextColumn get empresaId => text()();
  TextColumn get dataCriacao =>
      text().clientDefault(() => DateTime.now().toIso8601String())();
}

@DriftDatabase(tables: [TodoItems, Impressora])
class AppDatabase extends _$AppDatabase {
  AppDatabase(SqliteConnection connection)
      : super(SqliteAsyncDriftConnection(connection));
  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          await m.createAll();
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
