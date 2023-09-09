import 'package:easycut/core/class/crud.dart';
import 'package:easycut/linkapi.dart';

class SalonDetailData {
  Crud crud;

  SalonDetailData(this.crud);

  getData(String id, String userid) async {
    var response = await crud.postData(AppLink.salonDetail, {
      "id": id,
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  postData(String salonId, String userId) async {
    var response = await crud.postData(AppLink.addFavorite, {
      "salonid": salonId,
      "userid": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String salonId, String userId) async {
    var response = await crud.postData(AppLink.deleteFavorite, {
      "salonid": salonId,
      "userid": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
