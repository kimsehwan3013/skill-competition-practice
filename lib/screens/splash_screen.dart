import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _symbolAnimation;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _textAnimation;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<double> _fadeAnimation4;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _symbolAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.50, curve: Curves.easeInOut)));

    _textAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.50, 0.75, curve: Curves.easeInOut)));

    _fadeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)));
    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.50, curve: Curves.easeInOut)));
    _fadeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 0.75, curve: Curves.easeInOut)));
    _fadeAnimation4 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut)));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward().whenComplete(() {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        });
      });
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation1,
              child: SlideTransition(
                position: _symbolAnimation,
                child: SvgPicture.asset("assets/icons/drive-symbol.svg",
                    color: Color(0xFFB98B7B), width: 80, fit: BoxFit.fitHeight),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeTransition(
              opacity: _fadeAnimation2,
              child: SlideTransition(
                position: _logoAnimation,
                child: const Text(
                  "Drive Mate",
                  style: TextStyle(
                      fontFamily: "NotoSansKR",
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeTransition(
              opacity: _fadeAnimation3,
              child: SlideTransition(
                position: _textAnimation,
                child: const Text(
                  "연결하고, 운전하고, 즐기세요",
                  style: TextStyle(
                      fontFamily: "NotoSansKR",
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FadeTransition(
              opacity: _fadeAnimation4,
              child: Image.asset("assets/images/car.png"),
            )
          ],
        ),
      ),
    );
  }
}
