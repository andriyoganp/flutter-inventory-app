import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../domain/model/loaned_tool.dart';
import '../../domain/usecase/get_loaned_tools_use_case.dart';
import '../../domain/usecase/prepare_data_use_case.dart';

class DashboardChangeNotifier extends ChangeNotifier {
  DashboardChangeNotifier(
    this._prepareDataUseCase,
    this._getLoanedToolsUseCase,
  );

  final PrepareDataUseCase _prepareDataUseCase;
  final GetLoanedToolsUseCase _getLoanedToolsUseCase;

  Stream<List<LoanedTool>> get loanedTools => _getLoanedToolsUseCase.invoke();

  Future<void> prepareData() async {
    _prepareDataUseCase.invoke();
  }
}
