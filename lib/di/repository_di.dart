import 'package:get_it/get_it.dart';

import '../data/repository/friend_repository.dart';
import '../data/repository/friend_repository_impl.dart';
import '../data/repository/tool_repository.dart';
import '../data/repository/tool_repository_impl.dart';

void initRepository(GetIt getIt) {
  getIt
    ..registerLazySingleton<FriendRepository>(
        () => FriendRepositoryImpl(getIt(), getIt()))
    ..registerLazySingleton<ToolRepository>(
        () => ToolRepositoryImpl(getIt(), getIt()));
}
