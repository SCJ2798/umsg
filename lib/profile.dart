import 'package:flutter/material.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/add_contact.dart';
import 'package:umsg/contact.dart';
import 'package:umsg/invite_friends.dart';
import 'package:umsg/new_group.dart';
import 'package:umsg/new_message.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: getDeviceHeight(context, 0.05)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  width: getDeviceWidth(context, 0.25),
                  height: getDeviceWidth(context, 0.25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/imgs/p3.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Mia",
                        style: TextStyle(fontSize: 28, color: kWhite),
                      ),
                    ),
                    SizedBox(
                      height: getDeviceHeight(context, 0.005),
                    ),
                    Text(
                      "mm_123@gmail.com",
                      style: TextStyle(color: kWhite),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: getDeviceHeight(context, 0.02)),

            /// New Message
            ListTile(
              onTap: () => navigatePage(context, NewMessagePage()),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: CircleAvatar(
                child: Image.asset('assets/icons/email.png'),
                backgroundColor: kColorA,
              ),
              title: Text(
                "New Message",
                style: TextStyle(fontSize: 20, color: kWhite),
              ),
            ),
            ListTile(
              onTap: () => navigatePage(context, NewGroupPage()),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: CircleAvatar(
                child: Image.asset('assets/icons/add-group.png'),
                backgroundColor: kColorA,
              ),
              title: Text(
                "New Group",
                style: TextStyle(fontSize: 20, color: kWhite),
              ),
            ),
            ListTile(
              onTap: () => navigatePage(context, AddContactPage()),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: CircleAvatar(
                child: Image.asset('assets/icons/add-user.png'),
                backgroundColor: kColorA,
              ),
              title: Text(
                "New contact",
                style: TextStyle(fontSize: 20, color: kWhite),
              ),
            ),
            SizedBox(height: getDeviceHeight(context, 0.02)),
            ListTile(
              onTap: () => navigatePage(context, ContactsPage()),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: CircleAvatar(
                child: Image.asset('assets/icons/phone-book.png'),
                backgroundColor: kColorA,
              ),
              title: Text(
                "Contacts",
                style: TextStyle(fontSize: 20, color: kWhite),
              ),
            ),
            ListTile(
              onTap: () => navigatePage(context, InviteFriendPage()),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: CircleAvatar(
                child: Image.asset('assets/icons/invite.png'),
                backgroundColor: kColorA,
              ),
              title: Text(
                "Invite Friends",
                style: TextStyle(fontSize: 20, color: kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
