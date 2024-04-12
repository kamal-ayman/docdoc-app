import 'package:docdoc_app/core/network/api_result.dart';
import 'package:docdoc_app/features/login/data/model/login_request_body.dart';
import 'package:docdoc_app/features/login/data/model/login_response.dart';
import 'package:docdoc_app/features/login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> emitLoginStates(LoginRequestBody loginRequestBody) async {
    isLoading = true;
    emit(const LoginState.loading());
    final ApiResult<LoginResponse> response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse) {
      isLoading = false;
      emit(LoginState.success(loginResponse));
    }, failure: (errorHandler) {
      isLoading = false;
      emit(LoginState.error(error: errorHandler.apiErrorModel.message ?? ''));
    },);
  }
}
