import 'package:project/database/database.dart';
import 'package:project/entities/impressora/impressora.dart';
import 'package:project/repositories/contracts/impressora_repository_contract.dart';
import 'package:drift/drift.dart';
// import 'package:uuid/uuid.dart';

class ImpressoraDriftRepository implements IImpressoraRepository {
  final AppDatabase db;
  ImpressoraDriftRepository(this.db);

  @override
  Future<List<ImpressoraObj>> findManyImpressoras() async {
    final impressoras = await db.managers.impressora.get();
    final impressoraInstances = impressoras.map((row) {
      return ImpressoraObj.fromDatabase(row.toJson());
    }).toList();
    return impressoraInstances;
  }

  @override
  Future<ImpressoraObj> getImpressoraByIdentifier(String identifier) async {
    final query = db.managers.impressora
        .filter((f) => (f.id(identifier) | f.nome(identifier)));

    final impressoraData = await query.getSingleOrNull();

    if (impressoraData == null) {
      throw Exception('Impressora not found');
    }
    return ImpressoraObj.fromDatabase(impressoraData.toJson());
  }

  @override
  Future<int> createImpressora(ImpressoraObj impressoraInput) async {
    final impressoraData =
        await db.into(db.impressora).insert(ImpressoraCompanion.insert(
              // id: Value(impressoraInput.id ?? const Uuid().v4()),
              nome: impressoraInput.nome,
              modelo: impressoraInput.modelo,
              ativo: Value(impressoraInput.ativo), // <-- FIXED
              tipoConexao: impressoraInput.tipoConexao,
              ip: impressoraInput.ip,
              porta: impressoraInput.porta,
              tipoImpressao: impressoraInput.tipoImpressao,
              empresaId: impressoraInput.empresaId,
            ));

    return impressoraData;
  }

  @override
  Future<ImpressoraObj> updateImpressora(ImpressoraObj impressoraInput) async {
    final rowsUpdated = await (db.update(db.impressora)
          ..where((i) => i.id.equals(impressoraInput.id!)))
        .write(ImpressoraCompanion(
      nome: Value(impressoraInput.nome),
      modelo: Value(impressoraInput.modelo),
      ativo: Value(impressoraInput.ativo),
      tipoConexao: Value(impressoraInput.tipoConexao),
      ip: Value(impressoraInput.ip),
      porta: Value(impressoraInput.porta),
      tipoImpressao: Value(impressoraInput.tipoImpressao),
    ));

    if (rowsUpdated == 0) {
      throw Exception('Failed to update Impressora');
    }

    return await getImpressoraByIdentifier(impressoraInput.id!);
  }

  @override
  Future<void> deleteImpressoraByIdentifier(String identifier) async {
    final query = db.delete(db.impressora)
      ..where((tbl) => tbl.id.equals(identifier));
    final deletedCount = await query.go();

    if (deletedCount == 0) {
      throw Exception('Impressora not found or already deleted');
    }
  }
}
