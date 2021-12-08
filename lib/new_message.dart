import 'package:flutter/material.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/private_chat.dart';

class NewMessagePage extends StatefulWidget {
  @override
  _NewMessagePageState createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage> {
  List<Map<String, dynamic>> contacts = [
    {"name": "Liam", "img": "assets/imgs/p2.png"},
    {"name": "Olivia", "img": "assets/imgs/p3.png"},
    {"name": "Ava", "img": "assets/imgs/p6.png"},
    {"name": "Oscar", "img": "assets/imgs/p4.png"},
    {"name": "Ivy", "img": "assets/imgs/p1.png"},
    {"name": "Jack", "img": "assets/imgs/p5.png"}
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
          'New Message',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: TextFormField(
                style: TextStyle(fontSize: 20.0, color: kWhite),
                decoration: InputDecoration(
                  fillColor: kWhite.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(32.0)),
                  focusColor: kWhite,
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: kWhite.withOpacity(0.6),
                  ),
                  hintStyle:
                      TextStyle(fontSize: 20.0, color: kWhite.withOpacity(0.5)),
                  hintText: "Search",
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () => navigatePage(
                            context,
                            PrivateChatPage(
                                name: contacts[index]["name"],
                                img: contacts[index]["img"]),
                          ),
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
          ],
        ),
      ),
    );
  }
}
