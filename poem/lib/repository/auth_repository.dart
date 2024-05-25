import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem/services/apiServices.dart';

class AuthRepository{
  final AuthService _authService;
  AuthRepository(this._authService);

  Future login(String email, String password) async {
    return await _authService.login(email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authServiceProvider));
});