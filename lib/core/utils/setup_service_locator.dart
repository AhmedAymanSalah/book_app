import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_imple.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(
        Dio(),
      ));
  getIt.registerLazySingleton<HomeRepoImple>(
    () => HomeRepoImple(
      homeLocalDataSource: HomeLocalDataSourceImple(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiServices>()),
    ),
  );
}
