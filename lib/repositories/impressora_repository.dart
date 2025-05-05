import 'package:project/database/DatabaseInstance.dart';
import 'package:project/database/database.dart';
import 'package:project/entities/impressora.dart';
import 'package:project/repositories/contracts/impressora_repository_contract.dart';
import 'package:drift/drift.dart';

class ImpressoraDriftRepository implements IImpressoraRepository {
  @override
  Future<List<ImpressoraObj>> findManyImpressoras() async {
    final impressoras = await db.managers.impressora.get();
    final impressoraInstances = impressoras.map((row) {
      return ImpressoraObj(
        id: row.id,
        nome: row.nome,
        modelo: row.modelo,
        ativo: row.ativo,
        tipoConexao: row.tipoConexao,
        ip: row.ip,
        porta: row.porta,
        tipoImpressao: row.tipoImpressao,
      );
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

    return ImpressoraObj(
      id: impressoraData.id,
      nome: impressoraData.nome,
      modelo: impressoraData.modelo,
      ativo: impressoraData.ativo,
      tipoConexao: impressoraData.tipoConexao,
      ip: impressoraData.ip,
      porta: impressoraData.porta,
      tipoImpressao: impressoraData.tipoImpressao,
    );
  }

  @override
  Future<int> createImpressora(ImpressoraObj impressoraInput) async {
    final impressoraData = await db.into(db.impressora).insert(
        ImpressoraCompanion.insert(
            nome: impressoraInput.nome,
            modelo: impressoraInput.modelo,
            tipoConexao: impressoraInput.tipoConexao,
            ip: impressoraInput.ip,
            porta: impressoraInput.porta,
            tipoImpressao: impressoraInput.tipoImpressao));

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

    return impressoraInput;
  }
}
