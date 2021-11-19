
class registerModel {
 late String lastName="";
 late String firstName="";
 late String address="";
 late  String city="";
 late String email="";
 late  String whatsapp="";
 late String telegram="";
 late String dOJ="";
 late String eOJ="";
 late String dT="";
 late String loginId="";
 late String password="";


  registerModel(
      {required this.lastName,
        required this.firstName,
        required this.address,
        required this.city,
        required this.email,
        required this.whatsapp,
        required this.telegram,
        required this.dOJ,
        required this.eOJ,
        required this.dT,
        required this.loginId,
        required this.password});

  registerModel.fromJson(Map<String, dynamic> json) {
    lastName = json['LastName'];
    firstName = json['FirstName'];
    address = json['Address'];
    city = json['City'];
    email = json['Email'];
    whatsapp = json['Whatsapp'];
    telegram = json['telegram'];
    dOJ = json['DOJ'];
    eOJ = json['EOJ'];
    dT = json['DT'];
    loginId = json['loginId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastName'] = this.lastName;
    data['FirstName'] = this.firstName;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['Email'] = this.email;
    data['Whatsapp'] = this.whatsapp;
    data['telegram'] = this.telegram;
    data['DOJ'] = this.dOJ;
    data['EOJ'] = this.eOJ;
    data['DT'] = this.dT;
    data['loginId'] = this.loginId;
    data['password'] = this.password;
    return data;
  }
}