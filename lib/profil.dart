import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:review_anime/login.dart';
import 'package:review_anime/services/database_service.dart';
import 'package:review_anime/services/firestore_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      final email = user.email;
      if (email != null) {
        final myUser = await FireStoreService.getUser(email: email);
        if (myUser != null) {
          setState(() {
            _currentUser = myUser;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 53, 115),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        actions: [
          IconButton(
            icon:
                Icon(Icons.logout), // Ganti dengan ikon logout yang diinginkan
            onPressed: () {
                  _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            if (_currentUser != null)
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/d3/0e/0f/d30e0f6bab82c3937c90c1485f0c0942.jpg"), // Pastikan ini benar
              ),
            const SizedBox(height: 20),
            if (_currentUser == null)
              Center(
                child: Container(
                  width: 60.0, // Lebar container
                  height: 60.0, // Tinggi container
                  decoration: BoxDecoration(
                    shape: BoxShape
                        .circle, // Mengatur bentuk container menjadi lingkaran
                    color: Colors.white, // Warna latar belakang container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Warna bayangan
                        blurRadius: 6.0, // Radius bayangan
                        spreadRadius: 1.0, // Sebaran bayangan
                      ),
                    ],
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
              )
            else
              Column(
                children: [
                  ProfileInfo("Name", _currentUser?.fullname ?? ""),
                  const SizedBox(height: 20),
                  ProfileInfo("Phone", _currentUser?.notlp ?? ""),
                  const SizedBox(height: 20),
                  ProfileInfo("Email", _currentUser?.email ?? ""),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfo(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      height: 80,
      width: 800,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 11, 53, 115),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepPurple.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 17,
            ),
          ),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
