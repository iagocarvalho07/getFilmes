import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/login/login_repositorie.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginRepositorie _loginRepository;
  LoginServiceImpl({
    required LoginRepositorie loginRepositorie,
  }) : _loginRepository = loginRepositorie;

  @override
  Future<UserCredential> login() => _loginRepository.login();
  
  @override
  Future<void> logout()=> _loginRepository.logout();
  
 
}
