// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_database.dart';

// ignore_for_file: type=lint
class $FriendsTable extends Friends
    with TableInfo<$FriendsTable, FriendEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'friends';
  @override
  String get actualTableName => 'friends';
  @override
  VerificationContext validateIntegrity(Insertable<FriendEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FriendEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FriendEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $FriendsTable createAlias(String alias) {
    return $FriendsTable(attachedDatabase, alias);
  }
}

class FriendEntity extends DataClass implements Insertable<FriendEntity> {
  final int id;
  final String name;
  const FriendEntity({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  FriendsCompanion toCompanion(bool nullToAbsent) {
    return FriendsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory FriendEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FriendEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FriendEntity copyWith({int? id, String? name}) => FriendEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('FriendEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FriendEntity && other.id == this.id && other.name == this.name);
}

class FriendsCompanion extends UpdateCompanion<FriendEntity> {
  final Value<int> id;
  final Value<String> name;
  const FriendsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FriendsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<FriendEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FriendsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return FriendsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ToolsTable extends Tools with TableInfo<$ToolsTable, ToolEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalItemMeta =
      const VerificationMeta('totalItem');
  @override
  late final GeneratedColumn<int> totalItem = GeneratedColumn<int>(
      'total_item', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, imageUrl, totalItem];
  @override
  String get aliasedName => _alias ?? 'tools';
  @override
  String get actualTableName => 'tools';
  @override
  VerificationContext validateIntegrity(Insertable<ToolEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('total_item')) {
      context.handle(_totalItemMeta,
          totalItem.isAcceptableOrUnknown(data['total_item']!, _totalItemMeta));
    } else if (isInserting) {
      context.missing(_totalItemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToolEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToolEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      totalItem: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_item'])!,
    );
  }

  @override
  $ToolsTable createAlias(String alias) {
    return $ToolsTable(attachedDatabase, alias);
  }
}

class ToolEntity extends DataClass implements Insertable<ToolEntity> {
  final int id;
  final String name;
  final String imageUrl;
  final int totalItem;
  const ToolEntity(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.totalItem});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    map['total_item'] = Variable<int>(totalItem);
    return map;
  }

  ToolsCompanion toCompanion(bool nullToAbsent) {
    return ToolsCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: Value(imageUrl),
      totalItem: Value(totalItem),
    );
  }

  factory ToolEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToolEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      totalItem: serializer.fromJson<int>(json['totalItem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'totalItem': serializer.toJson<int>(totalItem),
    };
  }

  ToolEntity copyWith(
          {int? id, String? name, String? imageUrl, int? totalItem}) =>
      ToolEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        totalItem: totalItem ?? this.totalItem,
      );
  @override
  String toString() {
    return (StringBuffer('ToolEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('totalItem: $totalItem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUrl, totalItem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToolEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.totalItem == this.totalItem);
}

class ToolsCompanion extends UpdateCompanion<ToolEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<int> totalItem;
  const ToolsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.totalItem = const Value.absent(),
  });
  ToolsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String imageUrl,
    required int totalItem,
  })  : name = Value(name),
        imageUrl = Value(imageUrl),
        totalItem = Value(totalItem);
  static Insertable<ToolEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<int>? totalItem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (totalItem != null) 'total_item': totalItem,
    });
  }

  ToolsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<int>? totalItem}) {
    return ToolsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      totalItem: totalItem ?? this.totalItem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (totalItem.present) {
      map['total_item'] = Variable<int>(totalItem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToolsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('totalItem: $totalItem')
          ..write(')'))
        .toString();
  }
}

class $LoanToolEntriesTable extends LoanToolEntries
    with TableInfo<$LoanToolEntriesTable, LoanToolEntryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanToolEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _toolIdMeta = const VerificationMeta('toolId');
  @override
  late final GeneratedColumn<int> toolId = GeneratedColumn<int>(
      'tool_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tools (id)'));
  static const VerificationMeta _friendIdMeta =
      const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int> friendId = GeneratedColumn<int>(
      'friend_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES friends (id)'));
  static const VerificationMeta _loanedCountMeta =
      const VerificationMeta('loanedCount');
  @override
  late final GeneratedColumn<int> loanedCount = GeneratedColumn<int>(
      'loaned_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loanedDateMeta =
      const VerificationMeta('loanedDate');
  @override
  late final GeneratedColumn<DateTime> loanedDate = GeneratedColumn<DateTime>(
      'loaned_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [toolId, friendId, loanedCount, loanedDate];
  @override
  String get aliasedName => _alias ?? 'loan_tool_entries';
  @override
  String get actualTableName => 'loan_tool_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<LoanToolEntryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tool_id')) {
      context.handle(_toolIdMeta,
          toolId.isAcceptableOrUnknown(data['tool_id']!, _toolIdMeta));
    } else if (isInserting) {
      context.missing(_toolIdMeta);
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('loaned_count')) {
      context.handle(
          _loanedCountMeta,
          loanedCount.isAcceptableOrUnknown(
              data['loaned_count']!, _loanedCountMeta));
    } else if (isInserting) {
      context.missing(_loanedCountMeta);
    }
    if (data.containsKey('loaned_date')) {
      context.handle(
          _loanedDateMeta,
          loanedDate.isAcceptableOrUnknown(
              data['loaned_date']!, _loanedDateMeta));
    } else if (isInserting) {
      context.missing(_loanedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LoanToolEntryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanToolEntryEntity(
      toolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tool_id'])!,
      friendId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_id'])!,
      loanedCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaned_count'])!,
      loanedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}loaned_date'])!,
    );
  }

  @override
  $LoanToolEntriesTable createAlias(String alias) {
    return $LoanToolEntriesTable(attachedDatabase, alias);
  }
}

