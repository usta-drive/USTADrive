import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usta/providers/login_provider.dart';
import 'package:usta/models/users.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _UserName = '';
  String _Password = '';

  var _UserNameController = TextEditingController();
  var _PasswordController = TextEditingController();
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _UserNameController.dispose();
    _PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isAuthenicated;
    final authenticationProvider= Provider.of<Authentication>(context);

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
                  _UserName = _UserNameController.text;
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
                  _Password = _PasswordController.text;
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
                  onPressed: () async {
                    print(
                        'login_screen.dart#MaterialButton#onPressed: _UserName : $_UserName');
                    print(
                        'login_screen.dart#MaterialButton#onPressed: _Password : $_Password');
                    if (_UserName.isNotEmpty && _Password.isNotEmpty) {

                      try{
                        await authenticationProvider.callLoginAPI(_UserName, _Password);
                        _isAuthenicated=authenticationProvider.isAuthenticated(_UserName, _Password);
                      }catch (error) {
                        final snackBar = SnackBar(
                          content: Text('Sorry , Error $error '),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              _PasswordController.text = '';
                              _UserNameController.text = '';
                            },
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);

                      }



                    }
                    print('login_screen.dart#MaterialButton#onPressed: _isAuthenicated $_isAuthenicated' );

                    if(_isAuthenicated){


                    }else{
                      //show alert
                      print('Login Failed');
                      final snackBar = SnackBar(
                        content: Text('Sorry , Login Faild'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            _PasswordController.text = '';
                            _UserNameController.text = '';
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
