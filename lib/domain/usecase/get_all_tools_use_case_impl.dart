import '../../data/repository/tool_repository.dart';
import '../model/tool.dart';
import 'get_all_tools_use_case.dart';

class GetAllToolsUseCaseImpl extends GetAllToolsUseCase {
  GetAllToolsUseCaseImpl(this._repository);

  final ToolRepository _repository;

  @override
  Stream<List<Tool>> invoke() => _repository.getAllTools();
}
