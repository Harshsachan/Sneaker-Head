class LoggedInUserDetails {
  Data? data;

  LoggedInUserDetails({this.data});

  LoggedInUserDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LoggedInData? logIn;

  Data({this.logIn});

  Data.fromJson(Map<String, dynamic> json) {
    logIn = json['logIn'] != null ? new LoggedInData.fromJson(json['logIn']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logIn != null) {
      data['logIn'] = this.logIn!.toJson();
    }
    return data;
  }
}

class LoggedInData {
  String? uhid;
  String? fName;
  String? lName;
  String? email;
  String? number;
  String? houseNo;
  String? street;
  String? area;
  String? city;
  String? state;
  int? pincode;

  LoggedInData(
      {this.uhid,
        this.fName,
        this.lName,
        this.email,
        this.number,
        this.houseNo,
        this.street,
        this.area,
        this.city,
        this.state,
        this.pincode});

  LoggedInData.fromJson(Map<String, dynamic> json) {
    uhid = json['uhid'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    number = json['number'];
    houseNo = json['house_no'];
    street = json['street'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uhid'] = this.uhid;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['number'] = this.number;
    data['house_no'] = this.houseNo;
    data['street'] = this.street;
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}
