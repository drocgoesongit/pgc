import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/viewmodels/signin_viewmodel.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/signin_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _nameError = false;
  bool _emailError = false;
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                    ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      child: Container(
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
                    ),
                    ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      child: Container(
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
                Row(
                  children: [
                    Expanded(
                      child: ClipPath(
                        clipper: ShapeBorderClipper(
                          shape: ContinuousRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              side: BorderSide(
                                color: softGrayStrokeCustomColor,
                                width: 2,
                              )),
                        ),
                        child: TextFormField(
                          controller: _firstNameController,
                          style: kSmallParaTextStyle,
                          decoration: InputDecoration(
                            labelStyle: kSmallParaTextStyle,
                            labelText: 'First Name',
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: InputBorder.none, // Remove the border
                            errorText:
                                _nameError ? 'Name cannot be empty' : null,
                            errorStyle: kSmallParaTextStyle.copyWith(
                                color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ClipPath(
                        clipper: ShapeBorderClipper(
                          shape: ContinuousRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              side: BorderSide(
                                color: softGrayStrokeCustomColor,
                                width: 2,
                              )),
                        ),
                        child: TextFormField(
                          controller: _secondNameController,
                          style: kSmallParaTextStyle,
                          decoration: InputDecoration(
                            labelStyle: kSmallParaTextStyle,
                            labelText: 'Last Name',
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: InputBorder.none, // Remove the border
                            errorText:
                                _nameError ? 'Name cannot be empty' : null,
                            errorStyle: kSmallParaTextStyle.copyWith(
                                color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: kSmallParaTextStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      labelStyle: kSmallParaTextStyle,
                      labelText: 'Email',
                      border: InputBorder.none, // Remove the border
                      errorText: _emailError ? 'Email cannot be empty' : null,
                      errorStyle: kSmallParaTextStyle.copyWith(
                          color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: kSmallParaTextStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      labelStyle: kSmallParaTextStyle,
                      labelText: 'Password',
                      border: InputBorder.none, // Remove the border
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
                ClipPath(
                  clipper: const ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _nameError = _firstNameController.text.isEmpty;
                          _emailError = _emailController.text.isEmpty;
                        });

                        if (!_nameError && !_emailError) {
                          bool? success = await SignInBackend()
                              .registerWithEmail(
                                  _emailController.value.text,
                                  _passwordController.value.text,
                                  _firstNameController.value.text,
                                  _secondNameController.value.text,
                                  context);

                          if (success != null && success) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
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
      ),
    );
  }
}
