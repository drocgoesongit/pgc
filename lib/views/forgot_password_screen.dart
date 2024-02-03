import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
      ),
      body: Column(
        children: [
          _buildPageIndicator(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                ForgotPasswordPage(
                  onNextPressed: () {
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                ),
                EnterOTPPage(
                  onNextPressed: () {
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                ),
                ResetPasswordPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIndicator(0),
          _buildIndicator(1),
          _buildIndicator(2),
        ],
      ),
    );
  }

  Widget _buildIndicator(int pageIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: _currentPage == pageIndex
            ? primaryBlueCustomColor
            : primaryBlueCustomColor.withOpacity(0.3),
      ),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  final VoidCallback onNextPressed;

  const ForgotPasswordPage({Key? key, required this.onNextPressed})
      : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _emailError = false;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              Image.asset("assets/images/fpass.png", width: 90, height: 90),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Forgot Password",
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  labelStyle: kSmallParaTextStyle,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.46),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  errorText: _emailError ? 'Email cannot be empty' : null,
                  errorStyle: kSmallParaTextStyle.copyWith(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _emailError = _emailController.text.isEmpty;
                    });

                    if (!_emailError) {
                      widget.onNextPressed();
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
                    "Continue",
                    style: kSubHeadingTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
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

class EnterOTPPage extends StatefulWidget {
  final VoidCallback onNextPressed;

  const EnterOTPPage({Key? key, required this.onNextPressed}) : super(key: key);

  @override
  _EnterOTPPageState createState() => _EnterOTPPageState();
}

class _EnterOTPPageState extends State<EnterOTPPage> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/fpass.png", width: 90, height: 90),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Text(
              "Enter OTP",
              style: kMainTitleBoldTextStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 80),
            Text(
              "Enter the OTP code we just sent you on your registered Email/Phone number",
              style: kSmallParaTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue.shade50,
                    ),
                    child: TextFormField(
                      controller: otpControllers[i],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: "",
                        // Remove border
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        // Move focus to the next box
                        if (value.isNotEmpty && i < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (otpControllers
                      .any((controller) => controller.text.isEmpty)) {
                    // Show an error message when any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields are required."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    widget.onNextPressed();
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.46),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      primaryBlueCustomColor), // Use your color
                ),
                child: Text(
                  "Reset Password",
                  style: kSubHeadingTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Didn't get OTP? ",
                      style: kSmallParaTextStyle.copyWith(
                          color: Colors.black, fontSize: 12),
                    ),
                    TextSpan(
                      text: "Resend OTP",
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
    );
  }
}

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String _passwordErrorText = '';
  String _confirmPasswordErrorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              Image.asset("assets/images/rpass.png", width: 90, height: 90),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Forgot Password",
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
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  errorText:
                      _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                  errorStyle: kSmallParaTextStyle.copyWith(
                    color: Colors.red,
                    fontSize: 12,
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
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  labelStyle: kSmallParaTextStyle,
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.46),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  errorText: _confirmPasswordErrorText.isNotEmpty
                      ? _confirmPasswordErrorText
                      : null,
                  errorStyle: kSmallParaTextStyle.copyWith(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(_obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _passwordErrorText = '';
                      _confirmPasswordErrorText = '';
                    });

                    if (_passwordController.text.isEmpty ||
                        _confirmPasswordController.text.isEmpty) {
                      // Set error messages
                      setState(() {
                        if (_passwordController.text.isEmpty) {
                          _passwordErrorText = 'Password cannot be empty';
                        }
                        if (_confirmPasswordController.text.isEmpty) {
                          _confirmPasswordErrorText =
                              'Confirm Password cannot be empty';
                        }
                      });
                    } else if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      // Show an error message when passwords don't match
                      setState(() {
                        _confirmPasswordErrorText = 'Passwords do not match';
                      });
                    } else {
                      // Proceed with password reset logic
                      // ...
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
                    "Continue",
                    style: kSubHeadingTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
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
