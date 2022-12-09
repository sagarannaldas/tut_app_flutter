import 'dart:async';

import 'package:tut_app_flutter/domain/usecase/login_usecase.dart';
import 'package:tut_app_flutter/presentation/base/baseviewmodel.dart';
import 'package:tut_app_flutter/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("username", "password");

  late final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold(
            (l) => {
                  // left is failure
                  print(l.message)
                },
            (r) => {
                  // right is success
                  print(r.customer?.name)
                });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class operation same as kotlin
  }

  @override
  setUserName(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(
        username: username); // data class operation same as kotlin
  }

  // outputs

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username));

  // private functions

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
  // three functions for actions
  setUserName(String username);

  setPassword(String password);

  login();

  // two sinks for streams
  Sink get inputUsername;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;
}
