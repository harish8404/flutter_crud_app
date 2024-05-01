part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String mobile;
  final String password;
  final String name;

  AuthSignUp({
    required this.mobile,
    required this.password,
    required this.name,
  });
}

final class AuthLogin extends AuthEvent {
  final String mobile;
  final String password;

  AuthLogin({
    required this.mobile,
    required this.password,
  });
}

final class AuthIsUserLoggedIn extends AuthEvent {}
