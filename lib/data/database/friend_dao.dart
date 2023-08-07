import 'package:drift/drift.dart';

import 'friend_entity.dart';
import 'inventory_database.dart';

part 'friend_dao.g.dart';

@DriftAccessor(tables: <Type>[Friends])
class FriendDao extends DatabaseAccessor<InventoryDatabase>
    with _$FriendDaoMixin {
  FriendDao(super.db);

  Stream<List<FriendEntity>> getAllFriends() {
    final SimpleSelectStatement<$FriendsTable, FriendEntity> query =
        select(friends)
          ..orderBy(<OrderingTerm Function($FriendsTable)>[
            ($FriendsTable f) => OrderingTerm(expression: f.name)
          ]);
    return query.watch();
  }
}
