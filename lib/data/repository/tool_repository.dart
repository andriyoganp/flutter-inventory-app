import '../../domain/model/loaned_tool.dart';
import '../../domain/model/tool.dart';

abstract class ToolRepository {
  Stream<List<Tool>> getAllTools();

  Stream<List<LoanedTool>> getLoanedTools();

  Future<LoanedTool> getLoanedToolByFriend(int toolId);
}
