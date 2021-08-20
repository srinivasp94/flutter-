import 'package:flutter/material.dart';
import 'package:flutter_demo/home/home_page.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController signupNameController = TextEditingController();

  TextEditingController signuppasswordController = TextEditingController();

  TextEditingController signupEmailController = TextEditingController();

  TextEditingController signupMobileController = TextEditingController();

  String mName;
  String mMobile;
  String mEmail;
  String mPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          children: <Widget>[
            TextField(
              controller: signupNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                fillColor: Colors.white12,
                hintText: 'User Name ',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey[400],
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.grey[200], width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.deepPurple[200], width: 1),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  mName = text;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: signupEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.white12,
                hintText: 'Email ',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey[400],
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.grey[200], width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.deepPurple[200], width: 1),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  mEmail = text;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: signupMobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: Colors.white12,
                hintText: ' Mobile Number',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: Colors.grey[400],
                ),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.grey[200], width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.deepPurple[200], width: 1),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  mMobile = text;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: signuppasswordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white12,
                hintText: 'Password ',
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.grey[400],
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.grey[200], width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  borderSide:
                  BorderSide(color: Colors.deepPurple[200], width: 1),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  mPassword = text;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "By pressing Submit you agree to \n terms & Conditions",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        validateRegisterForm();
                      });
                    }),
                    child: Text(
                      "REGITSTER",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void validateRegisterForm() {
    if (mName == null ||
        mEmail == null ||
        mMobile == null ||
        mPassword == null) {

      Navigator.of(context).push(MaterialPageRoute(builder:
          (context) => Home()));

      Fluttertoast.showToast(
          msg: "Enter all the fileds",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (signupEmailController.text
        .toString()
        .trim()
        .isEmpty) {
      Fluttertoast.showToast(
          msg: "Email is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (signupNameController.text
        .toString()
        .trim()
        .isEmpty) {
      Fluttertoast.showToast(
          msg: "Name is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (signupMobileController.text
        .toString()
        .trim()
        .isEmpty) {
      Fluttertoast.showToast(
          msg: "Mobile Number is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (signuppasswordController.text
        .toString()
        .trim()
        .isEmpty) {
      Fluttertoast.showToast(
          msg: "Password is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      //MAke api call here
      registerApiCall();
    }
  }

  Future<Response> registerApiCall() async {
    String url = "https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/user/register";

    var client = DigestAuthClient("", "");
    Map<String, String> mapParams = {
      "firstName": mName,
      "mobile": mMobile,
      "email": mEmail,
      "password": mPassword
    };
    final response = await client.post(url,body: mapParams);

    print(response.body);
    
    Navigator.of(context).push(MaterialPageRoute(builder:
    (context) => Home()));
  }
}
