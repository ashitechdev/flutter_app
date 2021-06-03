import 'dart:async';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cartpage_provider.dart';
import 'package:flutter_app/providers/homepage_provider.dart';
import 'package:flutter_app/ui/homepage/homepage_screen.dart';
import 'package:flutter_app/ui/my_animations/myanimations.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  Widget loginBox() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixText: "   ",
                      hintText: "Registered Email",
                      hintStyle: TextStyle(color: Colors.white70)),
                  validator: EmailValidator(errorText: "Enter a valid email"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixText: "   ",
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70)),
                  obscureText: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "pass is required"),
                    MinLengthValidator(5, errorText: "mini length 5")
                  ]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 140,
                padding: EdgeInsets.only(right: 30),
                child: ProgressButton(
                  defaultWidget: const Text('Log In'),
                  progressWidget: const CircularProgressIndicator(),
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 3), () {
                      /// can do some task
                    });
                    // After [onPressed], it will trigger animation running backwards, from end to beginning
                    return () {
                      if (formKey.currentState.validate()) {
                        Navigator.of(context)
                            .pushReplacement(PageScaleTransition(MultiProvider(
                          providers: [
                            ChangeNotifierProvider<HomepageProvider>(
                              create: (_) => HomepageProvider(),
                            ),
                            ChangeNotifierProvider<CartpageProvider>(
                              create: (_) => CartpageProvider(),
                            ),
                          ],
                          child: HomePage(),
                        )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Error in Fields :("),
                        ));
                      }
                    };
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  cardKey.currentState.toggleCard();
                },
                child: RichText(
                    text: TextSpan(
                        text: 'OR',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                        children: <TextSpan>[
                      TextSpan(
                          text: '  Sign up?',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 20))
                    ])),
              ),
            ],
          ),
          // Container(
          //   height: 40,
          //   child: LoadingButton(
          //     color: Colors.blue,
          //     onSubmit: onTap,
          //     controller: _btnController,
          //     errorColor: Colors.red,
          //     transitionDuration: Duration(seconds: 1),
          //     child: Text(
          //       'Login',
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyText1
          //           .copyWith(color: Colors.white),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget signUpBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    prefixText: "   ",
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white70)),
                validator: EmailValidator(errorText: "Enter a valid email"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    prefixText: "   ",
                    hintText: "Create a new password",
                    hintStyle: TextStyle(color: Colors.white70)),
                obscureText: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: "pass is required"),
                  MinLengthValidator(5, errorText: "mini length 5")
                ]),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 140,
              padding: EdgeInsets.only(right: 30),
              child: ProgressButton(
                defaultWidget: const Text('SignUp'),
                progressWidget: const CircularProgressIndicator(),
                onPressed: () async {
                  await Future.delayed(const Duration(seconds: 3), () {
                    /// can do some task
                  });
                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                  return () {
                    if (formKey.currentState.validate()) {
                      Navigator.of(context)
                          .pushReplacement(PageScaleTransition(MultiProvider(
                        providers: [
                          ChangeNotifierProvider<HomepageProvider>(
                            create: (_) => HomepageProvider(),
                          ),
                          ChangeNotifierProvider<CartpageProvider>(
                            create: (_) => CartpageProvider(),
                          ),
                        ],
                        child: HomePage(),
                      )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error in Fields :("),
                      ));
                    }
                  };
                },
              ),
            ),
            TextButton(
              onPressed: () {
                cardKey.currentState.toggleCard();
              },
              child: RichText(
                  text: TextSpan(
                      text: 'OR',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                      children: <TextSpan>[
                    TextSpan(
                        text: '  Log In?',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 20))
                  ])),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/564x/df/b8/bb/dfb8bb43a67e8fd69203c36dca4893eb.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SimpleTransformAnimation(
              delayInMilliSeconds: 2000,
              yBegin: 150,
              xBegin: 0,
              yEnd: -50,
              child: Container(
                width: 135,
                height: 135,
                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/aesth_icon.png"),
                ),
              ),
            ),
            ProFadeAndTransformAnimation(
                delayInMilliSeconds: 2200,
                yBegin: 0,
                yEnd: 0,
                xBegin: 0,
                xEnd: 0,
                opacityDuration: Duration(milliseconds: 1600),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: FlipCard(
                    key: cardKey,
                    flipOnTouch: false,
                    front: loginBox(),
                    back: signUpBox(),
                  ),
                )),
            ProFadeAndTransformAnimation(
                delayInMilliSeconds: 2500,
                xBegin: 0,
                yBegin: 0,
                yEnd: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleAuthButton(
                      onPressed: () {},
                      darkMode: false,
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                      ),
                    ),
                    FacebookAuthButton(
                      onPressed: () {},
                      darkMode: false,
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                      ),
                    ),
                    TwitterAuthButton(
                      onPressed: () {},
                      darkMode: false,
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                      ),
                    ),
                    GithubAuthButton(
                      onPressed: () {},
                      darkMode: false,
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                      ),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
