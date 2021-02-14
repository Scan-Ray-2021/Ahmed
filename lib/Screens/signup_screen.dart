import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import '../Models/authentication.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(' An Error Occurred'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'], _authData['password']);

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      var errorMessage = 'This e-mail is already registered ';

      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "Group 2.png",
          filterQuality: FilterQuality.high,
          alignment: Alignment.center,
        ),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromRGBO(0, 0, 0, 70)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconShadowWidget(
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        shadowColor: Colors.black54,
                        showShadow: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF021BFD),
                    Color(0x80021BFD),
                  ]),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 550,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // Full name
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Full Name'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'invalid';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        //email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'invalid E-mail';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                          },
                        ),

                        // username
                        TextFormField(
                          decoration: InputDecoration(labelText: 'User Name'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'invalid';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        //Age
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Age'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'invalid';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        //number
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'invalid';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),

                        //password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 5) {
                              return 'invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['password'] = value;
                          },
                        ),
                        // confirm password
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty ||
                                value != _passwordController.text) {
                              return 'Password did not match';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        RaisedButton(
                          // materialTapTargetSize: MaterialTapTargetSize.padded,
                          padding: EdgeInsets.all(0),
                          child: Text('Submit'),
                          onPressed: () {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
