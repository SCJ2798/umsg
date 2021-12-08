import 'package:flutter/material.dart';
import 'package:umsg/Constants/Message.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/NewGroupDetails.dart';

class NewGroupPage extends StatefulWidget {
  @override
  _NewGroupPageState createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
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
          'New Group',
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(32.0)),
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
                      return Contact(contact: contacts[index]);
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
                    onPressed: () =>
                        navigatePage(context, NewGroupDetailPage()),
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

class Contact extends StatelessWidget {
  const Contact({
    Key key,
    @required this.contact,
  }) : super(key: key);

  final Map<String, dynamic> contact;

  @override
  Widget build(BuildContext context) {
    var checked = false;

    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () => setState(() {
          checked = !checked ? true : false;
        }),
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              "${contact["name"]}",
              style: TextStyle(fontSize: 24.0, color: kWhite),
            ),
            contentPadding: EdgeInsets.all(8.0),
            leading: CircleAvatar(
              maxRadius: 32.0,
              child: Image.asset(
                "${contact["img"]}",
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(right: 12.0),
              width: getDeviceWidth(context, 0.08),
              height: getDeviceWidth(context, 0.08),
              decoration: checked
                  ? BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/icons/tick.png')))
                  : null,
            ),
          ),
        ),
      );
    });
  }
}
