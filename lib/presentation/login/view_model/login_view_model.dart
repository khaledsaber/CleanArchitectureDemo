import 'dart:async';

import 'package:clean_architecture_demo/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_demo/presentation/base/base_view_model.dart';
import 'package:clean_architecture_demo/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController = StreamController<
      String>.broadcast(); // broadcast makes the stream controller has many listeners

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject('', '');

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase); //inputs

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
  }

  @override
  void start() {}

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(username: userName);
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold(
      (failure) => print(failure.message),
      (data) => print(data.customer?.name),
    );
  }

  // outputs

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String username) {
    return username.isNotEmpty;
  }
}

mixin LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  login();

  // getters
  Sink get inputUserName;

  Sink get inputPassword;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;
}
