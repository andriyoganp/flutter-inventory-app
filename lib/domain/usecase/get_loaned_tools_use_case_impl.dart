import '../../data/repository/tool_repository.dart';
import '../model/loaned_tool.dart';
import 'get_loaned_tools_use_case.dart';

class GetLoanedToolsUseCaseImpl extends GetLoanedToolsUseCase {
  GetLoanedToolsUseCaseImpl(this._repository);

  final ToolRepository _repository;

  @override
  Stream<List<LoanedTool>> invoke() => _repository.getLoanedTools();

  @override
  Future<LoanedTool> loanedToolByFriend(int toolId) =>
      _repository.getLoanedToolByFriend(toolId);
}
