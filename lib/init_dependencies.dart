import 'package:base_app/core/secrets/app_secrets.dart';
import 'package:base_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:base_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:base_app/features/auth/domain/repository/auth_repository.dart';
import 'package:base_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:base_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  serviceLocator.registerLazySingleton(() => supabase);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()));
  // serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  // serviceLocator.registerFactory(() => AuthBloc(userSignUp: serviceLocator()));
}
