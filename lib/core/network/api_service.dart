import 'package:dio/dio.dart';
import 'package:docdoc_app/core/network/api_constance.dart';
import 'package:docdoc_app/features/signup/data/model/signup_request_body.dart';
import 'package:docdoc_app/features/signup/data/model/signup_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/model/login_request_body.dart';
import '../../features/login/data/model/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstance.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstance.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstance.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody loginRequestBody,
  );
}
