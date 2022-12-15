import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_delivery_trial1/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_delivery_trial1/providers/userProvider.dart';
import 'package:flutter_delivery_trial1/screens/login/preLoginVerification.dart';
import 'package:flutter_delivery_trial1/screens/pickupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_properties.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    userProvider.getUser();
    User user = userProvider.user;
    print(user.firstName);
    //User user = await UserPreferences().getUser();
    /* UserPreferences().getUser().then((result) {
      user = result;
      print(user);
    });*/

    //print(user.firstName);
    showLogOutAlertDialog() {
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget confirmLogout = RaisedButton(
        color: red,
        child: Text("Logout"),
        onPressed: () async {
          await Provider.of<UserProvider>(context, listen: false).logOutUser();
          changeScreenPushReplacement(context, PreLoginVerification());
        },
      );

      AlertDialog alertDialog = AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout."),
        actions: [
          cancelButton,
          confirmLogout,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alertDialog;
          });
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('assets/images/freshlii_logo.png'),
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${user.firstName} ${user.lastName}'),
                            Text('${user.email}'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          /*UserAccountsDrawerHeader(
            accountName: Text('${user.firstName} ${user.lastName}'),
            accountEmail: Text('${user.email}'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: white,
                child: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(
              color: green,
            ),
          ),*/
          InkWell(
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
            ),
            onTap: () {
              changeScreenPush(context, PickupScreen());
            },
          ),
          InkWell(
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person),
            ),
            onTap: null,
          ),
          InkWell(
            child: ListTile(
              title: Text("Online Status"),
              leading: Icon(Icons.online_prediction),
            ),
            onTap: () {
              //changeScreenPush(context, OnlinePage());
            },
          ),
          InkWell(
            child: ListTile(
              title: Text("Ongoing Orders"),
              leading: Icon(Icons.receipt),
            ),
            onTap: null,
          ),
          InkWell(
            child: ListTile(
              title: Text("Order History"),
              leading: Icon(Icons.shopping_cart),
            ),
            onTap: () {},
          ),
          InkWell(
            child: ListTile(
              title: Text("Favorites"),
              leading: Icon(Icons.favorite),
            ),
            onTap: null,
          ),
          Divider(),
          InkWell(
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: green,
              ),
            ),
            onTap: null,
          ),
          InkWell(
              child: ListTile(
                title: Text("Sign Out"),
                leading: Icon(
                  Icons.logout,
                  color: green,
                ),
              ),
              onTap: () {
                showLogOutAlertDialog();
              }
              //signOutGoogle()
              ),
        ],
      ),
    );
  }
}
