import 'package:flutter_razorpay/Pojo/registerModel.dart';

class responseListdata {

 late List<registerModel> resArr;

 responseListdata(this.resArr);


 factory responseListdata.fromJson(List<dynamic> json) =>
     responseListdata(json.map((e) => registerModel.fromJson(e)).toList());

}
