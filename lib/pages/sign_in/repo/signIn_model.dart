class LoggedInUserDetails {
  Data? data;

  LoggedInUserDetails({this.data});

  LoggedInUserDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    logIn = json['logIn'] != null ? LoggedInData.fromJson(json['logIn']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (logIn != null) {
      data['logIn'] = logIn!.toJson();
    }
    return data;
  }
}

class LoggedInData {
  String? uhid;
  String? fName;
  String? lName;
  String? email;
  int? number;
  String? houseNo;
  String? street;
  String? area;
  String? city;
  String? state;
  int? pincode;
  int? size;

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
        this.pincode,
        this.size});

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
    size = json['size'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uhid'] = uhid;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['email'] = email;
    data['number'] = number;
    data['house_no'] = houseNo;
    data['street'] = street;
    data['area'] = area;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['size'] = size;
    return data;
  }
}
