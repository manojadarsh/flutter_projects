import 'package:chat_app/helper/helperFunctions.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/chatroomscreen.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  authenticationMethods authMethods = new authenticationMethods();

  dbMethods dataBaseMethods = new dbMethods();
  
  HelperFunctions helperFunctions = new HelperFunctions();

  //TEC - text editing controller
  TextEditingController usernameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  validateSignUp () {
    if(formKey.currentState.validate()){

      Map<String, String> userInfoMap = {
        "name" : usernameTEC.text,
        "email" : emailTEC.text,
      };

      HelperFunctions.saveUserNameSharedPreference(usernameTEC.text);
      HelperFunctions.saveUserEmailSharedPreference(emailTEC.text);
      
      setState(() {
        isLoading = true;
      });
      authMethods.signUpWithEmailAndPassword(emailTEC.text, passwordTEC.text).then((val){
        //print(("$val.uid"));

        dataBaseMethods.uploadUserInfo(userInfoMap);

        HelperFunctions.saveUserLoggedInSharedPreference(true);

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ChatRoom()
        ));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sign Up!",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 35,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column (
                      children: [
                        TextFormField(
                          validator: (val) {
                            return val.isEmpty || val.length < 4 ? "Please provide a valid user name." : null;
                          },
                          controller: usernameTEC,
                          style: textFieldStyle(),
                          decoration: textFieldInputDecoration("username"),
                        ),
                        TextFormField(
                          validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                            null : "Please provide a valid email.";
                          },
                          controller: emailTEC,
                          style: textFieldStyle(),
                          decoration: textFieldInputDecoration("email"),
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.length < 6 ? "Please provide valid password, more than 6 characters." : null;
                          },
                          controller: passwordTEC,
                          style: textFieldStyle(),
                          obscureText: true,
                          decoration: textFieldInputDecoration("password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: (){
                      validateSignUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text("Sign Up", style: buttonText()),
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
                    child: Text("Sign Up with Google", style: buttonText()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: textFieldStyle(),
                      ),
                      GestureDetector(
                        onTap: (){
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Sign in now!",
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
            ),
          ),
        ),
    );
  }
}
