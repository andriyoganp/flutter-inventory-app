import '../model/loaned_tool.dart';

abstract class GetLoanedToolsUseCase {
  Stream<List<LoanedTool>> invoke();
  Future<LoanedTool> loanedToolByFriend(int toolId);
}
