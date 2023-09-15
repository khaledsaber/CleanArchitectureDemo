import 'package:clean_architecture_demo/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_demo/data/mapper/mapper.dart';
import 'package:clean_architecture_demo/data/network/failure.dart';
import 'package:clean_architecture_demo/data/network/network_info.dart';
import 'package:clean_architecture_demo/data/network/requests.dart';
import 'package:clean_architecture_demo/domain/model/models.dart';
import 'package:clean_architecture_demo/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthenticationModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        //success

        return Right(response.toDomain());
      } else {
        //  failure (business error)

        return Left(Failure(409, response.message??"business error"));
      }
    } else {

      return Left(Failure(501,"please check internet connection"));

    }
  }
}
