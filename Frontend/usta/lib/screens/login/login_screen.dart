import 'package:flutter/material.dart';
import 'package:usta/models/users.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _UserName;
  String _Password;
  Users _auth = Users();
  var _UserNameController = TextEditingController();
  var _PasswordController = TextEditingController();


  @override
  void dispose() {
    _UserNameController.dispose();
    _PasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('assets/images/usta_logo.jpg'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: _UserNameController,
                onChanged: (value) {
                  _UserNameController.text = value;
                  _UserName=_UserNameController.text;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFDDB64F), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFDDB64F), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _PasswordController,
                obscureText: true,
                onChanged: (value) {
                  _PasswordController.text = value;
                  _Password=_PasswordController.text;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your password.',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFDDB64F), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFDDB64F), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 10.0,
                color: Color(0xFFDDB64F),
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                  onPressed: () {
                    print('user $_UserName');
                    print('password $_Password');
                    _auth.userName = _UserName;
                    _auth.password = _Password;
                    if (_auth.isAuthenticated()) {
                      //Go to next screen
                      print('Login Sucessed');
                      Navigator.pushNamed(context, 'sidebar_menu');
                    } else {
                      //show alert
                      print('Login Failed');
                      final snackBar = SnackBar(
                        content: Text('Sorry , Login Faild'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            _PasswordController.text='';
                            _UserNameController.text='';
                          },
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
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
