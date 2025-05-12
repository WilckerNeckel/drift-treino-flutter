// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String content;
  final DateTime? createdAt;
  const TodoItem(
      {required this.id,
      required this.title,
      required this.content,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? title,
          String? content,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime?>? createdAt}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ImpressoraTable extends Impressora
    with TableInfo<$ImpressoraTable, ImpressoraData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImpressoraTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _modeloMeta = const VerificationMeta('modelo');
  @override
  late final GeneratedColumn<String> modelo = GeneratedColumn<String>(
      'modelo', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ativoMeta = const VerificationMeta('ativo');
  @override
  late final GeneratedColumn<bool> ativo = GeneratedColumn<bool>(
      'ativo', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ativo" IN (0, 1))'),
      clientDefault: () => true);
  static const VerificationMeta _tipoConexaoMeta =
      const VerificationMeta('tipoConexao');
  @override
  late final GeneratedColumn<String> tipoConexao = GeneratedColumn<String>(
      'tipo_conexao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ipMeta = const VerificationMeta('ip');
  @override
  late final GeneratedColumn<String> ip = GeneratedColumn<String>(
      'ip', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _portaMeta = const VerificationMeta('porta');
  @override
  late final GeneratedColumn<String> porta = GeneratedColumn<String>(
      'porta', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tipoImpressaoMeta =
      const VerificationMeta('tipoImpressao');
  @override
  late final GeneratedColumn<String> tipoImpressao = GeneratedColumn<String>(
      'tipo_impressao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _empresaIdMeta =
      const VerificationMeta('empresaId');
  @override
  late final GeneratedColumn<String> empresaId = GeneratedColumn<String>(
      'empresa_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataCriacaoMeta =
      const VerificationMeta('dataCriacao');
  @override
  late final GeneratedColumn<DateTime> dataCriacao = GeneratedColumn<DateTime>(
      'data_criacao', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        modelo,
        ativo,
        tipoConexao,
        ip,
        porta,
        tipoImpressao,
        empresaId,
        dataCriacao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'impressora';
  @override
  VerificationContext validateIntegrity(Insertable<ImpressoraData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('modelo')) {
      context.handle(_modeloMeta,
          modelo.isAcceptableOrUnknown(data['modelo']!, _modeloMeta));
    } else if (isInserting) {
      context.missing(_modeloMeta);
    }
    if (data.containsKey('ativo')) {
      context.handle(
          _ativoMeta, ativo.isAcceptableOrUnknown(data['ativo']!, _ativoMeta));
    }
    if (data.containsKey('tipo_conexao')) {
      context.handle(
          _tipoConexaoMeta,
          tipoConexao.isAcceptableOrUnknown(
              data['tipo_conexao']!, _tipoConexaoMeta));
    } else if (isInserting) {
      context.missing(_tipoConexaoMeta);
    }
    if (data.containsKey('ip')) {
      context.handle(_ipMeta, ip.isAcceptableOrUnknown(data['ip']!, _ipMeta));
    } else if (isInserting) {
      context.missing(_ipMeta);
    }
    if (data.containsKey('porta')) {
      context.handle(
          _portaMeta, porta.isAcceptableOrUnknown(data['porta']!, _portaMeta));
    } else if (isInserting) {
      context.missing(_portaMeta);
    }
    if (data.containsKey('tipo_impressao')) {
      context.handle(
          _tipoImpressaoMeta,
          tipoImpressao.isAcceptableOrUnknown(
              data['tipo_impressao']!, _tipoImpressaoMeta));
    } else if (isInserting) {
      context.missing(_tipoImpressaoMeta);
    }
    if (data.containsKey('empresa_id')) {
      context.handle(_empresaIdMeta,
          empresaId.isAcceptableOrUnknown(data['empresa_id']!, _empresaIdMeta));
    } else if (isInserting) {
      context.missing(_empresaIdMeta);
    }
    if (data.containsKey('data_criacao')) {
      context.handle(
          _dataCriacaoMeta,
          dataCriacao.isAcceptableOrUnknown(
              data['data_criacao']!, _dataCriacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ImpressoraData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImpressoraData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      modelo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modelo'])!,
      ativo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ativo'])!,
      tipoConexao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_conexao'])!,
      ip: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ip'])!,
      porta: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}porta'])!,
      tipoImpressao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_impressao'])!,
      empresaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}empresa_id'])!,
      dataCriacao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}data_criacao'])!,
    );
  }

  @override
  $ImpressoraTable createAlias(String alias) {
    return $ImpressoraTable(attachedDatabase, alias);
  }
}

class ImpressoraData extends DataClass implements Insertable<ImpressoraData> {
  final String id;
  final String nome;
  final String modelo;
  final bool ativo;
  final String tipoConexao;
  final String ip;
  final String porta;
  final String tipoImpressao;
  final String empresaId;
  final DateTime dataCriacao;
  const ImpressoraData(
      {required this.id,
      required this.nome,
      required this.modelo,
      required this.ativo,
      required this.tipoConexao,
      required this.ip,
      required this.porta,
      required this.tipoImpressao,
      required this.empresaId,
      required this.dataCriacao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nome'] = Variable<String>(nome);
    map['modelo'] = Variable<String>(modelo);
    map['ativo'] = Variable<bool>(ativo);
    map['tipo_conexao'] = Variable<String>(tipoConexao);
    map['ip'] = Variable<String>(ip);
    map['porta'] = Variable<String>(porta);
    map['tipo_impressao'] = Variable<String>(tipoImpressao);
    map['empresa_id'] = Variable<String>(empresaId);
    map['data_criacao'] = Variable<DateTime>(dataCriacao);
    return map;
  }

  ImpressoraCompanion toCompanion(bool nullToAbsent) {
    return ImpressoraCompanion(
      id: Value(id),
      nome: Value(nome),
      modelo: Value(modelo),
      ativo: Value(ativo),
      tipoConexao: Value(tipoConexao),
      ip: Value(ip),
      porta: Value(porta),
      tipoImpressao: Value(tipoImpressao),
      empresaId: Value(empresaId),
      dataCriacao: Value(dataCriacao),
    );
  }

  factory ImpressoraData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImpressoraData(
      id: serializer.fromJson<String>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      modelo: serializer.fromJson<String>(json['modelo']),
      ativo: serializer.fromJson<bool>(json['ativo']),
      tipoConexao: serializer.fromJson<String>(json['tipoConexao']),
      ip: serializer.fromJson<String>(json['ip']),
      porta: serializer.fromJson<String>(json['porta']),
      tipoImpressao: serializer.fromJson<String>(json['tipoImpressao']),
      empresaId: serializer.fromJson<String>(json['empresaId']),
      dataCriacao: serializer.fromJson<DateTime>(json['dataCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nome': serializer.toJson<String>(nome),
      'modelo': serializer.toJson<String>(modelo),
      'ativo': serializer.toJson<bool>(ativo),
      'tipoConexao': serializer.toJson<String>(tipoConexao),
      'ip': serializer.toJson<String>(ip),
      'porta': serializer.toJson<String>(porta),
      'tipoImpressao': serializer.toJson<String>(tipoImpressao),
      'empresaId': serializer.toJson<String>(empresaId),
      'dataCriacao': serializer.toJson<DateTime>(dataCriacao),
    };
  }

  ImpressoraData copyWith(
          {String? id,
          String? nome,
          String? modelo,
          bool? ativo,
          String? tipoConexao,
          String? ip,
          String? porta,
          String? tipoImpressao,
          String? empresaId,
          DateTime? dataCriacao}) =>
      ImpressoraData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        modelo: modelo ?? this.modelo,
        ativo: ativo ?? this.ativo,
        tipoConexao: tipoConexao ?? this.tipoConexao,
        ip: ip ?? this.ip,
        porta: porta ?? this.porta,
        tipoImpressao: tipoImpressao ?? this.tipoImpressao,
        empresaId: empresaId ?? this.empresaId,
        dataCriacao: dataCriacao ?? this.dataCriacao,
      );
  ImpressoraData copyWithCompanion(ImpressoraCompanion data) {
    return ImpressoraData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      modelo: data.modelo.present ? data.modelo.value : this.modelo,
      ativo: data.ativo.present ? data.ativo.value : this.ativo,
      tipoConexao:
          data.tipoConexao.present ? data.tipoConexao.value : this.tipoConexao,
      ip: data.ip.present ? data.ip.value : this.ip,
      porta: data.porta.present ? data.porta.value : this.porta,
      tipoImpressao: data.tipoImpressao.present
          ? data.tipoImpressao.value
          : this.tipoImpressao,
      empresaId: data.empresaId.present ? data.empresaId.value : this.empresaId,
      dataCriacao:
          data.dataCriacao.present ? data.dataCriacao.value : this.dataCriacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImpressoraData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('modelo: $modelo, ')
          ..write('ativo: $ativo, ')
          ..write('tipoConexao: $tipoConexao, ')
          ..write('ip: $ip, ')
          ..write('porta: $porta, ')
          ..write('tipoImpressao: $tipoImpressao, ')
          ..write('empresaId: $empresaId, ')
          ..write('dataCriacao: $dataCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, modelo, ativo, tipoConexao, ip,
      porta, tipoImpressao, empresaId, dataCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImpressoraData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.modelo == this.modelo &&
          other.ativo == this.ativo &&
          other.tipoConexao == this.tipoConexao &&
          other.ip == this.ip &&
          other.porta == this.porta &&
          other.tipoImpressao == this.tipoImpressao &&
          other.empresaId == this.empresaId &&
          other.dataCriacao == this.dataCriacao);
}

class ImpressoraCompanion extends UpdateCompanion<ImpressoraData> {
  final Value<String> id;
  final Value<String> nome;
  final Value<String> modelo;
  final Value<bool> ativo;
  final Value<String> tipoConexao;
  final Value<String> ip;
  final Value<String> porta;
  final Value<String> tipoImpressao;
  final Value<String> empresaId;
  final Value<DateTime> dataCriacao;
  final Value<int> rowid;
  const ImpressoraCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.modelo = const Value.absent(),
    this.ativo = const Value.absent(),
    this.tipoConexao = const Value.absent(),
    this.ip = const Value.absent(),
    this.porta = const Value.absent(),
    this.tipoImpressao = const Value.absent(),
    this.empresaId = const Value.absent(),
    this.dataCriacao = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImpressoraCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String modelo,
    this.ativo = const Value.absent(),
    required String tipoConexao,
    required String ip,
    required String porta,
    required String tipoImpressao,
    required String empresaId,
    this.dataCriacao = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : nome = Value(nome),
        modelo = Value(modelo),
        tipoConexao = Value(tipoConexao),
        ip = Value(ip),
        porta = Value(porta),
        tipoImpressao = Value(tipoImpressao),
        empresaId = Value(empresaId);
  static Insertable<ImpressoraData> custom({
    Expression<String>? id,
    Expression<String>? nome,
    Expression<String>? modelo,
    Expression<bool>? ativo,
    Expression<String>? tipoConexao,
    Expression<String>? ip,
    Expression<String>? porta,
    Expression<String>? tipoImpressao,
    Expression<String>? empresaId,
    Expression<DateTime>? dataCriacao,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (modelo != null) 'modelo': modelo,
      if (ativo != null) 'ativo': ativo,
      if (tipoConexao != null) 'tipo_conexao': tipoConexao,
      if (ip != null) 'ip': ip,
      if (porta != null) 'porta': porta,
      if (tipoImpressao != null) 'tipo_impressao': tipoImpressao,
      if (empresaId != null) 'empresa_id': empresaId,
      if (dataCriacao != null) 'data_criacao': dataCriacao,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImpressoraCompanion copyWith(
      {Value<String>? id,
      Value<String>? nome,
      Value<String>? modelo,
      Value<bool>? ativo,
      Value<String>? tipoConexao,
      Value<String>? ip,
      Value<String>? porta,
      Value<String>? tipoImpressao,
      Value<String>? empresaId,
      Value<DateTime>? dataCriacao,
      Value<int>? rowid}) {
    return ImpressoraCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      modelo: modelo ?? this.modelo,
      ativo: ativo ?? this.ativo,
      tipoConexao: tipoConexao ?? this.tipoConexao,
      ip: ip ?? this.ip,
      porta: porta ?? this.porta,
      tipoImpressao: tipoImpressao ?? this.tipoImpressao,
      empresaId: empresaId ?? this.empresaId,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (modelo.present) {
      map['modelo'] = Variable<String>(modelo.value);
    }
    if (ativo.present) {
      map['ativo'] = Variable<bool>(ativo.value);
    }
    if (tipoConexao.present) {
      map['tipo_conexao'] = Variable<String>(tipoConexao.value);
    }
    if (ip.present) {
      map['ip'] = Variable<String>(ip.value);
    }
    if (porta.present) {
      map['porta'] = Variable<String>(porta.value);
    }
    if (tipoImpressao.present) {
      map['tipo_impressao'] = Variable<String>(tipoImpressao.value);
    }
    if (empresaId.present) {
      map['empresa_id'] = Variable<String>(empresaId.value);
    }
    if (dataCriacao.present) {
      map['data_criacao'] = Variable<DateTime>(dataCriacao.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImpressoraCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('modelo: $modelo, ')
          ..write('ativo: $ativo, ')
          ..write('tipoConexao: $tipoConexao, ')
          ..write('ip: $ip, ')
          ..write('porta: $porta, ')
          ..write('tipoImpressao: $tipoImpressao, ')
          ..write('empresaId: $empresaId, ')
          ..write('dataCriacao: $dataCriacao, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $ImpressoraTable impressora = $ImpressoraTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItems, impressora];
}

typedef $$TodoItemsTableCreateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<DateTime?> createdAt,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<DateTime?> createdAt,
});

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
    TodoItem,
    PrefetchHooks Function()> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion(
            id: id,
            title: title,
            content: content,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion.insert(
            id: id,
            title: title,
            content: content,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TodoItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
    TodoItem,
    PrefetchHooks Function()>;
typedef $$ImpressoraTableCreateCompanionBuilder = ImpressoraCompanion Function({
  Value<String> id,
  required String nome,
  required String modelo,
  Value<bool> ativo,
  required String tipoConexao,
  required String ip,
  required String porta,
  required String tipoImpressao,
  required String empresaId,
  Value<DateTime> dataCriacao,
  Value<int> rowid,
});
typedef $$ImpressoraTableUpdateCompanionBuilder = ImpressoraCompanion Function({
  Value<String> id,
  Value<String> nome,
  Value<String> modelo,
  Value<bool> ativo,
  Value<String> tipoConexao,
  Value<String> ip,
  Value<String> porta,
  Value<String> tipoImpressao,
  Value<String> empresaId,
  Value<DateTime> dataCriacao,
  Value<int> rowid,
});

class $$ImpressoraTableFilterComposer
    extends Composer<_$AppDatabase, $ImpressoraTable> {
  $$ImpressoraTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modelo => $composableBuilder(
      column: $table.modelo, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ativo => $composableBuilder(
      column: $table.ativo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipoConexao => $composableBuilder(
      column: $table.tipoConexao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ip => $composableBuilder(
      column: $table.ip, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get porta => $composableBuilder(
      column: $table.porta, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipoImpressao => $composableBuilder(
      column: $table.tipoImpressao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get empresaId => $composableBuilder(
      column: $table.empresaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dataCriacao => $composableBuilder(
      column: $table.dataCriacao, builder: (column) => ColumnFilters(column));
}

class $$ImpressoraTableOrderingComposer
    extends Composer<_$AppDatabase, $ImpressoraTable> {
  $$ImpressoraTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modelo => $composableBuilder(
      column: $table.modelo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ativo => $composableBuilder(
      column: $table.ativo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipoConexao => $composableBuilder(
      column: $table.tipoConexao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ip => $composableBuilder(
      column: $table.ip, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get porta => $composableBuilder(
      column: $table.porta, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipoImpressao => $composableBuilder(
      column: $table.tipoImpressao,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get empresaId => $composableBuilder(
      column: $table.empresaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dataCriacao => $composableBuilder(
      column: $table.dataCriacao, builder: (column) => ColumnOrderings(column));
}

class $$ImpressoraTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImpressoraTable> {
  $$ImpressoraTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get modelo =>
      $composableBuilder(column: $table.modelo, builder: (column) => column);

  GeneratedColumn<bool> get ativo =>
      $composableBuilder(column: $table.ativo, builder: (column) => column);

  GeneratedColumn<String> get tipoConexao => $composableBuilder(
      column: $table.tipoConexao, builder: (column) => column);

  GeneratedColumn<String> get ip =>
      $composableBuilder(column: $table.ip, builder: (column) => column);

  GeneratedColumn<String> get porta =>
      $composableBuilder(column: $table.porta, builder: (column) => column);

  GeneratedColumn<String> get tipoImpressao => $composableBuilder(
      column: $table.tipoImpressao, builder: (column) => column);

  GeneratedColumn<String> get empresaId =>
      $composableBuilder(column: $table.empresaId, builder: (column) => column);

  GeneratedColumn<DateTime> get dataCriacao => $composableBuilder(
      column: $table.dataCriacao, builder: (column) => column);
}

class $$ImpressoraTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImpressoraTable,
    ImpressoraData,
    $$ImpressoraTableFilterComposer,
    $$ImpressoraTableOrderingComposer,
    $$ImpressoraTableAnnotationComposer,
    $$ImpressoraTableCreateCompanionBuilder,
    $$ImpressoraTableUpdateCompanionBuilder,
    (
      ImpressoraData,
      BaseReferences<_$AppDatabase, $ImpressoraTable, ImpressoraData>
    ),
    ImpressoraData,
    PrefetchHooks Function()> {
  $$ImpressoraTableTableManager(_$AppDatabase db, $ImpressoraTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImpressoraTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImpressoraTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImpressoraTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> modelo = const Value.absent(),
            Value<bool> ativo = const Value.absent(),
            Value<String> tipoConexao = const Value.absent(),
            Value<String> ip = const Value.absent(),
            Value<String> porta = const Value.absent(),
            Value<String> tipoImpressao = const Value.absent(),
            Value<String> empresaId = const Value.absent(),
            Value<DateTime> dataCriacao = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ImpressoraCompanion(
            id: id,
            nome: nome,
            modelo: modelo,
            ativo: ativo,
            tipoConexao: tipoConexao,
            ip: ip,
            porta: porta,
            tipoImpressao: tipoImpressao,
            empresaId: empresaId,
            dataCriacao: dataCriacao,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String nome,
            required String modelo,
            Value<bool> ativo = const Value.absent(),
            required String tipoConexao,
            required String ip,
            required String porta,
            required String tipoImpressao,
            required String empresaId,
            Value<DateTime> dataCriacao = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ImpressoraCompanion.insert(
            id: id,
            nome: nome,
            modelo: modelo,
            ativo: ativo,
            tipoConexao: tipoConexao,
            ip: ip,
            porta: porta,
            tipoImpressao: tipoImpressao,
            empresaId: empresaId,
            dataCriacao: dataCriacao,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ImpressoraTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ImpressoraTable,
    ImpressoraData,
    $$ImpressoraTableFilterComposer,
    $$ImpressoraTableOrderingComposer,
    $$ImpressoraTableAnnotationComposer,
    $$ImpressoraTableCreateCompanionBuilder,
    $$ImpressoraTableUpdateCompanionBuilder,
    (
      ImpressoraData,
      BaseReferences<_$AppDatabase, $ImpressoraTable, ImpressoraData>
    ),
    ImpressoraData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$ImpressoraTableTableManager get impressora =>
      $$ImpressoraTableTableManager(_db, _db.impressora);
}
