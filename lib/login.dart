
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interntask/home_screen.dart';
import 'package:interntask/main.dart';
import 'auth_services.dart';
import 'package:provider/provider.dart';
import 'authentication.dart'; 



class Login extends StatefulWidget {

  final Function toggleScreen;

  const Login({Key key, this.toggleScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void _loginWithGoogle() async{

  setState((){
      
  });

  final googleSignIn = GoogleSignIn(scopes: ['email']);

  try{
    final googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount == null){
      setState(() {
        
      });
      return;
    }

    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    
    await FirebaseFirestore.instance.collection('users').add({
      'email': googleSignInAccount.email,
      'imageUrl' : googleSignInAccount.photoUrl,
      'name': googleSignInAccount.displayName,
    });

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);

  }on FirebaseAuthException catch (e){
    var content = "error";
  }

  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('failed'),
    content: Text('error'),
    actions: [TextButton(onPressed: (){
      Navigator.of(context).pop();
    },child: Text('OK'),)],
  ));

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
                    height: MediaQuery.of(context).size.height * (2 / 6) + 50,
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
                          "Login Account",
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
                            cursorColor: Colors.black,
                            validator: (val) => val.length < 6
                                ? "Enter more than 6 char"
                                : null,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                                await loginProvider.login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              }
                            },
                            child: Text(
                              "login",
                              style: GoogleFonts.quicksand(color: Colors.white),
                            ),
                          ),
                        ),
                        Text('or'),
                        Material(
                          color: Color.fromRGBO(47, 159, 224, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: MaterialButton(
                            //color: Colors.red,
                            minWidth: 150,
                            onPressed: () async {
                              _loginWithGoogle();
                            },
                            child: Text(
                              "Google",
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
                      "Don't have an account?",
                      style: GoogleFonts.quicksand(),
                    ),
                  ),
                  TextButton(
                    onPressed: () => widget.toggleScreen(),
                    child: Text(
                      "REGISTER",
                      style: GoogleFonts.quicksand(color: Color(0xffE0902F)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}


