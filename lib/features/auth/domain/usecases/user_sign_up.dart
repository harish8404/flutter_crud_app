import 'package:base_app/core/error/failures.dart';
import 'package:base_app/core/usecase/usecase.dart';
// import 'package:base_app/core/common/entities/user.dart';
import 'package:base_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithMobilePassword(
      name: params.name,
      mobile: params.mobile,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String mobile;
  final String password;
  final String name;
  UserSignUpParams({
    required this.mobile,
    required this.password,
    required this.name,
  });
}
