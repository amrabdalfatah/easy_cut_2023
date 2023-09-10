class BookingModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? approve;
  String? day;
  String? time;
  String? chair;
  String? total;

  BookingModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.approve,
    this.day,
    this.time,
    this.chair,
    this.total,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    approve = json['approve'];
    day = json['day'];
    time = json['start_time'];
    chair = json['chair'];
    total = json['total'];
  }
}
