import 'package:chat_app/constants.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/convsersation_screen.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  dbMethods databaseMethod = new dbMethods();
  TextEditingController searchTEC = new TextEditingController();

  QuerySnapshot searchSS;

  Widget searchList(){
    return searchSS != null ? ListView.builder(
        itemCount: searchSS.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return SearchTile(
            username: searchSS.documents[index].data["name"],
            userEmail:searchSS.documents[index].data["email"],
          );
        }) : Container();
  }

  initiateSearch (){
    databaseMethod.getUsersByUserName(searchTEC.text).then((val){
      print(val.toString());
      setState(() {
        searchSS = val;
      });
    });
  }

  createChat({BuildContext context, String userName}){

    String chatID = getChatRoomID(userName, Constants.myName);

    List<String> users = [userName, Constants.myName];
    Map<String, dynamic> chatRoomMap = {
      "users" : users,
      "chatroomID" : chatID,
    };
    dbMethods().createChatRoom(chatID, chatRoomMap);
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ConverstaionScreen()
    ));
  }

  Widget SearchTile({String username, String userEmail}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: textFieldStyle(),),
              Text(userEmail, style: textFieldStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChat(userName: username);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text("Message", style: TextStyle(
                color: Colors.white,
              ),),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTEC,
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                    decoration: InputDecoration(
                        hintText: "search username",
                        hintStyle: TextStyle(
                          color: Colors.amber,
                        )),
                  )),
                  GestureDetector(
                    onTap: (){
                     initiateSearch();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.search)),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

getChatRoomID(String a, String b){
  if(a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)){
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}