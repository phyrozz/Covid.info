import 'package:covid_info/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomPaint(
        painter: RegisterPagePainter(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 130.0, 0.0, 0.0),
                child: Text(
                  "SIGN UP",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0.0),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? "Enter an email" : null,
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
                  validator: (val) => val.length < 6
                      ? "Enter a password with 6 characters long"
                      : null,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "PASSWORD",
                  ),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
                child: TextFormField(
                  validator: (val) =>
                      val != password ? "Passwords need to match" : null,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "CONFIRMED PASSWORD",
                  ),
                  onChanged: (val) {
                    setState(() {
                      confirmPassword = val;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error =
                              "Email already exists or invalid. Please try again.";
                        });
                      }
                    }
                  },
                  child: Text("CREATE AN ACCOUNT"),
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
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text("Return to Sign In")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPagePainter extends CustomPainter {
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
