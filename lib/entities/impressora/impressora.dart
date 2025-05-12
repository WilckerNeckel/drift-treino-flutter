import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
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
      required String empresaId,
      required String dataCriacao}) = _ImpressoraObj;

  factory ImpressoraObj.fromDatabase(Map<String, dynamic> map) {
    return ImpressoraObj._(
      id: map['id']?.toString(),
      nome: map['nome']?.toString() ?? '',
      modelo: map['modelo']?.toString() ?? '',
      ativo: map['ativo'] is bool
          ? map['ativo']
          : (map['ativo'].toString() == '1' ||
              map['ativo'].toString().toLowerCase() == 'true'),
      tipoConexao: map['tipoConexao']?.toString() ??
          map['tipo_conexao']?.toString() ??
          '',
      ip: map['ip']?.toString() ?? '',
      porta: map['porta']?.toString() ?? '',
      tipoImpressao: map['tipoImpressao']?.toString() ??
          map['tipo_impressao']?.toString() ??
          '',
      empresaId:
          map['empresaId']?.toString() ?? map['empresa_id']?.toString() ?? '',
      dataCriacao:
          _parseDateTimeAsString(map['dataCriacao'] ?? map['data_criacao']),
    );
  }

  static String _parseDateTimeAsString(dynamic value) {
    if (value == null) return '';
    if (value is DateTime) return value.toIso8601String();
    final parsed = DateTime.tryParse(value.toString());
    return parsed?.toIso8601String() ?? '';
  }

  factory ImpressoraObj.create({
    required String nome,
    required String modelo,
    required bool ativo,
    required String tipoConexao,
    required String ip,
    required String porta,
    required String tipoImpressao,
    required String empresaId,
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
      id: Uuid().v4(),
      nome: nome,
      modelo: modelo,
      ativo: ativo,
      tipoConexao: tipoConexao,
      ip: ip,
      porta: porta,
      tipoImpressao: tipoImpressao,
      empresaId: empresaId,
      dataCriacao: DateTime.now().toIso8601String(),
    );
  }
}
