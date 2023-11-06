

class CompaniesModel {
  int id;
  int phone;
  int active;
  int easyapply;
  String email;
  String name;
  String location;
  String logo;
  String specialization;
  String document;

  CompaniesModel(this.id, this.phone, this.active, this.easyapply, this.email,
      this.name, this.location, this.logo, this.specialization, this.document);

  CompaniesModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    email = data["email"];
    name = data["name"];
    location = data["location"];
    phone = data["phone"];
    logo = data["logo"];
    specialization = data["specialaization"];
    active = data["active"];
    easyapply = data["easy_applay"];
    document = data["document"];
  }
}