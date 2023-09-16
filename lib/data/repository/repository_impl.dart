import 'package:clean_architecture_demo/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_demo/data/mapper/mapper.dart';
import 'package:clean_architecture_demo/data/network/error_handler.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          // return business error

          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
