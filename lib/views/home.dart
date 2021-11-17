import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/repo/repoRegister.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    registerRepository repo= new registerRepository();

    registerModel reg = new registerModel();
    reg.firstName = "vj";
    reg.lastName = "vj";
    reg.address = "vj";
    reg.city = "vj";
    reg.email = "vj";
    reg.whatsapp = "vj";
    reg.telegram = "vj";
    reg.dOJ = "vj";
    reg.eOJ = "vj";
    reg.loginId = "vj";
    reg.password = "vj";
    reg.dT = "vj";


    repo.postRegister(reg);

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_izCuCNkNGnFzY6",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Sample App",
      "description" : "Fast Rates subscription",
      "prefill" : {
        "contact" : "9891234473",
        "email" : "vijaychauhan0056@gmail.com"
      },
      "external" : {
        "wallets" : ["paytm","phonepe","amazonpay","freecharge","payzapp","airtelmoney","mobikwik","jiomoney","phonepeswitch","paypal","olamoney"],

      },
      // "options": {
      //   "checkout": {
      //     "method": {
      //       "netbanking": "1",
      //       "card": "1",
      //       "upi": "1",
      //       "wallet": ["paytm","phonepe","amazonpay","freecharge","payzapp","airtelmoney","mobikwik","jiomoney","phonepeswitch","paypal","olamoney"]
      //     }
      //   }
      // }



    };

    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess(){
    print("Payment success");
    //Toast.show("Pament success", context);
  }

  void handlerErrorFailure(){
    print("Payment error");
  //  Toast.show("Payment error", context);
  }

  void handlerExternalWallet(){
    print("External Wallet");
  //  Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay Tutorial"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "amount to pay"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Subscribe Now", style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
