import 'package:clean_architecture_demo/data/network/failure.dart';
import 'package:clean_architecture_demo/data/network/requests.dart';
import 'package:clean_architecture_demo/domain/model/models.dart';
import 'package:clean_architecture_demo/domain/repository/repository.dart';
import 'package:clean_architecture_demo/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase
    implements BaseUseCase<LoginUseCaseInput, AuthenticationModel> {
  final Repository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      LoginUseCaseInput input) async {
    return await repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
