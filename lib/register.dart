import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_services.dart';
import 'authentication.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;

  const Register({Key key, this.toggleScreen}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2 * MediaQuery.of(context).size.height / 3 + 50,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffE0902F),
                      Color(0xffEBAC60),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: [
                      0.45,
                      0.8,
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 140.0)),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * (2 / 6) +50,
                    width: double.infinity,
                    child: Center(
                      child: Text('logo will go here')
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width - 50,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(.0, 7),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(5, 0),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(-5, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Create Account",
                          style: GoogleFonts.quicksand(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 13),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val) => val.isNotEmpty
                                ? null
                                : "Please enter a email address",
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Email",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 13),
                          child: TextFormField(
                            validator: (val) => val.length < 6
                                ? "Enter more than 6 char"
                                : null,
                            controller: _passwordController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 13),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val) => val.isNotEmpty
                                ? null
                                : "Please enter name",
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Name",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 13),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val) => val.isNotEmpty
                                ? null
                                : "Please enter a Mobile number",
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Color(0xffE0902F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: MaterialButton(
                            //color: Colors.red,
                            minWidth: 150,
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                print("email : ${_emailController.text}");
                                print("email: ${_passwordController.text}");
                                await loginProvider.Register(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              }
                            },
                            child: Text(
                              "Register and Login",
                              style: GoogleFonts.quicksand(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (loginProvider.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 60,
                        child: ListTile(
                          title: Text(loginProvider.errorMessage),
                          leading: Icon(Icons.error),
                          trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => loginProvider.setMessage(null),
                          ),
                        ),
                      ),
                    ),
                  if (loginProvider.errorMessage == null)
                    SizedBox(
                      height: 100,
                    ),
                  Container(
                      child: Text(
                    "Already have an account?",
                    style: GoogleFonts.quicksand(),
                  )),
                  TextButton(
                    onPressed: () => widget.toggleScreen(),
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.quicksand(
                        color: Color(0xffE0902F),
                      ),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
