import 'package:project/repositories/contracts/impressora_repository.dart';

class ImpressoraDriftRepository implements IImpressoraRepository {

  @override
  Future<List<Impressora>> findManyImpressoras() {
    throw UnimplementedError();
  }

  @override
  Future<Impressora> getImpressoraByIdentifier(String indentifier) {
    // TODO: implement getImpressoraByIdentifier
    throw UnimplementedError();
  }

  @override
  Future<Impressora> createImpressora(Impressora impressora) {
    // TODO: implement createImpressora
    throw UnimplementedError();
  }

  @override
  Future<Impressora> updateImpressora(Impressora impressora) {
    // TODO: implement updateImpressora
    throw UnimplementedError();
  }
}