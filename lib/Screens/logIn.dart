import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/tabsScreen.dart';



class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class Gmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 332.50,
          height: 24,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: SizedBox(
                  width: 160.65,
                  height: 24,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LogInPageState extends State<LogInPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  void signUserIn() {
   Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              right: -MediaQuery.of(context).size.width * 0.1,
              child: Column(
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    width: 1200,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Positioned(
                          top: -5,
                          right: -20,
                          child: Container(
                            width: 525,
                            height: 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.imgur.com/HqR0qnt.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        'Log in',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color.fromRGBO(34, 56, 67, 1),
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // student id input field

                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // password input field

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 14,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        },
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color:
                                rememberMe ? Colors.blue : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Icon(
                            rememberMe
                                ? Icons.check
                                : Icons.check_box_outline_blank,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color.fromRGBO(34, 56, 67, 1),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                // sign in button

                MyButton(
                  onTap: signUserIn,
                ),

                // New column with image
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Stack(
            children: [
              TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  filled: false, // Set to false to remove the gray background
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 2.5,
                  width: 370, // Adjust the width accordingly
                  color: Color.fromRGBO(34, 56, 67, 1), // Dark blue line color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        //padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(34, 56, 67, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}