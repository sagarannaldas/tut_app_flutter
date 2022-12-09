import 'package:flutter/material.dart';
import 'package:tut_app_flutter/presentation/login/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel(null); // todo pass here login use case

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _bindViewModel() {
    _viewModel.start();
    _usernameController.addListener(() => _viewModel.setUserName(_usernameController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bindViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
