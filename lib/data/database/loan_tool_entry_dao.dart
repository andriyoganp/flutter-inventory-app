import 'package:drift/drift.dart';

import 'friend_entity.dart';
import 'friend_loaned_tool_count_entity.dart';
import 'inventory_database.dart';
import 'loan_tool_entry_entity.dart';
import 'loaned_tool_entity.dart';
import 'tool_entity.dart';

part 'loan_tool_entry_dao.g.dart';

@DriftAccessor(tables: <Type>[LoanToolEntries, Tools, Friends])
class LoanToolEntryDao extends DatabaseAccessor<InventoryDatabase>
    with _$LoanToolEntryDaoMixin {
  LoanToolEntryDao(super.attachedDatabase);

  Stream<List<FriendLoanedToolCountEntity>> getAllFriendsWithLoanedItem() {
    final Expression<int> sum = loanToolEntries.loanedCount.sum();
    final SimpleSelectStatement<$LoanToolEntriesTable, LoanToolEntryEntity>
        query = select(loanToolEntries);

    final JoinedSelectStatement<HasResultSet, dynamic> queryInnerJoin = query
        .join(<Join<HasResultSet, dynamic>>[
      innerJoin(friends, friends.id.equalsExp(loanToolEntries.friendId))
    ]);

    queryInnerJoin
      ..addColumns(<Expression<Object>>[sum])
      ..groupBy(<Expression<Object>>[friends.name])
      ..orderBy(<OrderingTerm>[OrderingTerm(expression: friends.name)]);
    return queryInnerJoin.map((TypedResult row) {
      return FriendLoanedToolCountEntity(
        id: row.readTable(friends).id,
        name: row.readTable(friends).name,
        totalItemLoaned: row.read(sum) ?? 0,
      );
    }).watch();
  }

  Stream<List<LoanedToolEntity>> getLoanedTools() {
    final Expression<int> sum = loanToolEntries.loanedCount.sum();
    final SimpleSelectStatement<$LoanToolEntriesTable, LoanToolEntryEntity>
        query = select(loanToolEntries);

    final JoinedSelectStatement<HasResultSet, dynamic> queryInnerJoin = query
        .join(<Join<HasResultSet, dynamic>>[
      innerJoin(tools, tools.id.equalsExp(loanToolEntries.toolId))
    ]);

    queryInnerJoin
      ..addColumns(<Expression<Object>>[sum])
      ..groupBy(<Expression<Object>>[tools.name])
      ..orderBy(<OrderingTerm>[OrderingTerm(expression: tools.name)]);
    return queryInnerJoin.map((TypedResult row) {
      return LoanedToolEntity(row.readTable(tools), row.read(sum) ?? 0);
    }).watch();
  }

  Future<List<LoanedToolEntity>> getLoanedToolByFriends(int toolId) {
    final Expression<int> sum = loanToolEntries.loanedCount.sum();

    final SimpleSelectStatement<$FriendsTable, FriendEntity> query = select(friends);
    final JoinedSelectStatement<HasResultSet, dynamic> queryInnerJoin =
        query.join(<Join<HasResultSet, dynamic>>[
      innerJoin(loanToolEntries, loanToolEntries.friendId.equalsExp(friends.id)),
      innerJoin(tools, tools.id.equalsExp(loanToolEntries.toolId))
    ]);

    queryInnerJoin
      ..addColumns(<Expression<Object>>[sum])
      ..where(tools.id.equals(toolId))
      ..groupBy(<Expression<Object>>[friends.name])
      ..orderBy(<OrderingTerm>[OrderingTerm(expression: friends.name)]);
    return queryInnerJoin.map((TypedResult row) {
      return LoanedToolEntity(
        row.readTable(tools),
        row.read(sum) ?? 0,
        friend: row.readTable(friends),
      );
    }).get();
  }
}
