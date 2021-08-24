import 'package:flutter/material.dart';

class NewReferralsScreen extends StatefulWidget {
  @override
  _NewReferralsScreenState createState() => _NewReferralsScreenState();
}

class _NewReferralsScreenState extends State<NewReferralsScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/header_bg.png'),
            fit: BoxFit.cover,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "New Referral",
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Refer you friends to earn points",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white12,
                    hintText: 'Name ',
                    prefixIcon: Icon(Icons.lock_open),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide:
                      BorderSide(color: Colors.deepPurple[200], width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                    fillColor: Colors.white12,
                    hintText: 'Mobile ',
                    prefixIcon: Icon(Icons.lock_open),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide:
                      BorderSide(color: Colors.deepPurple[200], width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                    fillColor: Colors.white12,
                    hintText: 'Email ',
                    prefixIcon: Icon(Icons.lock_open),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide:
                      BorderSide(color: Colors.deepPurple[200], width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                    fillColor: Colors.white12,
                    hintText: 'Address ',
                    prefixIcon: Icon(Icons.lock_open),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      borderSide:
                      BorderSide(color: Colors.deepPurple[200], width: 1),
                    ),
                  ),
                ),
              ),

              ElevatedButton(onPressed: () {},
                  child: Text(' Elevated Button'))
            ],
          ),
        ),
      ),
    );
  }
}
