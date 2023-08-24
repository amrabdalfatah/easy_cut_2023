class SalonModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? rate;
  String? description;
  String? chairs;
  String? categoryId;
  String? image;
  String? verifycode;
  String? approve;
  String? country;
  String? city;
  String? address;
  String? createdAt;
  String? updatedAt;

  SalonModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.rate,
      this.description,
      this.chairs,
      this.categoryId,
      this.image,
      this.verifycode,
      this.approve,
      this.country,
      this.city,
      this.address,
      this.createdAt,
      this.updatedAt});

  SalonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    rate = json['rate'];
    description = json['description'];
    chairs = json['chairs'];
    categoryId = json['category_id'];
    image = json['image'];
    verifycode = json['verifycode'];
    approve = json['approve'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['chairs'] = this.chairs;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['verifycode'] = this.verifycode;
    data['approve'] = this.approve;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
