class FavoriteModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  FavoriteModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }
}
