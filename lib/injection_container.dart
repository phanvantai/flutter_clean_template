import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helpers/helpers.dart';
import 'core/network/api_service.dart';
import 'features/common/data/repositories/validation_repository_impl.dart';
import 'features/common/domain/repositories/validation_repository.dart';
import 'features/common/domain/usecases/validate_email.dart';
import 'features/common/domain/usecases/validate_password.dart';
import 'features/common/domain/usecases/validate_repassword.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // ViewModels
  // getIt.registerFactory(() => SplashViewModel());
  // getIt.registerFactory(() => LoginViewModel(
  //       loginUseCase: getIt(),
  //       validateEmailUsecase: getIt(),
  //       validatePasswordUsecase: getIt(),
  //     ));

  // Use cases
  //getIt.registerLazySingleton(() => Login(repository: getIt()));

  getIt.registerLazySingleton(
      () => ValidateEmail(validationRepository: getIt()));
  getIt.registerLazySingleton(
      () => ValidatePassword(validationRepository: getIt()));
  getIt.registerLazySingleton(
      () => ValidateRepassword(validationRepository: getIt()));

  // Repository
  getIt.registerLazySingleton<ValidationRepository>(
      () => ValidationRepositoryImpl());

  // Data sources
  // getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
  //   () => AuthenticationRemoteDataSourceImpl(getIt()),
  // );

  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  getIt.registerFactory(() => Dio());
  getIt.registerFactory(() => ApiService(getIt()));
}
