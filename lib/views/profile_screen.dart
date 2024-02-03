import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<UserModel> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: kSubHeadingTextStyle),
      ),
      body: FutureBuilder<UserModel>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                // Navigate to login screen
                Navigator.pushNamed(context, '/login');
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/not_logged_in_image.png'),
                    Text('Not Logged In'),
                  ],
                ),
              ),
            );
          } else {
            UserModel user = snapshot.data!;
            // Display user data
            return Text('Welcome, ${user.firstName} ${user.lastName}');
          }
        },
      ),
    );
  }
}
