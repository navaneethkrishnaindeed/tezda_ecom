import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_ecom/application/auth/login/cubit/login_cubit.dart';
import 'package:tezda_ecom/domain/routes/routes.dart';
import 'package:tezda_ecom/domain/utils/screen_sizes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  LoginCubit cubitInstance = LoginCubit();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    cubitInstance.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 202, 209, 220),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: ScreenSizes(context).screenHeightFraction(percent: 10),
          ),
          SizedBox(
            height: ScreenSizes(context).screenHeightFraction(percent: 35),
            width: ScreenSizes(context).screenWidth(),
            child: const Icon(
              Icons.android,
              size: 150,
            ),
          ),
          Text(
            "TEZDA",
            style: GoogleFonts.aboreto(fontSize: 44),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Signup",
            style: GoogleFonts.aboreto(fontSize: 24,fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: ScreenSizes(context).screenWidthFraction(percent: 85),
            child: GestureDetector(
              child: TextFormField(
                onTap: () {},
                style: const TextStyle(color: Colors.black),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 6),
                  alignLabelWithHint: true,
                  hintText: "Email...",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(
                    Icons.phone,
                    size: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: ScreenSizes(context).screenWidthFraction(percent: 85),
            child: GestureDetector(
              child: TextFormField(
                onTap: () {},
                style: const TextStyle(color: Colors.black),
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 6),
                  alignLabelWithHint: true,
                  hintText: "Password...",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(
                    Icons.password,
                    size: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenSizes(context).screenHeightFraction(percent: 3),
          ),
          GestureDetector(
              onTap: () async {
                if (_emailController.text != "" &&
                    _passwordController.text != "") {
                  await cubitInstance.signup(
                      email: _emailController.text,
                      password: _passwordController.text);
                  Navigator.of(context).pushNamed(RoutePath.mainScreen);

                }
              },
              child: Container(
                height: ScreenSizes(context).screenHeightFraction(percent: 5),
                width: ScreenSizes(context).screenWidthFraction(percent: 85),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
              )),
          SizedBox(
            height: ScreenSizes(context).screenHeightFraction(percent: 5),
          )
        ]),
      ),
    );
  }
}
