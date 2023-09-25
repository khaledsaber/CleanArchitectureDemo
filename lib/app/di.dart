import 'package:clean_architecture_demo/app/app_prefs.dart';
import 'package:clean_architecture_demo/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_demo/data/network/app_api.dart';
import 'package:clean_architecture_demo/data/network/dio_factory.dart';
import 'package:clean_architecture_demo/data/repository/repository_impl.dart';
import 'package:clean_architecture_demo/domain/repository/repository.dart';
import 'package:clean_architecture_demo/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_demo/presentation/login/view_model/login_view_model.dart';
import 'package:dio/src/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/network_info.dart';

final instance = GetIt.instance;

Future<void> intiAppModule() async {
  // here we put all dependencies that are generic  for the whole project

  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  AppPreferences appPreferences = AppPreferences(sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

intiLoginModule() {

  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));

  }




}
