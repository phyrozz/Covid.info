import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("About"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(45.0),
            child: Image.asset('assets/app_logo-inverted.png'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: Center(
              child: Text(
                'HACKFEST DEMO',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: Center(
              child: Text(
                'Version 1.0a',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(45.0, 45.0, 45.0, 15.0),
            child: Center(
              child: Text(
                'Developed by',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Joshua Malabanan',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Text(
                    'Lance Balungcas',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Text(
                    'Lloyd Cruz',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Center(
                  child: Text(
                    'Caleb Paulin',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text("Stay safe everyone!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
