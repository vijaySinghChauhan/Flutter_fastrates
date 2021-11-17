
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
var params =  {"LastName":"sharma","FirstName":"Dhananjay","Address":"Delhi","City":"new delhi","Email":"vijaychauhan0056@gmail.com","Whatsapp":"2147483647","telegram":"2147483647","DOJ":"23-11-2021","EOJ":"22-12-2021","DT":"22-10-2021","loginId":"vijay","password":"chauhan"};

class baseApiProvider {
  Dio _dio;
  Future post(registerModel register) async {
    Response response = await _dio.post("https://app.fastrates.in/apis/post/postRegister.php",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(register),
    );

  }
}
