import 'package:flutter/material.dart';
import 'package:umsg/Constants/Message.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/group_chat.dart';
import 'package:umsg/private_chat.dart';
import 'package:umsg/profile.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Swipe Main Menu page to Navigate profile page
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == 0)
          return; // user have just tapped on screen (no dragging)

        if (details.primaryVelocity.compareTo(0) == -1)
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ));
        else
          return;
      },
      child: Scaffold(
        backgroundColor: kColorA,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: kColorA,
          title: Container(
            /// Search Text Field
            child: TextFormField(
              style: TextStyle(fontSize: 24.0, color: kWhite),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  focusColor: Colors.black12,
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 20, color: kWhite.withOpacity(0.5)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  border: InputBorder.none),
            ),
          ),
          actions: [
            /// Profile Button
            Container(
              padding: EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              /// All Contents
              Expanded(
                child: ListView.builder(
                  itemCount: receivedMessages.length,
                  itemBuilder: (context, index) {
                    var msg = receivedMessages[index];
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          /// Navigate to Group or Private Chat
                          if (msg["type"] == 1)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroupChatPage(
                                    name: msg["name"], img: msg['img']),
                              ),
                            );
                          else
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrivateChatPage(
                                          name: msg["name"],
                                          img: msg['img'],
                                        )));
                        },
                        leading: CircleAvatar(
                          maxRadius: 32,
                          child: msg['img'] == null
                              ? Image.asset('assets/icons/group.png')
                              : Image.asset(msg['img']),
                        ),
                        title: Text(
                          '${msg["name"]}',
                          style: TextStyle(
                              fontFamily: 'Comic',
                              color: kWhite,
                              fontSize: 24.0),
                        ),
                        subtitle: Text(
                          msg["type"] == 1
                              ? '${msg["msgs"][0].owner} : ${msg["msgs"][0].msgs}'
                              : '${msg["msgs"][0].msgs}',
                          style: TextStyle(color: kWhite.withOpacity(0.6)),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
