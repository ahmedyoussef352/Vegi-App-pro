import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


import '../sreens/models/usermodel.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
   required User currentUser,
   required String userName,
   required String userImage,
   required String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

   List<UserModel> currentData = [];

  void getUserData() async {
     List<UserModel> newList = [];
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (value.exists) {
    UserModel  userModel = UserModel(
        userEmail: value.get("userEmail"),
        userImage: value.get("userImage"),
        userName: value.get("userName"),
        userUid: value.get("userUid"),
      );
      newList.add(userModel);
      
    }
   currentData = newList;
    
      notifyListeners();
  }
  List <UserModel> get currentUserData {
    return currentData;
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// import '../sreens/models/usermodel.dart';

// class UserProvider with ChangeNotifier {
//    addUserData(
//       {required User currentUser,
//       required String userName,
//       required String userEmail,
//       required String userImage}) async {
//     await
//      FirebaseFirestore.instance
//         .collection("usersData")
//         .doc(FirebaseAuth.instance.currentUser?.uid)
        
//         .set({
//       "userName": userName,
//       "userEmail": userEmail,
//       "userImage": userImage,
//       "userUId": currentUser.uid,
//     });
//   }

//   List<UserModel> currentDataList = [] ;

//    getUserData(Function(dynamic data) param0) async {
//    List <UserModel> userList =[];
//     DocumentSnapshot<Map<String, dynamic>> value = await FirebaseFirestore.instance
//     .collection("usersData")
//     .doc(FirebaseAuth.instance.currentUser?.uid)
//     .get();
//     if(value.exists)
//       { 
//       UserModel  userModel = UserModel(
//           userEmail: value.get("userEmail"),
//           userImage: value.get("userImage"),
//           userName: value.get("userName"),
//           userUid: value.get("userUid")
//           );

//       userList.add(userModel);
//     }
  
//     currentDataList = userList;
//       notifyListeners();
//   }

//   List<UserModel> get currentUserData {
//     return currentDataList;
//   }
// }

