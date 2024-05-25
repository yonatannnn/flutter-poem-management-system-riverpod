import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem/providers/states/login_states.dart';
import 'package:poem/repository/auth_repository.dart';

class LoginController extends StateNotifier<LoginState> {
  final Ref ref;
  final AuthRepository _authRepository;

  LoginController(this.ref) 
    : _authRepository = ref.read(authRepositoryProvider), // Assuming you have an authRepositoryProvider
      super(const LoginStateInitial());

  Future<void> login(String email, String password) async {
    state = LoginStateLoading();
    try {
      await _authRepository.login(email, password);
      state = LoginStateSuccess();
    } catch (e) {
      state = LoginStateFailure(e.toString());
    }
  }
}

final loginControllerProvider = 
  StateNotifierProvider<LoginController, LoginState>((ref) => LoginController(ref));
