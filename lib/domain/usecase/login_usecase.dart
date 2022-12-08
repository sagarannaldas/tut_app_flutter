import 'package:dartz/dartz.dart';
import 'package:tut_app_flutter/app/functions.dart';
import 'package:tut_app_flutter/data/network/failure.dart';
import 'package:tut_app_flutter/data/request/request.dart';
import 'package:tut_app_flutter/domain/model/model.dart';
import 'package:tut_app_flutter/domain/repository/repository.dart';
import 'package:tut_app_flutter/domain/usecase/base_usacase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  late final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  late String email;
  late String password;

  LoginUseCaseInput(this.email, this.password);
}
