import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Column(
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        "assets/images/welcome.jpg",
                        height: 460,
                        width: 380,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Login botton creating
                    children: [
                      MaterialButton(
                        color: Color.fromARGB(255, 13, 155, 100),
                        height: 60,
                        minWidth: double.infinity,
                        onPressed: () {},
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const LoginScreen()));
                        // },
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 12, 173, 114),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          " Login ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Color.fromARGB(255, 8, 150, 96),
                        height: 60,
                        minWidth: double.infinity,
                        onPressed: () {},
                        //      Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const RegisterScreen()));
                        // },

                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 243, 219, 33),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          " Register ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/background.jpg"))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const SizedBox(height: 40),
//             CustomizedButton(
//               buttonText: "Login",
//               buttonColor: Color.fromARGB(255, 3, 123, 57),
//               textColor: Colors.white,
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (_) => const LoginScreen()));
//               },
//             ),
//             CustomizedButton(
//               buttonText: "Register",
//               buttonColor: Color.fromARGB(255, 13, 159, 81),
//               textColor: Colors.black,
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (_) => const SignUpScreen()));
//               },
//             ),
//             const SizedBox(height: 20),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 "Continue as a Guest",
//                 style: TextStyle(color: Color(0xff35C2C1), fontSize: 25),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
