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
                        "assets/images/wlc.jpg",
                        height: 500,
                        width: 600,
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
                        color: Colors.blue,
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
                            color: Colors.blue,
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
                        height: 30,
                      ),
                      MaterialButton(
                        color: Colors.blue,
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
