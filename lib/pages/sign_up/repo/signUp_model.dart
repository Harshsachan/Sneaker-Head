// class SignUp {
//   Data? data;
//
//   SignUp({this.data});
//
//   SignUp.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   SignUp? signUp;
//
//   Data({this.signUp});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     signUp =
//     json['signUp'] != null ? new SignUp.fromJson(json['signUp']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.signUp != null) {
//       data['signUp'] = this.signUp!.toJson();
//     }
//     return data;
//   }
// }

class SignUp {
  String? email;
  String? password;

  SignUp({this.email, this.password});

  SignUp.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
