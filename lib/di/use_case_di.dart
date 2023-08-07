import 'package:get_it/get_it.dart';

import '../domain/usecase/get_all_friends_use_case.dart';
import '../domain/usecase/get_all_friends_use_case_impl.dart';
import '../domain/usecase/get_all_tools_use_case.dart';
import '../domain/usecase/get_all_tools_use_case_impl.dart';
import '../domain/usecase/get_loaned_tools_use_case.dart';
import '../domain/usecase/get_loaned_tools_use_case_impl.dart';
import '../domain/usecase/prepare_data_use_case.dart';
import '../domain/usecase/prepare_date_use_case_impl.dart';

void initUseCase(GetIt getIt) {
  getIt
    ..registerLazySingleton<PrepareDataUseCase>(
        () => PrepareDataUseCaseImpl(getIt(), getIt()))
    ..registerLazySingleton<GetAllFriendsUseCase>(
        () => GetAllFriendsUseCaseImpl(getIt()))
    ..registerLazySingleton<GetAllToolsUseCase>(
        () => GetAllToolsUseCaseImpl(getIt()))
  ..registerLazySingleton<GetLoanedToolsUseCase>(
          () => GetLoanedToolsUseCaseImpl(getIt()));
}
