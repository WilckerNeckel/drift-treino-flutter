import 'package:freezed_annotation/freezed_annotation.dart';
part 'impressora.freezed.dart';

@freezed
class ImpressoraObj with _$ImpressoraObj {
  const factory ImpressoraObj._(
      {String? id,
      required String nome,
      required String modelo,
      required bool ativo,
      required String tipoConexao,
      required String ip,
      required String porta,
      required String tipoImpressao,
      required String empresaId
      }) = _ImpressoraObj;

  factory ImpressoraObj.fromDatabase(Map<String, dynamic> map) {
    return ImpressoraObj._(
      id: map['id'] as String?,
      nome: map['nome'] as String,
      modelo: map['modelo'] as String,
      ativo: map['ativo'] as bool,
      tipoConexao: map['tipoConexao'] as String,
      ip: map['ip'] as String,
      porta: map['porta'] as String,
      tipoImpressao: map['tipoImpressao'] as String,
      empresaId: map['empresaId'] as String,
    );
  }

  factory ImpressoraObj.create({
    String? id,
    required String nome,
    required String modelo,
    required bool ativo,
    required String tipoConexao,
    required String ip,
    required String porta,
    required String tipoImpressao,
    required String empresaId
  }) {
    if (nome.trim().isEmpty) throw ArgumentError('Nome é obrigatório');
    if (modelo.trim().isEmpty) throw ArgumentError('Modelo é obrigatório');
    if (!RegExp(r'^\d{1,5}$').hasMatch(porta)) {
      throw ArgumentError('Porta inválida');
    }
    if (!RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(ip)) {
      throw ArgumentError('IP inválido');
    }

    return ImpressoraObj._(
      id: id,
      nome: nome,
      modelo: modelo,
      ativo: ativo,
      tipoConexao: tipoConexao,
      ip: ip,
      porta: porta,
      tipoImpressao: tipoImpressao,
      empresaId: empresaId,
    );
  }
}
