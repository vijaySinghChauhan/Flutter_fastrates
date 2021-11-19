import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/Pojo/responseListData.dart';
import 'package:flutter_razorpay/repo/repoRegister.dart';
import 'package:fluttertoast/fluttertoast.dart';
// void main() => runApp(ListData());

class ListData extends StatefulWidget {
  ListData() : super();

  @override
  ListAll createState() => ListAll();
}

class ListAll extends State<ListData> {
  late Future<responseListdata> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getAllListCall() ;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Prime Members'),
        ),
        body: Center(
          child: FutureBuilder <responseListdata>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                responseListdata? data = snapshot.data;
                return
                  ListView.builder(
                      itemCount: data!.resArr.length,
                      itemBuilder: (BuildContext context, int index) {

                        return new GestureDetector( //You need to make my child interactive
                        onTap: () => print(data.resArr[index].email),
                        child: new Container(
                        width: size.width - 150,
                        child: Card(
                        child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text(
                        '${data.resArr[index].firstName +" "+data.resArr[index].lastName}',
                        style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        ),
                        ),
                        SizedBox(
                        height: size.height - (size.height * 0.99),
                        ),
                        Text(
                        '${data.resArr[index].city}',
                        style: TextStyle(
                        fontSize: 20,
                        ),
                        ),
                        SizedBox(
                        height: size.height - (size.height * 0.99),
                        ),
                        Text(
                        '${data.resArr[index].email}',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        ),
                        ),
                        ],
                        ),
                        ),
                        ),
                        ));
                      }
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }


  Future<responseListdata> getAllListCall() {
    registerRepository repo= new registerRepository();
    registerModel reg = new registerModel(email: '', address: '', firstName: '', whatsapp: '', password: '', city: '', dOJ: '', dT: '', telegram: '', eOJ: '', lastName: '', loginId: '');
    reg.firstName = "vijay";
    return repo.getAll();
  }




}

