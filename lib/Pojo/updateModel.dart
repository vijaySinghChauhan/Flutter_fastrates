class updateModel {
 late String id;
 late String dateTimeStamp;
 late String share;
 late String cMP;
 late String sL;
 late String target;
 late String description;
 late String forOld;

  updateModel(
      {required this.id,
        required this.dateTimeStamp,
        required this.share,
        required this.cMP,
        required this.sL,
        required this.target,
        required this.description,
        required this.forOld});

  updateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTimeStamp = json['dateTimeStamp'];
    share = json['share'];
    cMP = json['CMP'];
    sL = json['SL'];
    target = json['Target'];
    description = json['description'];
    forOld = json['forOld'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateTimeStamp'] = this.dateTimeStamp;
    data['share'] = this.share;
    data['CMP'] = this.cMP;
    data['SL'] = this.sL;
    data['Target'] = this.target;
    data['description'] = this.description;
    data['forOld'] = this.forOld;
    return data;
  }
}