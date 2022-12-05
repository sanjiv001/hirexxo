import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hirexxo/models/user_model.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 5, 172, 19),
      width: double.infinity,
      height: 280,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.jpg'),
              ),
            ),
          ),
          const Text(
            //"${loggedInUser.firstName} ${loggedInUser.secondName}""
            " HireXXo",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const Text(
            // "${loggedInUser.email}"
            " ssanjiv0001@gmail.con",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hirexxo/models/user_model.dart';
// import 'package:hirexxo/services/db.dart';
// import 'package:hirexxo/utils/addscreen/getimage.dart';
// import 'package:provider/provider.dart';

// class Menu extends StatefulWidget {
//   @override
//   _MenuState createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserModel>(context);
//     return Container(
//       color: Colors.white,
//       width: 250,
//       child: ListView(
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(user.pseudo ?? "Aucun"),
//             accountEmail: Text(user.email ?? "Aucun"),
//             currentAccountPicture: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.white,
//                 backgroundImage:
//                     user.image != null ? NetworkImage(user.image) : null,
//                 child: Stack(children: [
//                   if (user.image == null)
//                     Center(child: Icon(Icons.person, color: Colors.black)),
//                   if (loading)
//                     Center(
//                         child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                     )),
//                   Positioned(
//                     top: 38,
//                     left: 13,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.camera_alt,
//                         color: Colors.black,
//                       ),
//                       onPressed: () async {
//                         final data = await showModalBottomSheet(
//                             context: context,
//                             builder: (ctx) {
//                               return GetImage();
//                             });
//                         if (data != null) {
//                           loading = true;
//                           setState(() {});
//                           String urlImage = await DBServices()
//                               .uploadImage(data, path: "profile");
//                           if (urlImage != null) {
//                             final updateUser = user;
//                             updateUser.image = urlImage;
//                             bool isupdate =
//                                 await DBServices().updateUser(updateUser);
//                             if (isupdate) {
//                               loading = false;
//                               setState(() {});
//                             }
//                           }
//                         }
//                       },
//                     ),
//                   )
//                 ])),
//           ),
//         ],
//       ),
//     );
//   }
// }
