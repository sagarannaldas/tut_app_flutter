import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app_flutter/app/app_preferences.dart';
import 'package:tut_app_flutter/data/network/app_api.dart';
import 'package:tut_app_flutter/data/network/dio_factory.dart';
import 'package:tut_app_flutter/data/repository/repository_impl.dart';
import 'package:tut_app_flutter/domain/repository/repository.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/network_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // shared preference instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // app preference instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  // network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreferences>()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}
