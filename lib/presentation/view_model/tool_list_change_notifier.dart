import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../domain/model/tool.dart';
import '../../domain/usecase/get_all_tools_use_case.dart';

class ToolListChangeNotifier extends ChangeNotifier {
  ToolListChangeNotifier(this._getAllToolsUseCase);

  final GetAllToolsUseCase _getAllToolsUseCase;

  Stream<List<Tool>> get tools => _getAllToolsUseCase.invoke();
}
