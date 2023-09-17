import 'package:amazon_clone/common/widget/custom_button.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:amazon_clone/constants/global_varibles.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup;
}

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    ListTile(
                      tileColor: _auth == Auth.signup
                          ? Colors.transparent
                          : Colors.grey,
                      title: const Text(
                        'Create Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          activeColor: GlobalVariables.secondaryColor,
                          value: Auth.signup,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          }),
                    ),
                    if (_auth == Auth.signup)
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _nameController,
                                  hintText: 'Name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                    text: 'Sign Up',
                                    onTap: () {
                                      if (_signUpFormKey.currentState!
                                          .validate()) {
                                        signUpUser();
                                      }
                                    })
                              ],
                            )),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Sign In Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                          activeColor: GlobalVariables.secondaryColor,
                          value: Auth.signin,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          }),
                    ),
                    if (_auth == Auth.signin)
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                            key: _signInFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                    text: 'Sign In',
                                    onTap: () {
                                      if (_signInFormKey.currentState!
                                          .validate()) {
                                        signInUser();
                                      }
                                    })
                              ],
                            )),
                      ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
