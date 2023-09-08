class ServiceModel {
  String? id;
  String? salonid;
  String? name;
  String? price;
  String? time;
  String? image;

  ServiceModel({
    this.id,
    this.salonid,
    this.name,
    this.price,
    this.time,
    this.image,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salonid = json['salonid'];
    name = json['name'];
    price = json['price'];
    time = json['time'];
    image = json['image'];
  }
}
