import 'package:drift/drift.dart';

import 'auto_increment_primary_key.dart';

@DataClassName('FriendEntity')
class Friends extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();
}
