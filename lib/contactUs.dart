import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class contactPage extends StatefulWidget {
  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE0902F),
          title: Text(
            "Drop A Message",
            style: GoogleFonts.quicksand(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.send),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0xffE0902F),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 8,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Message",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                ),
              ),
            ],
          ),
        )));
  }
}
