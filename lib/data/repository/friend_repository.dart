import '../../domain/model/friend.dart';

abstract class FriendRepository {
  Stream<List<Friend>> getAllFriends();

  Stream<List<Friend>> getAllFriendsWithLoanedItem();
}
