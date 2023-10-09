import 'package:clean_architecture_demo/data/network/requests.dart';
import 'package:clean_architecture_demo/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>>  login(LoginRequest loginRequest);
}

