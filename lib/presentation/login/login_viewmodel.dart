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
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var _loginObject = LoginObject("username", "password");

  late final LoginUseCase? _loginUseCase;

  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
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
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    // (await _loginUseCase.execute(
    //         LoginUseCaseInput(_loginObject.username, _loginObject.password)))
    //     .fold(
    //         (l) => {
    //               left is failure
                  // print(l.message)
                // },
            // (r) => {
            //       right is success
                  // print(r.customer?.name)
                // });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(
        password: password); // data class operation same as kotlin
    _validate();
  }

  @override
  setUserName(String username) {
    inputUsername.add(username);
    _loginObject = _loginObject.copyWith(
        username: username); // data class operation same as kotlin
    _validate();
  }

  // outputs

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  // private functions

  _validate() {
    inputAllInputsValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isUsernameValid(_loginObject.username) &&
        _isPasswordValid(_loginObject.password);
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

  Sink get inputAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
