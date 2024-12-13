import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftDoorAnimation;
  late Animation<double> _rightDoorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define animations for the doors
    _leftDoorAnimation = Tween<double>(begin: 0.0, end: -1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    _rightDoorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );

    // Start the animation and navigate to the next screen
    _controller.forward().then((value) {
      Timer(
        const Duration(seconds: 1),
        () => Get.off(HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Center(
            child: Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  // Left Door
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: Offset(
                          MediaQuery.of(context).size.width *
                              _leftDoorAnimation.value,
                          0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Right Door
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.translate(
                      offset: Offset(
                          MediaQuery.of(context).size.width *
                              _rightDoorAnimation.value,
                          0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// class DoorOpenSplashScreen extends StatefulWidget {
//   @override
//   _DoorOpenSplashScreenState createState() => _DoorOpenSplashScreenState();
// }
//
// class _DoorOpenSplashScreenState extends State<DoorOpenSplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _leftDoorAnimation;
//   late Animation<double> _rightDoorAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize AnimationController
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 4),
//     );
//
//     // Define animations for the doors
//     _leftDoorAnimation = Tween<double>(begin: 0.0, end: -1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
//     );
//     _rightDoorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
//     );
//
//     // Start the animation and navigate to the next screen
//     _controller.forward().then((value) {
//       Timer(
//         const Duration(seconds: 1),
//             () => Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => WelcomeScreen()),
//         ),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Center(
//             child: Text(
//               "Welcome!",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               ),
//             ),
//           ),
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Stack(
//                 children: [
//                   // Left Door
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Transform.translate(
//                       offset: Offset(MediaQuery.of(context).size.width * _leftDoorAnimation.value, 0),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 2,
//                         height: MediaQuery.of(context).size.height,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                   // Right Door
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Transform.translate(
//                       offset: Offset(MediaQuery.of(context).size.width * _rightDoorAnimation.value, 0),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 2,
//                         height: MediaQuery.of(context).size.height,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "Welcome to the App!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:card_maker/screens/home_screen.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late final AnimationController animationController =
//       AnimationController(vsync: this, duration: Duration(seconds: 3))
//         ..repeat();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     animationController.dispose();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(
//       Duration(seconds: 3),
//       () {
//         Get.off(HomeScreen());
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Center(child: CircularProgressIndicator())),
//     );
//   }
// }
