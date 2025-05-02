import 'package:project/entities/impressora.dart';
import 'package:project/repositories/contracts/impressora_repository_contract.dart';

class ImpressoraDataProvider {
  final IImpressoraRepository _repository;

  ImpressoraDataProvider(this._repository);

  Future<List<ImpressoraObj>> getAll() => _repository.findManyImpressoras();
  Future<ImpressoraObj> getByIdentifier(String id) =>
      _repository.getImpressoraByIdentifier(id);
  Future<int> create(ImpressoraObj obj) => _repository.createImpressora(obj);
  Future<ImpressoraObj> update(ImpressoraObj obj) =>
      _repository.updateImpressora(obj);
}
