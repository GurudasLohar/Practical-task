import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibicle_practical/providers/login_provider.dart';
import 'package:tibicle_practical/screens/user_details_screen.dart';

import '../constants/box_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();

  late String emailAddress;
  late String password;

  @override
  Widget build(BuildContext context) {
    final loginPrvd = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginPrvd.formKey,
          autovalidateMode:  AutovalidateMode.always,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/app_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Tibicle',
                            style: TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10, bottom: 50),
                      child: Text(
                        'Practical Task',
                          style: TextStyle(
                                  fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                        child: TextFormField(
                          controller: emailControl,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Email Address',
                            prefixIcon: const Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          validator: (value) {
                            String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = RegExp(p);

                            if (value!.isEmpty) {
                              return "Please enter email address";
                            } else if (!regExp.hasMatch(value)) {
                              return "Please enter valid email";
                            } else {
                              return null;
                            }
                          },

                          onChanged: (value) => loginPrvd.onSaveEmail(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                        child: TextFormField(
                          obscureText: loginPrvd.isVisible,
                          controller: passwordControl,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 25,
                            ),
                            suffixIcon: IconButton(
                              icon: loginPrvd.isVisible
                                  ? Icon(Icons.visibility_off, size: 25,color: Colors.white,)
                                  : Icon(Icons.visibility, size: 25,color: Colors.white,),
                              onPressed: () {
                                if(loginPrvd.isVisible == true){
                                  loginPrvd.isVisible = false;
                                }else{
                                  loginPrvd.isVisible = true;
                                }
                              },
                            ),
                          ),
                         validator:  (value){
                           if (value!.isEmpty) {
                             return "Please enter the password";
                           } else if (value.length < 6) {
                             return "Password must contain 6 characters";
                           } else
                             return null;
                         },
                          onChanged: (value) => loginPrvd.onSavePassword(value),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(loginPrvd.formKey.currentState!.validate()){
                            loginPrvd.formKey.currentState!.save();
                            print("You are login successfully");
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetailsScreen()));
                          }else{
                            loginPrvd.autovalidate = true;
                            print("Please enter valid credentials");
                          }

                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(40)),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 65, vertical: 15),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
