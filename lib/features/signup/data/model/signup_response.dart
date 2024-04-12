import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool status;
  int code;

  SignupResponse({required this.message, this.userData, required this.status, required this.code});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String token;
  @JsonKey(name: 'username')
  String userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}