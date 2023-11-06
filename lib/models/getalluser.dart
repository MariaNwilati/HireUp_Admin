class UsersModel {
  String username;
  String email;
  String phone;
  String cv;
  int id;
  int active;
  

  UsersModel(this.id,this.active,this.username,this.cv,this.email,this.phone);

    UsersModel.fromJson(Map<String, dynamic> data){
      id=data["id"];
      email=data["email"];
      username=data["username"];
      phone=data["phone"];
      active=data["active"];
      cv=data["cv_link"];
     

    }
}
