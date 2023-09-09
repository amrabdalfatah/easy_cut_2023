import 'package:easycut/core/class/crud.dart';
import 'package:easycut/linkapi.dart';

class BookingData {
  Crud crud;

  BookingData(this.crud);

  getData(String userId, String salonId) async {
    var response = await crud.postData(AppLink.showBooking, {
      "userid": userId,
      "salonid": salonId,
    });
    return response.fold((l) => l, (r) => r);
  }

  postData(
    String salonId,
    String userId,
    String day,
    String startTime,
    String endTime,
    String chair,
    String total,
  ) async {
    var response = await crud.postData(AppLink.addBooking, {
      "salonid": salonId,
      "userid": userId,
      "day": day,
      "starttime": startTime,
      "endtime": endTime,
      "chair": chair,
      "total": total,
    });
    return response.fold((l) => l, (r) => r);
  }
}
