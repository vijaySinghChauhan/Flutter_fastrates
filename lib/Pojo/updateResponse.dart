import 'package:flutter_razorpay/Pojo/updateModel.dart';

class updateResponse {

  late List<updateModel> resArr;

  updateResponse(this.resArr);


  factory updateResponse.fromJson(List<dynamic> json) =>
      updateResponse(json.map((e) => updateModel.fromJson(e)).toList());

}
