// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $KeySlotsTable extends KeySlots with TableInfo<$KeySlotsTable, KeySlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeySlotsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<KeyType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<KeyType>($KeySlotsTable.$convertertype);
  static const VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<Uint8List> salt = GeneratedColumn<Uint8List>(
    'salt',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wrappedMasterKeyMeta = const VerificationMeta(
    'wrappedMasterKey',
  );
  @override
  late final GeneratedColumn<Uint8List> wrappedMasterKey =
      GeneratedColumn<Uint8List>(
        'wrapped_master_key',
        aliasedName,
        false,
        type: DriftSqlType.blob,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [type, salt, wrappedMasterKey];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeySlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('salt')) {
      context.handle(
        _saltMeta,
        salt.isAcceptableOrUnknown(data['salt']!, _saltMeta),
      );
    } else if (isInserting) {
      context.missing(_saltMeta);
    }
    if (data.containsKey('wrapped_master_key')) {
      context.handle(
        _wrappedMasterKeyMeta,
        wrappedMasterKey.isAcceptableOrUnknown(
          data['wrapped_master_key']!,
          _wrappedMasterKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wrappedMasterKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type};
  @override
  KeySlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeySlot(
      type: $KeySlotsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      salt: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}salt'],
      )!,
      wrappedMasterKey: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}wrapped_master_key'],
      )!,
    );
  }

  @override
  $KeySlotsTable createAlias(String alias) {
    return $KeySlotsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<KeyType, int, int> $convertertype =
      const EnumIndexConverter<KeyType>(KeyType.values);
}

class KeySlot extends DataClass implements Insertable<KeySlot> {
  final KeyType type;
  final Uint8List salt;
  final Uint8List wrappedMasterKey;
  const KeySlot({
    required this.type,
    required this.salt,
    required this.wrappedMasterKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['type'] = Variable<int>($KeySlotsTable.$convertertype.toSql(type));
    }
    map['salt'] = Variable<Uint8List>(salt);
    map['wrapped_master_key'] = Variable<Uint8List>(wrappedMasterKey);
    return map;
  }

  KeySlotsCompanion toCompanion(bool nullToAbsent) {
    return KeySlotsCompanion(
      type: Value(type),
      salt: Value(salt),
      wrappedMasterKey: Value(wrappedMasterKey),
    );
  }

