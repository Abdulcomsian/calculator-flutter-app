import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class VerifyOtpUsecaseInput extends Input {
  VerifyOtpUsecaseInput({
    required this.phone,
    required this.otp,
  });

  final String phone;
  final String otp;
}

class VerifyOtpUsecaseOutput extends Output {
  VerifyOtpUsecaseOutput({required this.verificationToken});

  final String verificationToken;
}

@lazySingleton
class VerifyOtpUsecase
    extends Usecase<VerifyOtpUsecaseInput, VerifyOtpUsecaseOutput> {
  final AuthRepository _authRepository;

  VerifyOtpUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<VerifyOtpUsecaseOutput> call(VerifyOtpUsecaseInput input) async {
    return await _authRepository.verifyOtp(input);
  }
}
