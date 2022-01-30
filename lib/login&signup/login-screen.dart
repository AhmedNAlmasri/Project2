import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/create-new-account.dart';
import 'package:flutter_ecommerce_ui_kit/login&signup/pallete.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'background-image.dart';
import 'forgot-password.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isAdmin = false;

  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home', arguments: isAdmin);
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return Home();

      // }
      // ));
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        BackgroundImage(
          image: 'assets/images/fast-fashion.jpg',
        ),
        Scaffold(
          floatingActionButton: SizedBox(
              height: 50,
              width: 150,
              child: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                label: Text('Log In'),
                onPressed: validate,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          backgroundColor: Colors.transparent,
          body: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: Text(
                          'SeamlesStyle',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            fillColor: Colors.grey[500]!.withOpacity(0.5),
                            prefixIcon: Icon(FontAwesomeIcons.envelope),
                            hintText: 'Email',
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required *"),
                            EmailValidator(errorText: "Not A vaild Email "),
                          ]),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon: Icon(FontAwesomeIcons.lock),
                              hintText: 'Password',
                              fillColor: Colors.grey[500]!.withOpacity(0.5),
                            ),
                            validator: MinLengthValidator(8,
                                errorText: "should be at least 8 caracter")),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPassword();
                            }));
                          },
                          child: Text(
                            'Forgot Password',
                            style: kBodyText,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CreateNewAccount();
                            }));
                          },
                          child: Container(
                            child: Text(
                              'Create New Account',
                              style: kBodyText,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black))),
                          ),
                        ),
                        SizedBox(
                          height: 125,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
