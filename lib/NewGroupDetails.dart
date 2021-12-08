import 'package:flutter/material.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/group_chat.dart';

class NewGroupDetailPage extends StatefulWidget {
  @override
  _NewGroupDetailPage createState() => _NewGroupDetailPage();
}

class _NewGroupDetailPage extends State<NewGroupDetailPage> {
  List<Map<String, dynamic>> contacts = [
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorA,
      appBar: AppBar(
        backgroundColor: kColorA,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => gotoBack(context),
        ),
        centerTitle: false,
        title: Text(
          'New Group',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getDeviceHeight(context, 0.04)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: getDeviceWidth(context, 0.2),
                  height: getDeviceWidth(context, 0.2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/group.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: getDeviceWidth(context, 0.6),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter group Name",
                        hintStyle: TextStyle(color: kWhite),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: kWhite.withOpacity(0.5)))),
                    style: TextStyle(fontSize: 14, color: kWhite),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: kColorB.withOpacity(0.8),
              ),
              height: getDeviceHeight(context, 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "3 Members",
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            "${contacts[index]["name"]}",
                            style: TextStyle(fontSize: 24.0, color: kWhite),
                          ),
                          contentPadding: EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            maxRadius: 32.0,
                            child: Image.asset(
                              "${contacts[index]["img"]}",
                            ),
                          ),
                        ),
                      );
                    })),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            kColorD.withOpacity(0.6))),
                    onPressed: () {
                      navigatePage(
                        context,
                        GroupChatPage(
                            name: "Group 01", img: 'assets/icons/group.png'),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
