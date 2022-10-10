// ignore_for_file: use_build_context_synchronously

import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:symmetryk/components/snackbar.dart';
import 'package:symmetryk/statics.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool checked = false;




  handleLogin() async {
    
    if (usernamecontroller.text.isEmpty) {
      ShowSnackBar().showSnackBar(
        context,
        "Please provide your username",
        duration: const Duration(seconds: 2),
        noAction: false,
      );
      return;
    }

    if (passwordcontroller.text.isEmpty) {
      ShowSnackBar().showSnackBar(
        context,
        "Please provide your password",
        duration: const Duration(seconds: 2),
        noAction: false,
      );
      return;
    }
    
    await Future.delayed(const Duration(milliseconds: 3000));
    Hive.box('settings').put('remember', checked);
    Navigator.popAndPushNamed(context, '/home');

      // ShowSnackBar().showSnackBar(
      //   context,
      //   "wrong credentials",
      //   duration: const Duration(seconds: 2),
      //   noAction: false,
      // );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/logo-transparent.png',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: usernamecontroller,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: 'Email',
                    hintText: 'E-mail adress',
                    labelStyle: TextStyle(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.7),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: TextStyle(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.7),
                      fontSize: 14.0,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorLight,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.8),
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcontroller,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.7),
                      fontSize: 14.0,
                    ),
                    labelStyle: TextStyle(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.7),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColorLight,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.8),
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              activeColor: Palette.secondaryColor,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(color: Colors.white),
                              splashRadius: 5,
                              value: checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  checked = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Remember me',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                EasyButton(
              idleStateWidget: const Text(
                'Login to your account',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              loadingStateWidget: const CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
              useWidthAnimation: true,
              useEqualLoadingStateWidgetDimension: true,
              width: 300,
              height: 40.0,
              borderRadius: 20,
              buttonColor: Palette.secondaryColor,
              onPressed: handleLogin,
            ),
            
                // MaterialButton(
                //   onPressed: handleLogin,
                //   height: 45,
                //   color: Palette.secondaryColor,
                //   padding: const EdgeInsets.symmetric(vertical: 10),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30.0),
                //   ),
                //   child: const SizedBox(
                //     width: 250,
                //     child: Center(
                //         child: Text(
                //           "Login to your account",
                //           style:
                //               TextStyle(color: Colors.white, fontSize: 16.0),
                //         )),
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.8),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Palette.secondaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
