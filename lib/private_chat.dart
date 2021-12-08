import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:umsg/Constants/Message.dart';
import 'package:umsg/Constants/constant.dart';

class PrivateChatPage extends StatefulWidget {
  String name;
  String img;

  PrivateChatPage({this.name, this.img});

  @override
  _PrivateChatPageState createState() =>
      _PrivateChatPageState(name: name, img: img);
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  String name;
  String img;

  final _msgTxtController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  OverlayEntry _overlayEntry;
  List<Message> received_msg;

  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    Offset offset = Offset.zero;
    final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
            bar.size.bottomRight(offset), bar.size.bottomRight(offset)),
        Rect.zero);
    return position;
  }

  _PrivateChatPageState({this.name, this.img}) {
    this.received_msg = receivedMessages[8]['msgs'];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _msgTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var msgs = receivedMessages[8];

    return Scaffold(
      backgroundColor: kColorA,
      appBar: AppBar(
          backgroundColor: kColorA,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                color: kColorA,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: kWhite,
                        ),
                        title: Text(
                          "Search",
                          style: TextStyle(color: kWhite),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        leading: Icon(
                          Icons.volume_off,
                          color: kWhite,
                        ),
                        title: Text(
                          "Mute",
                          style: TextStyle(color: kWhite),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: ListTile(
                        leading: Icon(
                          Icons.delete,
                          color: kWhite,
                        ),
                        title: Text(
                          "Delete Chat",
                          style: TextStyle(color: kWhite),
                        ),
                      ),
                    )
                  ];
                })
          ],
          title: Row(
            children: [
              CircleAvatar(
                child: Image.asset(img),
              ),
              SizedBox(width: getDeviceWidth(context, 0.02)),
              Text(
                "$name",
                style: TextStyle(
                  fontSize: 24,
                  color: kWhite,
                ),
              )
            ],
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: received_msg.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: received_msg[index].type == 0
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              received_msg[index].type == 0 ? kColorB : kColorD,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        margin: EdgeInsets.all(12.0),
                        padding: EdgeInsets.all(12.0),
                        width: getDeviceWidth(context, 0.6),
                        child: Text(
                          '${received_msg[index].msgs}',
                          textAlign: received_msg[index].type == 0
                              ? TextAlign.start
                              : TextAlign.end,
                          style: TextStyle(fontSize: 16.0, color: kWhite),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(32.0),
              ),
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return "Message empty";
                    else
                      return null;
                  },
                  controller: _msgTxtController,
                  style: TextStyle(color: kWhite),
                  scrollPadding: EdgeInsets.all(8.0),
                  decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: kWhite.withOpacity(0.5)),
                      contentPadding: EdgeInsets.all(12.0),
                      border: InputBorder.none,
                      fillColor: Colors.black,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              received_msg.add(Message(
                                  type: 1, msgs: _msgTxtController.text));
                            });
                          }
                        },
                        onLongPress: () {
                          final RelativeRect position =
                              buttonMenuPosition(context);
                          showMenu(
                            context: context,
                            color: kColorD,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                            ),
                            position: position,
                            items: [
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: getDeviceWidth(context, 0.1),
                                      height: getDeviceWidth(context, 0.1),
                                      child:
                                          Image.asset('assets/icons/image.png'),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: getDeviceWidth(context, 0.1),
                                      height: getDeviceWidth(context, 0.1),
                                      child:
                                          Image.asset('assets/icons/smile.png'),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: getDeviceWidth(context, 0.1),
                                      height: getDeviceWidth(context, 0.1),
                                      child:
                                          Image.asset('assets/icons/gif.png'),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: getDeviceWidth(context, 0.1),
                                      height: getDeviceWidth(context, 0.1),
                                      child: Image.asset(
                                          'assets/icons/sticker.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: kColorD,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
