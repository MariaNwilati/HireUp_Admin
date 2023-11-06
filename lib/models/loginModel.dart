class LoginModel {
  int id;
  String email;
  String password;
  String username;
  String phone;
  LoginModel(this.id, this.email, this.password, this.phone, this.username);

  LoginModel.fromJson(Map<String, dynamic> data) {
    id=data["id"];
    username=data["username"];
    email=data["email"];
    phone=data["phone"];
  }
}
