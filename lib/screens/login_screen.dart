import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/drive-symbol.svg",
                  color: const Color(0xFFB98B7B),
                  width: 50,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Drive Mate",
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/red car.png",
              width: 350,
            ),
            const Text(
              "로그인 정보를 입력하세요.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "NotoSansKR",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  fillColor: Colors.white,
                  hintText: "Username",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  fillColor: Colors.white,
                  hintText: "Password",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Switch(
                    thumbColor: WidgetStateProperty.all(const Color(0xFFB98B7D)),
                    inactiveTrackColor: Colors.transparent,
                    activeColor: const Color(0xFFB98B7D),
                    inactiveThumbColor: Colors.white,
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Remember",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                ),
                onPressed: () {
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFE00421), Color(0xFFAE001B)],
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                      fontFamily: "NotoSansKR",
                      fontWeight: FontWeight.w800,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              color: const Color(0xFF131313),
              width: double.maxFinite,
              height: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(0),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)
                          )),
                          backgroundColor: WidgetStateProperty.all(const Color(0xFF808080)),
                        ),
                        onPressed: () {},
                        child: Container(
                          height: 45,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: "NotoSansKR",
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(0),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)
                          )),
                          backgroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        child: Container(
                          height: 45,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: const Text(
                            "Password Reset",
                            style: TextStyle(
                                fontFamily: "NotoSansKR",
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.black
                            ),
                          ),
                        )
                    ),
                  ),
                  const Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}