import '../../domain/model/friend.dart';
import '../database/friend_dao.dart';
import '../database/friend_loaned_tool_count_entity.dart';
import '../database/inventory_database.dart';
import '../database/loan_tool_entry_dao.dart';
import 'friend_repository.dart';

class FriendRepositoryImpl extends FriendRepository {
  FriendRepositoryImpl(this._friendDao, this._loanToolEntryDao);

  final FriendDao _friendDao;

  final LoanToolEntryDao _loanToolEntryDao;

  @override
  Stream<List<Friend>> getAllFriends() =>
      _friendDao.getAllFriends().map((List<FriendEntity> list) => list
          .map((FriendEntity entity) => Friend(
                id: entity.id,
                name: entity.name,
              ))
          .toList());

  @override
  Stream<List<Friend>> getAllFriendsWithLoanedItem() => _loanToolEntryDao
      .getAllFriendsWithLoanedItem()
      .map((List<FriendLoanedToolCountEntity> list) => list
          .map((FriendLoanedToolCountEntity entity) => Friend(
              id: entity.id,
              name: entity.name,
              totalItemLoaned: entity.totalItemLoaned))
          .toList());
}
