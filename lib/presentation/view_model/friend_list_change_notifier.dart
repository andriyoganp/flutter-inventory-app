import 'package:flutter/cupertino.dart';

import '../../domain/model/friend.dart';
import '../../domain/usecase/get_all_friends_use_case.dart';

class FriendListChangeNotifier extends ChangeNotifier {
  FriendListChangeNotifier(this._getAllFriendsUseCase);

  final GetAllFriendsUseCase _getAllFriendsUseCase;

  Stream<List<Friend>> get friends => _getAllFriendsUseCase.invoke();
}
