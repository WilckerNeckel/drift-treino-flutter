class Impressora {
  final String id;
  final String nome;
  final String modelo;
  final bool ativo;
  final String tipoConexao;
  final String ip;
  final String porta;
  final String tipoImpressao;

  Impressora({
    required this.id,
    required this.nome,
    required this.modelo,
    required this.ativo,
    required this.tipoConexao,
    required this.ip,
    required this.porta,
    required this.tipoImpressao,
  });
}

abstract class IImpressoraRepository {
  Future<List<Impressora>> findManyImpressoras();
  Future<Impressora> getImpressoraByIdentifier(String indentifier);
  Future<Impressora> createImpressora(Impressora impressora);
  Future<Impressora> updateImpressora(Impressora impressora);
}
