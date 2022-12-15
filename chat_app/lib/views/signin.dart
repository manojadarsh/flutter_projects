import 'package:chat_app/helper/helperFunctions.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatroomscreen.dart';

//stateful widget used to handle information
class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  authenticationMethods authMethods = new authenticationMethods();

  dbMethods databaseMethods = new dbMethods();

  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  bool isLoading = false;

  QuerySnapshot snapshotUserInfo;

  signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(emailTEC.text);

      setState(() {
        isLoading = true;
      });

      authMethods
          .signInwithEmailAndPassword(emailTEC.text, passwordTEC.text)
          .then((val) {
            if (val != null){

              //check for error part 3 19:25
              databaseMethods.getUsersByUserEmail(emailTEC.text).then ((val){
                snapshotUserInfo = val;
                HelperFunctions.saveUserEmailSharedPreference(snapshotUserInfo.documents[0].data["name"]);
              });

              HelperFunctions.saveUserLoggedInSharedPreference(true);

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ChatRoom()));
            }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Please provide a valid email.";
                            },
                            controller: emailTEC,
                            style: textFieldStyle(),
                            decoration: textFieldInputDecoration("email"),
                          ),
                          TextFormField(
                            validator: (val) {
                              return val.length < 6
                                  ? "Please provide valid password, more than 6 characters."
                                  : null;
                            },
                            controller: passwordTEC,
                            obscureText: true,
                            style: textFieldStyle(),
                            decoration: textFieldInputDecoration("password"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Text("Sign In", style: buttonText()),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Text("Sign In with Google", style: buttonText()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: textFieldStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("Register Now!",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
