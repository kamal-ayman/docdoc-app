import 'package:dio/dio.dart';
import 'package:docdoc_app/core/network/api_service.dart';
import 'package:docdoc_app/core/network/dio_factory.dart';
import 'package:docdoc_app/features/login/data/repos/login_repo.dart';
import 'package:docdoc_app/features/login/data/repos/login_repo.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/signup/logic/signup_cubit.dart';

final getIt = GetIt.instance;

void setupGitIt() {
  // Dio & ApiService.
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // sign up
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
