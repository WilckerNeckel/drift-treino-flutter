import 'package:freezed_annotation/freezed_annotation.dart';

part 'perfil_admin.freezed.dart';

@freezed
class PerfilAdmin with _$PerfilAdmin {
  const factory PerfilAdmin({
    String? id,
    required String empresaId,
    required String role,
    required bool acessoFinanceiro,
    required bool acessoEstoque,
    required bool acessoFiscal,
    required bool acessoDashboard,
    required DateTime dataCriacao,
    required DateTime dataAtualizacao,
  }) = _PerfilAdmin;

  /// Factory to create from database or backend
  factory PerfilAdmin.fromDatabase(Map<String, dynamic> map) {
    return PerfilAdmin(
      id: map['id'] as String?,
      empresaId: map['empresaId'] as String,
      role: map['role'] as String,
      acessoFinanceiro: map['acessoFinanceiro'] as bool,
      acessoEstoque: map['acessoEstoque'] as bool,
      acessoFiscal: map['acessoFiscal'] as bool,
      acessoDashboard: map['acessoDashboard'] as bool,
      dataCriacao: DateTime.parse(map['dataCriacao']),
      dataAtualizacao: DateTime.parse(map['dataAtualizacao']),
    );
  }

  /// Optional: convert toMap for database/JSON
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'empresaId': empresaId,
  //     'role': role,
  //     'acessoFinanceiro': acessoFinanceiro,
  //     'acessoEstoque': acessoEstoque,
  //     'acessoFiscal': acessoFiscal,
  //     'acessoDashboard': acessoDashboard,
  //     'dataCriacao': dataCriacao.toIso8601String(),
  //     'dataAtualizacao': dataAtualizacao.toIso8601String(),
  //   };
  // }
}

// extension PerfilAdminMapper on PerfilAdmin {
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'empresaId': empresaId,
//       'role': role,
//       'acessoFinanceiro': acessoFinanceiro,
//       'acessoEstoque': acessoEstoque,
//       'acessoFiscal': acessoFiscal,
//       'acessoDashboard': acessoDashboard,
//       'dataCriacao': dataCriacao.toIso8601String(),
//       'dataAtualizacao': dataAtualizacao.toIso8601String(),
//     };
//   }
// }

