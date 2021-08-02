import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tann_mann_gadi/contactUs.dart';
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
          'TheTannMann Gadi',
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
                  "About Us",
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
              Text(
                "     We are a Not for Profit trust venture building Wellness on wheels (The Tann Mann Gaadi) to address the serious problem of open defecation which is a major health risk for all in developing countries.",
                style: GoogleFonts.quicksand(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "     We are in the mission of integrating technology with our social cause.",
                style: GoogleFonts.quicksand(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "     We are in the process of providing a holistic approach to social responsibility keeping health, sensitization, safety and Eco-friendly solutions",
                style: GoogleFonts.quicksand(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Why Tann Mann Gaadi",
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
              Text(
                "Open defecation which is a major health risk globally\n\nInaccessibility of Hygienic & Safe public conveniences\n\nUn-safe environment for women, children, differently abled & the elderly\n\nLack of potable and  clean water\n\nUn-availability of basic health facilities & amenities",
                style: GoogleFonts.quicksand(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
