import 'package:flutter/material.dart';
import 'package:flutterdemo1/model/choiceData.dart';
import 'package:flutterdemo1/model/roomItemData.dart';
import 'package:flutterdemo1/model/roomListData.dart';
import 'package:flutterdemo1/room_list_repository.dart';
import 'dart:async';

/// 列表部件
class RoomListWidget extends StatefulWidget {

  final ChoiceData choiceData;

  const RoomListWidget({Key key, @required this.choiceData});

  @override
  RoomListState createState() {
    return RoomListState(choiceData: this.choiceData);
  }

}

class RoomListState extends State<RoomListWidget> with
    AutomaticKeepAliveClientMixin, WidgetsBindingObserver{

  final ChoiceData choiceData;
  List<RoomItemData> _roomList;
  int _curPage = 1;
  ScrollController scrollController;

  RoomListState({@required this.choiceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: RefreshIndicator(
          child: CustomScrollView(
            controller: scrollController,
          ),
          onRefresh: _handleRefresh
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadRoomList((){
      _curPage ++;
      loadRoomList();
    });
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _scrollListener() {
    if(scrollController.position.pixels > scrollController.position.maxScrollExtent / 2) {
      ++ _curPage;
      loadRoomList();
    }
  }

  loadRoomList([fn]) async {
    RoomListData listData = await RoomListRepository.getRoomList(roomType: choiceData.type, page: _curPage);
    listData.data.dataList.forEach((roomItem) {
      precacheImage(NetworkImage(roomItem.roomSrc), context);
    });

    if(this.mounted) {
      if(_curPage == 1) {
        setState(() {
          _roomList = listData.data.dataList;
          if(fn != null) fn();
        });
      }
    } else {
      setState(() {
        if(_roomList != null) {
          _roomList = listData.data.dataList;
        } else {
          _roomList.addAll(listData.data.dataList);
        }
        if(fn != null) fn();
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  /// 刷新列表
  Future<void> _handleRefresh() {
    final Completer<void> comleter = Completer<void>();

    loadRoomList((){
      _curPage++;
      loadRoomList(() {
        comleter.complete();
      });
    });
  }

}