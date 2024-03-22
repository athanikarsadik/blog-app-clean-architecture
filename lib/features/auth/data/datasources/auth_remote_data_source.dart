import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSources {
  Future<String> signUpwithEmailPassword(
      {required String name, required String email, required String password});
  Future<String> signInwithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSources {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> signInwithEmailPassword(
      {required String email, required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
        throw const ServerExceptions("User is null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
