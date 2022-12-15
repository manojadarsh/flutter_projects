import 'package:cloud_firestore/cloud_firestore.dart';

class dbMethods {
  getUsersByUserName(String username){
    return Firestore.instance.collection("users").where("name", isEqualTo: username).getDocuments();
  }

  getUsersByUserEmail(String email){
    return Firestore.instance.collection("users").where("name", isEqualTo: email).getDocuments();
  }

  uploadUserInfo(userMap){

    //check here for potential errors

    return Firestore.instance.collection("users").add(userMap);
  }
  createChatRoom(String chatRoomID, chatRoomMap){
    Firestore.instance.collection("ChatRoom").document(chatRoomID).setData(chatRoomMap).catchError((e){
      print(e.toString());
    });
  }
}