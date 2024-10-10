import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//http://106.38.204.149:9002/home_api/api/login/signUp?account=18939877709&passWord=11111&code=1234&type=0
@immutable
class Constants {
  static const String rootUrl = 'http://localhost:8888';
  static const String endpoint = '$rootUrl/';
  // static const String endpoint = rootUrl;
  static const String newsUrl = '${endpoint}homepage/newsShow&id=';

  static const String dummyProfilePic =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';

  static int loginType = 0;
  static const int startPage = 1;
  static const int rowsPerPage = 10;
  static const double searchContentWidth = 150;
  static const String localChange = 'localChange';
  static const String appTheme = 'appTheme';
  static const String token = 'token';
  static const String useId = 'useId';

  static const String webUrl4 =
      'http://xjp-user-api.t.phcer.com/hk_api/api/comm/findServiceNotice?language=en&id=1';
}
