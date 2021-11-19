


import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_razorpay/Pojo/baseResponse.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/Pojo/responseListData.dart';
import 'package:flutter_razorpay/Pojo/updateResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
var params =  {"LastName":"sharma","FirstName":"Dhananjay","Address":"Delhi","City":"new delhi","Email":"vijaychauhan0056@gmail.com","Whatsapp":"2147483647","telegram":"2147483647","DOJ":"23-11-2021","EOJ":"22-12-2021","DT":"22-10-2021","loginId":"vijay","password":"chauhan"};

class baseApiProvider {



  Future<void> registerHit(String url,registerModel register) async
  {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };


    FormData formData = new FormData.fromMap(register.toJson());
   Response response = await dio.post(url, data: formData);
   Fluttertoast.showToast(msg: response.data,toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM);
   return response.data;
  }





  Future<responseListdata> getAll()  async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
   Response response = await dio.get("https://app.fastrates.in/apis/get/getAllData.php");

    return responseListdata.fromJson(jsonDecode(response.data));
  }

  Future<updateResponse> getAllUpdates()  async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    Response response = await dio.get("https://app.fastrates.in/apis/get/getUpdates.php");

    return updateResponse.fromJson(jsonDecode(response.data));
  }

}
