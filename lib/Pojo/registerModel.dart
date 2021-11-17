class registerModel {
  String lastName;
  String firstName;
  String address;
  String city;
  String email;
  String whatsapp;
  String telegram;
  String dOJ;
  String eOJ;
  String dT;
  String loginId;
  String password;

  registerModel(
      {this.lastName,
        this.firstName,
        this.address,
        this.city,
        this.email,
        this.whatsapp,
        this.telegram,
        this.dOJ,
        this.eOJ,
        this.dT,
        this.loginId,
        this.password});

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