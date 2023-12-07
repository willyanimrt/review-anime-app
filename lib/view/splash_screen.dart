import 'package:flutter/material.dart';
import 'package:review_anime/login.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 53, 115),
      body: Stack(
        children: [
          backgroundImage(),
          Container(
            width: 1920,
            height: 1080,
            color: Color(0xFF131429).withOpacity(0.77),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  RichText(
                    text: const TextSpan(
                      text: 'ANIME\t',
                      style: TextStyle(
                        color: Colors.white,
                          fontFamily: "Bebas", fontSize: 30, letterSpacing: 5),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'INSIGHT',
                          style: TextStyle(color: Color(0xFF00aaff)),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          "Give a rating for \ the anime you like",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.transparent,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      height: 50,
                      width: 500 * 0.7,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container backgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://anime.atsit.in/l/wp-content/uploads/2022/10/black-rock-shooter-fragment-ra-mat-vao-ngay-24-thang-11-hay-dang-ky-truoc-ngay-hom-nay.jpg'),
          // image: AssetImage('assets/images/9.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SplashScreen(),
//     theme: ThemeData(
//       primarySwatch: Colors.blue, // Ganti dengan warna tema utama Anda
//     ),
//   ));
// }