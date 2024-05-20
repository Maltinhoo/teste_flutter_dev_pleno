import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_dev_pleno/core/storage/app_storage.dart';
import 'package:teste_dev_pleno/core/storage/shared_preferences_storage.dart';
import 'package:teste_dev_pleno/modules/home/external/datasources/home_datasource.dart';
import 'package:teste_dev_pleno/modules/home/home_imports.dart';

class ServiceLocator {
  ServiceLocator._();
  static GetIt get locator => GetIt.instance;

  static Future<void> initServiceLocator() async {
    await _registerServices();
    _registerExternal();
    _registerInfra();
    _registerPresenter();
  }

  static Future<void> _registerServices() async {
    GetIt.I.registerSingleton<Dio>(Dio()..interceptors.add(LogInterceptor()));
    GetIt.I.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    GetIt.I.registerLazySingleton<AppStorage>(
        () => SharedPreferencesStorage(locator()));
  }

  static void _registerExternal() async {
    GetIt.I.registerSingleton<IHomeDatasource>(HomeDatasourceHttp(locator()));
  }

  static void _registerInfra() async {
    GetIt.I.registerSingleton<IHomeRepository>(HomeRepository(locator()));
  }

  static void _registerPresenter() async {
    GetIt.I.registerFactory(() => HomeCubit(locator()));
  }
}
