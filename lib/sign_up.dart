import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_screen.dart';
import 'product_grid.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final username_controller = TextEditingController();
  final email_controller = TextEditingController();
  final mobile_no_controller = TextEditingController();
  final pass = TextEditingController();
  final confirmPass = TextEditingController();

  SharedPreferences logindata;
  bool newuser;

  bool changeButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => CartScreen()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    email_controller.dispose();
    mobile_no_controller.dispose();
    pass.dispose();
    confirmPass.dispose();
    logindata.setString('username', '');
    super.dispose();
  }

  moveToCart(BuildContext context) async {
    String username = username_controller.text;

    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      logindata.setBool('login', false);
      logindata.setString('username', username);

      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context).pushNamed(CartScreen.routeName);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign up',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
          color: Colors.white,
          onPressed: () {
            dispose();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductsOverviewScreen();
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'images/1.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: username_controller,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty && value.length < 2) {
                          return "Username Cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: email_controller,
                      decoration: InputDecoration(
                        hintText: "Enter your email address",
                        labelText: "Email address",
                      ),
                      validator: (value) => EmailValidator.validate(value)
                          ? null
                          : "Please enter a valid email",
                    ),
                    TextFormField(
                      controller: mobile_no_controller,
                      decoration: InputDecoration(
                        hintText: "Enter your mobile no",
                        labelText: "Mobile number",
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.length != 10) {
                          return "Enter correct mobile number !!";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      obscureText: true,
                      controller: pass,
                      validator: (val) {
                        final isDigitsOnly = int.tryParse(val);
                        if (isDigitsOnly == null) {
                          return "Password should be a numeric digits!!!";
                        } else if (val.isEmpty && val.length < 8) {
                          return 'Password length should be 8 numeric digits';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Confirm password",
                        ),
                        obscureText: true,
                        controller: confirmPass,
                        validator: (val) {
                          if (val.isEmpty) return 'Empty';
                          if (val != pass.text) return 'Not Match';
                          return null;
                        }),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () => moveToCart(context),
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(left: 200),
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
