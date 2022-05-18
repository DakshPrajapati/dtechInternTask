import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interntask/contactUs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE0902F),
        title: Text(
          'main',
          style: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async => await loginProvider.logout(),
        ),
      ),
      body: homePage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE0902F),
        child: Icon(Icons.email),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => contactPage()));
        },
      ),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Hey!!!",
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE0902F),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
