import '../model/friend.dart';

abstract class GetAllFriendsUseCase {
  Stream<List<Friend>> invoke();
}
