import 'package:base_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> signUpWithMobilePassword({
    required String name,
    required String mobile,
    required String password,
  });
  Future<String> signInWithMobilePassword({
    required String mobile,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<String> signInWithMobilePassword(
      {required String mobile, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithMobilePassword(
      {required String name,
      required String mobile,
      required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
          password: password,
          phone: mobile,
          data: {'name': name},
          email: 'haris8404@yahoo.com');
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
