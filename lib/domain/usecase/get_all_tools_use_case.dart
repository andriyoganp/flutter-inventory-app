import '../model/tool.dart';

abstract class GetAllToolsUseCase {
  Stream<List<Tool>> invoke();
}
