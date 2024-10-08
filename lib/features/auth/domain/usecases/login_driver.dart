import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class LoginDriverUsecaseInput extends Input {
  LoginDriverUsecaseInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LoginDriverUsecaseOutput extends Output {
  final String token;

  LoginDriverUsecaseOutput({required this.token});
}

@lazySingleton
class LoginDriverUsecase
    extends Usecase<LoginDriverUsecaseInput, LoginDriverUsecaseOutput> {
  final AuthRepository _authRepository;

  LoginDriverUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginDriverUsecaseOutput> call(LoginDriverUsecaseInput input) async {
    return await _authRepository.login(input);
  }
}
