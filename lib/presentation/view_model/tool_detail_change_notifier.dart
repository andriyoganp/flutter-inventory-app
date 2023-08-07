import 'package:flutter/foundation.dart';

import '../../domain/model/loaned_tool.dart';
import '../../domain/model/tool.dart';
import '../../domain/usecase/get_loaned_tools_use_case.dart';

class ToolDetailChangeNotifier extends ChangeNotifier {
  ToolDetailChangeNotifier(this._getLoanedToolsUseCase);

  final GetLoanedToolsUseCase _getLoanedToolsUseCase;

  LoanedTool _loanedTool = LoanedTool(
      tool: Tool(id: -1, name: '', imageUrl: '', totalItem: 0),
      totalLoanedCount: 0);

  LoanedTool get loanedTool => _loanedTool;

  Future<void> getLoanedToolByFriends(int toolId) async {
    _loanedTool = await _getLoanedToolsUseCase.loanedToolByFriend(toolId);
    notifyListeners();
  }
}
