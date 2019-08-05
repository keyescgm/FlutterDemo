import 'package:flutterdemo1/room_list_widget.dart';
import 'package:flutterdemo1/model/choiceData.dart';

/// 管理RoomListWidget
class RoomListWidgetManager {

  static Map<String,RoomListWidget> _roomListWidgetMap = new Map();

  static getRoomListWidget(ChoiceData choiceData) {
    if(!_roomListWidgetMap.containsKey(choiceData.type)) {
      var newWidget = RoomListWidget(choiceData : choiceData);
      _roomListWidgetMap[choiceData.type] = newWidget;
    }

    return _roomListWidgetMap[choiceData.type];
  }
}