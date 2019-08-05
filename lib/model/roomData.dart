import 'package:flutterdemo1/model/roomItemData.dart';

/// 房间数据bean
class RoomData {
  final int totalCount;
  final int curPage;
  final int cateId;
  final List<RoomItemData> dataList;

  RoomData.fromJsonMap(Map<String, dynamic> map):
        totalCount = map["totalCount"],
        curPage = map["curPage"],
        cateId = map["cateId"],
        dataList = List<RoomItemData>.from(map["dataList"]
                      .map((it) => RoomItemData.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    Map<String,dynamic> map = new Map<String, dynamic>();
    map["totalCount"] = totalCount;
    map["curPage"] = curPage;
    map["cateId"] = cateId;
    map["dataList"] = dataList != null ?
      this.dataList.map((it) => it.toJson()) : null;
    return map;
  }
}