import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_razorpay/Pojo/baseResponse.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/network/basApiProvider.dart';

class registerRepository {
  baseApiProvider _apiProvider = baseApiProvider();

  Future<registerModel> postRegister (
      registerModel register) async{
    Response response = await _apiProvider.post(register);
    return baseResponse().fromJson(jsonDecode(response.data));
  }
}
