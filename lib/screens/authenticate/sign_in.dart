import 'package:covid_info/services/auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({this.toggleView});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomPaint(
        painter: ShapePainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 130.0, 0.0, 0.0),
              child: Text(
                "LOG IN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter a valid email" : null,
                      decoration: InputDecoration(
                        hintText: "EMAIL",
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
                    child: TextFormField(
                      validator: (val) =>
                          val.length < 6 ? "Incorrect password" : null,
                      decoration: InputDecoration(
                        hintText: "PASSWORD",
                      ),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    height: 65.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: RaisedButton(
                            color: Colors.grey[900],
                            child: Text(
                              "LOG IN",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        "Invalid email or password. Please try again.";
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text("Sign up")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Paint shapePaint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.white;
    canvas.drawPath(mainBackground, paint);

    Path topShape = Path();
    topShape.addPolygon([
      Offset.zero,
      Offset(size.width, 0),
      Offset(size.width, size.height / 5),
      Offset(0, size.height / 3)
    ], true);
    shapePaint.color = Colors.grey[900];
    canvas.drawPath(topShape, shapePaint);

    Path bottomShape = Path();
    bottomShape.addPolygon([
      Offset(0, size.height),
      Offset(size.width, size.height),
      Offset(size.width, (size.height - size.height / 3)),
      Offset(0, (size.height - size.height / 5)),
    ], true);
    canvas.drawPath(bottomShape, shapePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
