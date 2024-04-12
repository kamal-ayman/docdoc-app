import 'package:docdoc_app/core/network/api_error_handler.dart';
import 'package:docdoc_app/core/network/api_result.dart';
import 'package:docdoc_app/core/network/api_service.dart';

import '../model/signup_request_body.dart';
import '../model/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}