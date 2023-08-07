import '../../data/repository/friend_repository.dart';
import '../model/friend.dart';
import 'get_all_friends_use_case.dart';

class GetAllFriendsUseCaseImpl extends GetAllFriendsUseCase {
  GetAllFriendsUseCaseImpl(this._repository);

  final FriendRepository _repository;

  @override
  Stream<List<Friend>> invoke() => _repository.getAllFriendsWithLoanedItem();
}
