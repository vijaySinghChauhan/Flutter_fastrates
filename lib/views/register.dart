import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/repo/repoRegister.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class register extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<register> {

  TextEditingController textFirstName = new TextEditingController();
  TextEditingController textLastName = new TextEditingController();
  TextEditingController textAddress = new TextEditingController();
  TextEditingController textCity = new TextEditingController();
  TextEditingController textWhatsaap = new TextEditingController();
  TextEditingController texttelegram = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  TextEditingController textDOJ = new TextEditingController();
  TextEditingController textEOJ = new TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register yourself"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textFirstName,
              decoration: InputDecoration(
                  hintText: "First name"
              ),
            ),
            TextField(
              controller: textLastName,
              decoration: InputDecoration(
                  hintText: "Last name"
              ),
            ),
            TextField(
              controller: textAddress,
              decoration: InputDecoration(
                  hintText: "Address"
              ),
            ),
            TextField(
              controller: textCity,
              decoration: InputDecoration(
                  hintText: "City"
              ),
            ),
            TextField(
              controller: textEmail,
              decoration: InputDecoration(
                  hintText: "Email"
              ),
            ),
            TextField(
              controller: textWhatsaap,
              decoration: InputDecoration(
                  hintText: "Whatsapp"
              ),
            ),
            TextField(
              controller: texttelegram,
              decoration: InputDecoration(
                  hintText: "Telegram"
              ),
            ),
            TextField(
              controller: textDOJ,
              decoration: InputDecoration(
                  hintText: "date of joining"
              ),
            ),

            TextField(
              controller: textEOJ,
              decoration: InputDecoration(
                  hintText: "End of joining"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Subscribe Now", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                getAllListCall();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> getAllListCall() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-mm-yyyy kk:mm:ss').format(now);
    registerRepository repo= new registerRepository();
    registerModel reg = new registerModel(email: '', address: '', firstName: '', whatsapp: '', password: '', city: '', dOJ: '', dT: '', telegram: '', eOJ: '', lastName: '', loginId: '');
    reg.firstName = textFirstName.text;
    reg.lastName = textLastName.text;
    reg.address = textAddress.text;
    reg.city = textCity.text;
    reg.email = textEmail.text;
    reg.whatsapp = textWhatsaap.text;
    reg.telegram = texttelegram.text;
    reg.eOJ = textEOJ.text;
    reg.dOJ = textDOJ.text;
    reg.dT= formattedDate.toString();
    return repo.postRegister(reg);
  }



}
