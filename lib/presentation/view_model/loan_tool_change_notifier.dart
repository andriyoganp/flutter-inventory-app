import 'package:flutter/cupertino.dart';

import '../../domain/model/friend.dart';
import '../../domain/model/tool.dart';
import '../../domain/usecase/get_all_friends_use_case.dart';
import '../../domain/usecase/get_all_tools_use_case.dart';

class LoanToolChangeNotifier extends ChangeNotifier {
  LoanToolChangeNotifier(this._getAllToolsUseCase, this._getAllFriendsUseCase);

  final GetAllToolsUseCase _getAllToolsUseCase;
  final GetAllFriendsUseCase _getAllFriendsUseCase;

  Stream<List<Friend>> get friends => _getAllFriendsUseCase.invoke();

  Stream<List<Tool>> get tools => _getAllToolsUseCase.invoke();
}
