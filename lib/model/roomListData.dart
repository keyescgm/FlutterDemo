import 'package:flutterdemo1/model/roomData.dart';

/// 网络请求返回的列表数据，这里与M页接口返回参数保持一致 如api.md
class RoomListData {

  final int code;
  /// 这里与M页接口返回参数保持一致 如api.md
  final RoomData data;

  RoomListData.fromJsonMap(Map<String, dynamic> map):
      code = map['code'],
      data = RoomData.fromJsonMap(map['data']);

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data["code"] = code;
    data["data"] = data != null ? data["data"].toJson() : null;
    return data;
  }
}