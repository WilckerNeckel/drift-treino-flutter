import 'package:powersync/powersync.dart';

final schema = Schema([
  Table('impressora', [
    Column.text('nome'),
    Column.text('modelo'),
    Column.integer('ativo'),
    Column.text('tipo_conexao'),
    Column.text('ip'),
    Column.text('porta'),
    Column.text('tipo_impressao'),
    Column.text('empresa_id'),
    Column.text('data_criacao'), // Changed to Column.text
  ])
]);
