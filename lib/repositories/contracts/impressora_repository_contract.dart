
import 'package:project/entities/impressora.dart';

abstract class IImpressoraRepository {
  Future<List<ImpressoraObj>> findManyImpressoras();
  Future<ImpressoraObj> getImpressoraByIdentifier(String indentifier);
  Future<int> createImpressora(ImpressoraObj impressora);
  Future<ImpressoraObj> updateImpressora(ImpressoraObj impressora);
}
