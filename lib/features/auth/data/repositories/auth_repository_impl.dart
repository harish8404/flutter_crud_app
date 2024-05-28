import 'package:base_app/core/error/exceptions.dart';
import 'package:base_app/core/error/failures.dart';
import 'package:base_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:base_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  // final connectionChecker connectionChecker;
  const AuthRepositoryImpl(
    this.remoteDataSource,
    // this.connectionChecker,
  );

  @override
  Future<Either<Failure, String>> signInWithMobilePassword(
      {required String mobile, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithMobilePassword(
      {required String name,
      required String mobile,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithMobilePassword(
          name: name, mobile: mobile, password: password);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
