import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class ResetPasswordUsecaseInput extends Input {
  ResetPasswordUsecaseInput({
    required this.verificationToken,
    required this.phone,
    required this.password,
  });

  final String verificationToken;
  final String password;
  final String phone;
}

class ResetPasswordUsecaseOutput extends Output {
  ResetPasswordUsecaseOutput();
}

@lazySingleton
class ResetPasswordUsecase
    extends Usecase<ResetPasswordUsecaseInput, ResetPasswordUsecaseOutput> {
  final AuthRepository _authRepository;

  ResetPasswordUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<ResetPasswordUsecaseOutput> call(
      ResetPasswordUsecaseInput input) async {
    return await _authRepository.resetPassword(input);
  }
}
