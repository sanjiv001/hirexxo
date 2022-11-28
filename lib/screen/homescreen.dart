import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hirexxo/Drawer_section/drawer_header.dart';
import 'package:hirexxo/models/user_model.dart';
import 'package:hirexxo/screen/botton_navigation_bar.dart';
import 'package:hirexxo/screen/dashboard_sceen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("HireXXo"),
        centerTitle: true,
      ),
      body: RootApp(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            MyDrawerHeader(),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('Dashboard'),
              onTap: () => Navigator.of(context).pushNamed('/home'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () => Navigator.of(context).pushNamed('/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('HostelList'),
              onTap: () => Navigator.of(context).pushNamed('/lalitpur'),
            ),
            ListTile(
              leading: const Icon(Icons.add_home),
              title: const Text(' Add Hostel '),
              onTap: () => Navigator.of(context).pushNamed('/addhostel'),
            ),
            ListTile(
              leading: const Icon(Icons.location_searching_sharp),
              title: const Text(' Map Navigation'),
              onTap: () => Navigator.of(context).pushNamed('/googlemap'),
            ),
            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(' Send Feedback '),
              onTap: () => Navigator.of(context).pushNamed('/feedback'),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_rounded),
              title: const Text(' Privacy '),
              onTap: () => Navigator.of(context).pushNamed('/privacy'),
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications_rounded),
              title: const Text('Setting'),
              onTap: () => Navigator.of(context).pushNamed('/setting'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () => Navigator.of(context).pushNamed('/'),
            ),
          ],
        ),
      ), //Deawer
      //Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 150,
      //           child: Image.asset("assets/images/welcome.jpg",
      //               fit: BoxFit.contain),
      //         ),
      //         const Text(
      //           "Welcome Back",
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         Text("${loggedInUser.email}",
      //             style: const TextStyle(
      //               color: Colors.black54,
      //               fontWeight: FontWeight.w500,
      //             )),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         ActionChip(
      //             label: const Text("Logout"),
      //             onPressed: () {
      //               logout(context);
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
