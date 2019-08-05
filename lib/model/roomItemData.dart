class RoomItemData {
  final int rid;
  final int vipId;
  final String roomName;
  final int cate1Id;
  final int cate2Id;
  final String roomSrc;
  final String verticalSrc;
  final String avatar;
  final String nickname;
  final int isVertical;
  final String liveCity;
  final int isLive;
  final String hn;

  RoomItemData.fromJsonMap(Map<String, dynamic> map):
    rid = map["rid"],
    vipId = map["vipId"],
    roomName = map["roomName"],
    cate1Id = map["cate1Id"],
    cate2Id = map["cate2Id"],
    roomSrc = map["roomSrc"],
    verticalSrc = map["verticalSrc"],
    avatar = map["avatar"],
    nickname = map["nickname"],
    isVertical = map["isVertical"],
    liveCity = map["liveCity"],
    isLive = map["isLive"],
    hn = map["hn"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map["rid"] = rid;
    map["vipId"] = vipId;
    map["roomName"] = roomName;
    map["cate1Id"] = cate1Id;
    map["cate2Id"] = cate2Id;
    map["roomSrc"] = roomSrc;
    map["verticalSrc"] = verticalSrc;
    map["avatar"] = avatar;
    map["nickname"] = nickname;
    map["isVertical"] = isVertical;
    map["liveCity"] = liveCity;
    map["isLive"] = isLive;
    map["hn"] = hn;
    return map;
  }
}