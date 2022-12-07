import 'package:dartz/dartz.dart';
import 'package:tut_app_flutter/data/data_source/remote_data_source.dart';
import 'package:tut_app_flutter/data/mapper/mapper.dart';
import 'package:tut_app_flutter/data/network/failure.dart';
import 'package:tut_app_flutter/data/network/network_info.dart';
import 'package:tut_app_flutter/data/request/request.dart';
import 'package:tut_app_flutter/domain/model.dart';
import 'package:tut_app_flutter/domain/repository.dart';

class RepositoryImpl extends Repository {
  late final RemoteDataSource _remoteDataSource;
  late final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo,this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0) {
        // success
        return Right(response.toDomain());
      } else {
        // failure
        return Left(Failure(409,response.message?? "we have biz error logic from API side"));
      }
    } else {
      // no connection
      return Left(Failure(501, "please check your internet connection"));
    }
  }

}