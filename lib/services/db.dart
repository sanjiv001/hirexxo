import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hirexxo/models/apartment.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';

// class DBServices {
//   final CollectionReference usercol =
//       FirebaseFirestore.instance.collection("user");

//   final CollectionReference Buildingcol =
//       FirebaseFirestore.instance.collection("Building");

//   // final CollectionReference carouselcol =
//   //     FirebaseFirestore.instance.collection("carousel");

//   // final CollectionReference commentcol =
//   //     FirebaseFirestore.instance.collection("commentaires");

//   Future saveUser(UserModel user) async {
//     try {
//       await usercol.doc(user.uid).set(user.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future saveBuilding(Building building) async {
//     try {
//       await usercol.doc().set(building.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

// Future<String?> uploadImage(File file, {String? path}) async {
//   var time = DateTime.now().toString();
//   var ext = Path.basename(file.path).split(".")[1].toString();
//   String image = path + "_" + time + "." + ext;
//   try {
//     StorageReference ref =
//         FirebaseStorage.instance.ref().child(path + "/" + image);
//     StorageUploadTask upload = ref.putFile(file);
//     await upload.onComplete;
//     return await ref.getDownloadURL();
//   } catch (e) {
//     return null;
//   }
// }

//   Future getUser(String id) async {
//     try {
//       final data = await usercol.doc(id).get();
//       final user = UserM.fromJson(data.data());
//       return user;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future updateUser(UserM user) async {
//     try {
//       await usercol.doc(user.id).update(user.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Stream<UserM> get getCurrentUser {
//     final user = FirebaseAuth.instance.currentUser;
//     return user != null
//         ? usercol.doc(user.uid).snapshots().map((user) {
//             UserM.currentUser = UserM.fromJson(user.data());
//             return UserM.fromJson(user.data());
//           })
//         : null;
//   }

//   Future<List> get getCarouselImage async {
//     try {
//       final data = await carouselcol.doc("ZlhrUQtxlBN7KsbgfFpM").get();
//       return data.data()["imgs"];
//     } catch (e) {
//       return null;
//     }
//   }

