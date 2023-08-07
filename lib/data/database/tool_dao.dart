import 'package:drift/drift.dart';

import 'inventory_database.dart';
import 'tool_entity.dart';

part 'tool_dao.g.dart';

@DriftAccessor(tables: <Type>[Tools])
class ToolDao extends DatabaseAccessor<InventoryDatabase> with _$ToolDaoMixin {
  ToolDao(super.db);

  Stream<List<ToolEntity>> getAllTools() {
    final SimpleSelectStatement<$ToolsTable, ToolEntity> query = select(tools)
      ..orderBy(<OrderingTerm Function($ToolsTable)>[
        ($ToolsTable t) => OrderingTerm(expression: t.name)
      ]);
    return query.watch();
  }
}
