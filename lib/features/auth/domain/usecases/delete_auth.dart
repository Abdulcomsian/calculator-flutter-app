import 'package:calculator_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class DeleteAuthUsecaseInput extends Input {
  DeleteAuthUsecaseInput();
}

class DeleteAuthUsecaseOutput extends Output {
  DeleteAuthUsecaseOutput();
}

@lazySingleton
class DeleteAuthUsecase
    extends Usecase<DeleteAuthUsecaseInput, DeleteAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  DeleteAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<DeleteAuthUsecaseOutput> call(DeleteAuthUsecaseInput input) async {
    return await _authRepository.deleteAuth(input);
  }
}
