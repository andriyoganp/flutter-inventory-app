import 'package:drift/drift.dart';

import 'auto_increment_primary_key.dart';

@DataClassName('ToolEntity')
class Tools extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();

  TextColumn get imageUrl => text()();

  IntColumn get totalItem => integer()();
}
