import 'dart:convert';
import 'dart:io';

 import 'package:flutter_razorpay/Pojo/baseResponse.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/Pojo/responseListData.dart';
import 'package:flutter_razorpay/Pojo/updateResponse.dart';
import 'package:flutter_razorpay/network/basApiProvider.dart';
import 'package:flutter_razorpay/views/ListData.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registerRepository{
  baseApiProvider _apiProvider = baseApiProvider();

  Future<registerModel> postRegister (
      registerModel register) async{
  //  baseResponse respons = await _apiProvider.post1(register);
    String url="https://app.fastrates.in/apis/post/postRegister.php";
    baseResponse response = (await _apiProvider.registerHit(url,register)) as baseResponse;
    Fluttertoast.showToast(
        msg: ""+response.msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
    );
    return baseResponse(msg: '').fromJson(jsonDecode(response.toString()));

  }

  Future<responseListdata> getAll () async{
  var response = (await _apiProvider.getAll());
    return  response;
  }
  Future<updateResponse> getAllUpdates() async{
    var response = (await _apiProvider.getAllUpdates());
    return  response;
  }
}
