import 'package:flutter/material.dart';
import 'package:umsg/Constants/constant.dart';
import 'package:umsg/private_chat.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final nameTxtController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameTxtController.dispose();
    super.dispose();
  }

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
          'Add Contact',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              padding: EdgeInsets.all(16.0),
              width: getDeviceWidth(context, 1),
              height: getDeviceHeight(context, 0.15),
              child: Image.asset(
                'assets/icons/add_contact.png',
                width: getDeviceWidth(context, 0.2),
                height: getDeviceWidth(context, 0.2),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      style: TextStyle(color: kWhite),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: kWhite),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kWhite.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      style: TextStyle(color: kWhite),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: kWhite),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kWhite.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(kColorD.withOpacity(0.6))),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    navigatePage(
                        context,
                        PrivateChatPage(
                            name: "Anna", img: "assets/imgs/p3.png"));
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
