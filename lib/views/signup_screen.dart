import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/views/signin_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _nameError = false;
  bool _emailError = false;
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/signup.png", width: 90, height: 90),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Signup",
                style: kMainTitleBoldTextStyle,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 80),
              Text(
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                style: kSmallParaTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15.46),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.facebook_rounded,
                            color: Colors.blue,
                          ),
                          Text(
                            "Facebook",
                            style: kSmallParaTextStyle.copyWith(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15.46),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.facebook_rounded,
                            color: Colors.red,
                          ),
                          Text(
                            "Google",
                            style: kSmallParaTextStyle.copyWith(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  Text(
                    "Or",
                    style: kSmallParaTextStyle.copyWith(color: Colors.black),
                  ),
                  Container(
                    width: 150,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelStyle: kSmallParaTextStyle,
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade300),
                      borderRadius: BorderRadius.circular(15.46),
                    ),
                    errorText: _nameError ? 'Name cannot be empty' : null,
                    errorStyle: kSmallParaTextStyle.copyWith(
                        color: Colors.red, fontSize: 12)),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    labelStyle: kSmallParaTextStyle,
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.46),
                    ),
                    errorText: _emailError ? 'Email cannot be empty' : null,
                    errorStyle: kSmallParaTextStyle.copyWith(
                        color: Colors.red, fontSize: 12)),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  labelStyle: kSmallParaTextStyle,
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.46),
                  ),
                  suffixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(_obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: _termsAndConditions,
                    onChanged: (bool? value) {
                      setState(() {
                        _termsAndConditions = value ?? false;
                      });
                    },
                    activeColor:
                        _termsAndConditions ? Colors.blue : Colors.white,
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: Text(
                      "I agree to the Terms of Services and Privacy Policy",
                      style: kSmallParaTextStyle.copyWith(fontSize: 14),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _nameError = _nameController.text.isEmpty;
                      _emailError = _emailController.text.isEmpty;
                    });

                    if (!_nameError && !_emailError) {
                      // Add your signup logic here
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.46),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(primaryBlueCustomColor),
                  ),
                  child: Text(
                    "Create Account",
                    style: kSubHeadingTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: kSmallParaTextStyle.copyWith(
                            color: Colors.black, fontSize: 12),
                      ),
                      TextSpan(
                        text: "Sign in",
                        style: kSmallParaTextStyle.copyWith(
                            color: Colors.blue, fontSize: 12),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