  factory KeySlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeySlot(
      type: $KeySlotsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      salt: serializer.fromJson<Uint8List>(json['salt']),
      wrappedMasterKey: serializer.fromJson<Uint8List>(
        json['wrappedMasterKey'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<int>(
        $KeySlotsTable.$convertertype.toJson(type),
      ),
      'salt': serializer.toJson<Uint8List>(salt),
      'wrappedMasterKey': serializer.toJson<Uint8List>(wrappedMasterKey),
    };
  }

  KeySlot copyWith({
    KeyType? type,
    Uint8List? salt,
    Uint8List? wrappedMasterKey,
  }) => KeySlot(
    type: type ?? this.type,
    salt: salt ?? this.salt,
    wrappedMasterKey: wrappedMasterKey ?? this.wrappedMasterKey,
  );
  KeySlot copyWithCompanion(KeySlotsCompanion data) {
    return KeySlot(
      type: data.type.present ? data.type.value : this.type,
      salt: data.salt.present ? data.salt.value : this.salt,
      wrappedMasterKey: data.wrappedMasterKey.present
          ? data.wrappedMasterKey.value
          : this.wrappedMasterKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeySlot(')
          ..write('type: $type, ')
          ..write('salt: $salt, ')
          ..write('wrappedMasterKey: $wrappedMasterKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    type,
    $driftBlobEquality.hash(salt),
    $driftBlobEquality.hash(wrappedMasterKey),
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeySlot &&
          other.type == this.type &&
          $driftBlobEquality.equals(other.salt, this.salt) &&
          $driftBlobEquality.equals(
            other.wrappedMasterKey,
            this.wrappedMasterKey,
          ));
}

class KeySlotsCompanion extends UpdateCompanion<KeySlot> {
  final Value<KeyType> type;
  final Value<Uint8List> salt;
  final Value<Uint8List> wrappedMasterKey;
  const KeySlotsCompanion({
    this.type = const Value.absent(),
    this.salt = const Value.absent(),
    this.wrappedMasterKey = const Value.absent(),
  });
  KeySlotsCompanion.insert({
    this.type = const Value.absent(),
    required Uint8List salt,
    required Uint8List wrappedMasterKey,
  }) : salt = Value(salt),
       wrappedMasterKey = Value(wrappedMasterKey);
  static Insertable<KeySlot> custom({
    Expression<int>? type,
    Expression<Uint8List>? salt,
    Expression<Uint8List>? wrappedMasterKey,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (salt != null) 'salt': salt,
      if (wrappedMasterKey != null) 'wrapped_master_key': wrappedMasterKey,
    });
  }

  KeySlotsCompanion copyWith({
    Value<KeyType>? type,
    Value<Uint8List>? salt,
    Value<Uint8List>? wrappedMasterKey,
  }) {
    return KeySlotsCompanion(
      type: type ?? this.type,
      salt: salt ?? this.salt,
      wrappedMasterKey: wrappedMasterKey ?? this.wrappedMasterKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<int>(
        $KeySlotsTable.$convertertype.toSql(type.value),
      );
    }
    if (salt.present) {
      map['salt'] = Variable<Uint8List>(salt.value);
    }
    if (wrappedMasterKey.present) {
      map['wrapped_master_key'] = Variable<Uint8List>(wrappedMasterKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeySlotsCompanion(')
          ..write('type: $type, ')
          ..write('salt: $salt, ')
          ..write('wrappedMasterKey: $wrappedMasterKey')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $KeySlotsTable keySlots = $KeySlotsTable(this);
  late final KeySlotsDao keySlotsDao = KeySlotsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [keySlots];
}

typedef $$KeySlotsTableCreateCompanionBuilder =
    KeySlotsCompanion Function({
      Value<KeyType> type,
      required Uint8List salt,
      required Uint8List wrappedMasterKey,
    });
typedef $$KeySlotsTableUpdateCompanionBuilder =
    KeySlotsCompanion Function({
      Value<KeyType> type,
      Value<Uint8List> salt,
      Value<Uint8List> wrappedMasterKey,
    });

class $$KeySlotsTableFilterComposer
    extends Composer<_$AppDatabase, $KeySlotsTable> {
  $$KeySlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<KeyType, KeyType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<Uint8List> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get wrappedMasterKey => $composableBuilder(
    column: $table.wrappedMasterKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeySlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $KeySlotsTable> {
  $$KeySlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get salt => $composableBuilder(
    column: $table.salt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get wrappedMasterKey => $composableBuilder(
    column: $table.wrappedMasterKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeySlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeySlotsTable> {
  $$KeySlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<KeyType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<Uint8List> get salt =>
      $composableBuilder(column: $table.salt, builder: (column) => column);

  GeneratedColumn<Uint8List> get wrappedMasterKey => $composableBuilder(
    column: $table.wrappedMasterKey,
    builder: (column) => column,
  );
}

class $$KeySlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeySlotsTable,
          KeySlot,
          $$KeySlotsTableFilterComposer,
          $$KeySlotsTableOrderingComposer,
          $$KeySlotsTableAnnotationComposer,
          $$KeySlotsTableCreateCompanionBuilder,
          $$KeySlotsTableUpdateCompanionBuilder,
          (KeySlot, BaseReferences<_$AppDatabase, $KeySlotsTable, KeySlot>),
          KeySlot,
          PrefetchHooks Function()
        > {
  $$KeySlotsTableTableManager(_$AppDatabase db, $KeySlotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeySlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeySlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeySlotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<KeyType> type = const Value.absent(),
                Value<Uint8List> salt = const Value.absent(),
                Value<Uint8List> wrappedMasterKey = const Value.absent(),
              }) => KeySlotsCompanion(
                type: type,
                salt: salt,
                wrappedMasterKey: wrappedMasterKey,
              ),
          createCompanionCallback:
              ({
                Value<KeyType> type = const Value.absent(),
                required Uint8List salt,
                required Uint8List wrappedMasterKey,
              }) => KeySlotsCompanion.insert(
                type: type,
                salt: salt,
                wrappedMasterKey: wrappedMasterKey,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeySlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeySlotsTable,
      KeySlot,
      $$KeySlotsTableFilterComposer,
      $$KeySlotsTableOrderingComposer,
      $$KeySlotsTableAnnotationComposer,
      $$KeySlotsTableCreateCompanionBuilder,
      $$KeySlotsTableUpdateCompanionBuilder,
      (KeySlot, BaseReferences<_$AppDatabase, $KeySlotsTable, KeySlot>),
      KeySlot,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$KeySlotsTableTableManager get keySlots =>
      $$KeySlotsTableTableManager(_db, _db.keySlots);
}
