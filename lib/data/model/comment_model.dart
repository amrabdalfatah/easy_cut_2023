class CommentModel {
  String? id;
  String? salonid;
  String? userid;
  String? body;

  CommentModel({
    this.id,
    this.salonid,
    this.userid,
    this.body,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salonid = json['salonid'];
    userid = json['userid'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['salonid'] = this.salonid;
    data['userid'] = this.userid;
    data['body'] = this.body;
    return data;
  }
}