class LoanToolEntryEntity extends DataClass
    implements Insertable<LoanToolEntryEntity> {
  final int toolId;
  final int friendId;
  final int loanedCount;
  final DateTime loanedDate;
  const LoanToolEntryEntity(
      {required this.toolId,
      required this.friendId,
      required this.loanedCount,
      required this.loanedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tool_id'] = Variable<int>(toolId);
    map['friend_id'] = Variable<int>(friendId);
    map['loaned_count'] = Variable<int>(loanedCount);
    map['loaned_date'] = Variable<DateTime>(loanedDate);
    return map;
  }

  LoanToolEntriesCompanion toCompanion(bool nullToAbsent) {
    return LoanToolEntriesCompanion(
      toolId: Value(toolId),
      friendId: Value(friendId),
      loanedCount: Value(loanedCount),
      loanedDate: Value(loanedDate),
    );
  }

  factory LoanToolEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanToolEntryEntity(
      toolId: serializer.fromJson<int>(json['toolId']),
      friendId: serializer.fromJson<int>(json['friendId']),
      loanedCount: serializer.fromJson<int>(json['loanedCount']),
      loanedDate: serializer.fromJson<DateTime>(json['loanedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'toolId': serializer.toJson<int>(toolId),
      'friendId': serializer.toJson<int>(friendId),
      'loanedCount': serializer.toJson<int>(loanedCount),
      'loanedDate': serializer.toJson<DateTime>(loanedDate),
    };
  }

  LoanToolEntryEntity copyWith(
          {int? toolId,
          int? friendId,
          int? loanedCount,
          DateTime? loanedDate}) =>
      LoanToolEntryEntity(
        toolId: toolId ?? this.toolId,
        friendId: friendId ?? this.friendId,
        loanedCount: loanedCount ?? this.loanedCount,
        loanedDate: loanedDate ?? this.loanedDate,
      );
  @override
  String toString() {
    return (StringBuffer('LoanToolEntryEntity(')
          ..write('toolId: $toolId, ')
          ..write('friendId: $friendId, ')
          ..write('loanedCount: $loanedCount, ')
          ..write('loanedDate: $loanedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(toolId, friendId, loanedCount, loanedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanToolEntryEntity &&
          other.toolId == this.toolId &&
          other.friendId == this.friendId &&
          other.loanedCount == this.loanedCount &&
          other.loanedDate == this.loanedDate);
}

class LoanToolEntriesCompanion extends UpdateCompanion<LoanToolEntryEntity> {
  final Value<int> toolId;
  final Value<int> friendId;
  final Value<int> loanedCount;
  final Value<DateTime> loanedDate;
  final Value<int> rowid;
  const LoanToolEntriesCompanion({
    this.toolId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.loanedCount = const Value.absent(),
    this.loanedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoanToolEntriesCompanion.insert({
    required int toolId,
    required int friendId,
    required int loanedCount,
    required DateTime loanedDate,
    this.rowid = const Value.absent(),
  })  : toolId = Value(toolId),
        friendId = Value(friendId),
        loanedCount = Value(loanedCount),
        loanedDate = Value(loanedDate);
  static Insertable<LoanToolEntryEntity> custom({
    Expression<int>? toolId,
    Expression<int>? friendId,
    Expression<int>? loanedCount,
    Expression<DateTime>? loanedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (toolId != null) 'tool_id': toolId,
      if (friendId != null) 'friend_id': friendId,
      if (loanedCount != null) 'loaned_count': loanedCount,
      if (loanedDate != null) 'loaned_date': loanedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoanToolEntriesCompanion copyWith(
      {Value<int>? toolId,
      Value<int>? friendId,
      Value<int>? loanedCount,
      Value<DateTime>? loanedDate,
      Value<int>? rowid}) {
    return LoanToolEntriesCompanion(
      toolId: toolId ?? this.toolId,
      friendId: friendId ?? this.friendId,
      loanedCount: loanedCount ?? this.loanedCount,
      loanedDate: loanedDate ?? this.loanedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (toolId.present) {
      map['tool_id'] = Variable<int>(toolId.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (loanedCount.present) {
      map['loaned_count'] = Variable<int>(loanedCount.value);
    }
    if (loanedDate.present) {
      map['loaned_date'] = Variable<DateTime>(loanedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanToolEntriesCompanion(')
          ..write('toolId: $toolId, ')
          ..write('friendId: $friendId, ')
          ..write('loanedCount: $loanedCount, ')
          ..write('loanedDate: $loanedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$InventoryDatabase extends GeneratedDatabase {
  _$InventoryDatabase(QueryExecutor e) : super(e);
  late final $FriendsTable friends = $FriendsTable(this);
  late final $ToolsTable tools = $ToolsTable(this);
  late final $LoanToolEntriesTable loanToolEntries =
      $LoanToolEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [friends, tools, loanToolEntries];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