//   Future savevehicule(Vehicule vehicule) async {
//     try {
//       await vehiculecol.doc().set(vehicule.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future updatevehicule(Vehicule vehicule) async {
//     try {
//       await vehiculecol.doc(vehicule.id).update(vehicule.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future deletevehicule(String id) async {
//     try {
//       await vehiculecol.doc(id).delete();
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Stream<List<Vehicule>> getvehicule({CarType type, String uid}) {
//     return vehiculecol
//         .where("type",
//             isEqualTo: type == null
//                 ? null
//                 : type == CarType.car
//                     ? "car"
//                     : "moto")
//         .where("uid", isEqualTo: uid)
//         .snapshots()
//         .map((vehicule) {
//       return vehicule.docs
//           .map((e) => Vehicule.fromJson(e.data(), id: e.id))
//           .toList();
//     });
//   }

//   Stream<List<Vehicule>> getvehiculefav(CarType type) {
//     final user = FirebaseAuth.instance.currentUser;
//     return vehiculecol
//         .where("type", isEqualTo: type == CarType.car ? "car" : "moto")
//         .where("favories", arrayContains: user.uid)
//         .snapshots()
//         .map((vehicule) {
//       return vehicule.docs
//           .map((e) => Vehicule.fromJson(e.data(), id: e.id))
//           .toList();
//     });
//   }

//   Stream<List<UserM>> get getAllUsers {
//     return usercol.snapshots().map((users) {
//       return users.docs.map((e) => UserM.fromJson(e.data())).toList();
//     });
//   }

//   Future<bool> add_comment(Comment comment) async {
//     try {
//       await commentcol.doc().set(
//           comment.toMap()..update("date_comment", (value) => Timestamp.now()));
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Stream<int> getCountComment(String id) {
//     return commentcol
//         .where("id_comment_pub", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList()
//           .length;
//     });
//   }

//   Stream<List<Comment>> gecomment(String id) {
//     return commentcol
//         .where("id_comment_pub", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList();
//     });
//   }

//   Stream<List<Comment>> gecommentComment(String id) {
//     return commentcol
//         .where("id_comment", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList();
//     });
//   }

//   Stream<int> getCountCommentComment(String id) {
//     return commentcol
//         .where("id_comment", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList()
//           .length;
//     });
//   }
//}

class DBServices {
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("user");

  final CollectionReference buildingcol =
      FirebaseFirestore.instance.collection("building");

  final CollectionReference carouselcol =
      FirebaseFirestore.instance.collection("carousel");

  final CollectionReference commentcol =
      FirebaseFirestore.instance.collection("commentaires");

  Future savebuilding(Building building) async {
    try {
      await buildingcol.doc().set(building.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future updatebuilding(Building building) async {
  //   try {
  //     await buildingcol.doc(building.id).update(building.toMap());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future deletebuilding(String id) async {
  //   try {
  //     await buildingcol.doc(id).delete();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Stream<List<Building>> getbuilding({ApartmentType type, String uid}) {
  //   return buildingcol
  //       .where("type",
  //           isEqualTo: type == null
  //               ? null
  //               : type == ApartmentType.apartment ? "apartment" : "room")
  //       .where("uid", isEqualTo: uid)
  //       .snapshots()
  //       .map((building) {
  //     return building.docs
  //         .map((e) => Building.fromJson(e.data(), id: e.id))
  //         .toList();
  //   });
  // }

  // Stream<List<Building>> getbuildingfav(ApartmentType type) {
  //   final user = FirebaseAuth.instance.currentUser;
  //   return buildingcol
  //       .where("type", isEqualTo: type == ApartmentType.apartment ? "apartment" : "room")
  //       .where("favories", arrayContains: user.uid)
  //       .snapshots()
  //       .map((building) {
  //     return building.docs
  //         .map((e) => Building.fromJson(e.data(), id: e.id))
  //         .toList();
  //   });
  // }

//  Future saveUser(UserModel user) async {
//     try {
//       await usercol.doc(user.uid).set(user.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

  Future<String?> uploadImage(File file, {String? path}) async {
    var time = DateTime.now().toString();
    var ext = Path.basename(file.path).split(".")[1].toString();
    String image = path! + "_" + time + "." + ext;
    try {
      Reference ref = FirebaseStorage.instance.ref().child(path + "/" + image);
      UploadTask upload = ref.putFile(file);
      await upload.whenComplete;
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

//   uploadPic(File _image1) async {
//    FirebaseStorage storage = FirebaseStorage.instance;
//    String url;
//    Reference ref = storage.ref().child("image1" + DateTime.now().toString());
//    UploadTask uploadTask = ref.putFile(_image1);
//    uploadTask.whenComplete(() {
//       url = ref.getDownloadURL();
//    }).catchError((onError) {
//     print(onError);
//     });
//    return url;
// }

//   Future getUser(String id) async {
//     try {
//       final data = await usercol.doc(id).get();
//       final user = UserM.fromJson(data.data());
//       return user;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future updateUser(UserM user) async {
//     try {
//       await usercol.doc(user.id).update(user.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Stream<UserM> get getCurrentUser {
//     final user = FirebaseAuth.instance.currentUser;
//     return user != null
//         ? usercol.doc(user.uid).snapshots().map((user) {
//             UserM.currentUser = UserM.fromJson(user.data());
//             return UserM.fromJson(user.data());
//           })
//         : null;
//   }

//   Future<List> get getCarouselImage async {
//     try {
//       final data = await carouselcol.doc("ZlhrUQtxlBN7KsbgfFpM").get();
//       return data.data()["imgs"];
//     } catch (e) {
//       return null;
//     }
//   }

//   Stream<List<UserM>> get getAllUsers {
//     return usercol.snapshots().map((users) {
//       return users.docs.map((e) => UserM.fromJson(e.data())).toList();
//     });
//   }

//   Future<bool> add_comment(Comment comment) async {
//     try {
//       await commentcol.doc().set(
//           comment.toMap()..update("date_comment", (value) => Timestamp.now()));
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Stream<int> getCountComment(String id) {
//     return commentcol
//         .where("id_comment_pub", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList()
//           .length;
//     });
//   }

//   Stream<List<Comment>> gecomment(String id) {
//     return commentcol
//         .where("id_comment_pub", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList();
//     });
//   }

//   Stream<List<Comment>> gecommentComment(String id) {
//     return commentcol
//         .where("id_comment", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList();
//     });
//   }

//   Stream<int> getCountCommentComment(String id) {
//     return commentcol
//         .where("id_comment", isEqualTo: id)
//         .snapshots()
//         .map((comments) {
//       return comments.docs
//           .map((e) => Comment.fromJson(e.data(), e.id))
//           .toList()
//           .length;
//     });
//   }
}
