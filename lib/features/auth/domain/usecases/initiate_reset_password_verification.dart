import 'package:diesel_powered/features/auth/domain/repository/auth_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class InitiateResetPasswordVerificationUsecaseInput extends Input {
  InitiateResetPasswordVerificationUsecaseInput({
    required this.phone,
  });

  final String phone;
}

class InitiateResetPasswordVerificationUsecaseOutput extends Output {
  InitiateResetPasswordVerificationUsecaseOutput();
}

@lazySingleton
class InitiateResetPasswordVerificationUsecase extends Usecase<
    InitiateResetPasswordVerificationUsecaseInput,
    InitiateResetPasswordVerificationUsecaseOutput> {
  final AuthRepository _authRepository;

  InitiateResetPasswordVerificationUsecase(
      {required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput> call(
      InitiateResetPasswordVerificationUsecaseInput input) async {
    return await _authRepository.resetPasswordInitiateVerification(input);
  }
}
