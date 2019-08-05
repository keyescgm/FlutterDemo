import 'package:dio/dio.dart';
import 'package:flutterdemo1/model/roomListData.dart';

/// 列表请求
class RoomListRepository {
  static getRoomList({String roomType, int page}) async {
    var reponse = await Dio().get('https://m.douyu.com/api/room/list',
        queryParameters: {'page': page, 'type': roomType});
    return RoomListData.fromJsonMap(reponse.data);
  }
}