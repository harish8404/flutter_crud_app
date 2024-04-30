import 'package:base_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{
  Future<Either<Failure,String>> signUpWithMobilePassword({
    required String name,
    required String mobile,
    required String password,
  });
  Future<Either<Failure,String>> signInWithMobilePassword({
    required String mobile,
    required String password,
  });
}