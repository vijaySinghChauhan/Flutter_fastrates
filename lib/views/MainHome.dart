import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/Pojo/responseListData.dart';
import 'package:flutter_razorpay/Pojo/updateResponse.dart';
import 'package:flutter_razorpay/repo/repoRegister.dart';
import 'package:flutter_razorpay/views/ListData.dart';
import 'package:flutter_razorpay/views/register.dart';

 void main() => runApp( MainHome());

class MainHome extends StatefulWidget {
  MainHome() : super();

  @override
  MyHomePage createState(){
    return MyHomePage();
  }


}

class MyHomePage extends State<MainHome> {
late Future<updateResponse> futureData;

    @override
      void initState() {
      super.initState();
      futureData = getAllListCall() ;
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Fast Rates Updates")),

      body: Scaffold(

        body: Center(
          child: FutureBuilder <updateResponse>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                updateResponse? data = snapshot.data;
                return
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data!.resArr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new GestureDetector( //You need to make my child interactive
                            onTap: () => print(data.resArr[index].sL),
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
                                    '${data.resArr[index].share +" /  CMP "+data.resArr[index].cMP}',
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
                                    '${"Target :"+data.resArr[index].target+ " SL: "+data.resArr[index].sL}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height - (size.height * 0.99),
                                  ),
                                  Text(
                                    '${data.resArr[index].description +" \n"+ data.resArr[index].dateTimeStamp}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Profile'),
            ),
            ListTile(
              title: const Text('Register Now'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
              },
            ),
            ListTile(
              title: const Text('All Clients'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListData()));


              },
            ),
            ListTile(
              title: const Text('Search clients'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<updateResponse> getAllListCall() {
    registerRepository repo= new registerRepository();
    registerModel reg = new registerModel(email: '', address: '', firstName: '', whatsapp: '', password: '', city: '', dOJ: '', dT: '', telegram: '', eOJ: '', lastName: '', loginId: '');
    reg.firstName = "vijay";
    return repo.getAllUpdates();
  }

}