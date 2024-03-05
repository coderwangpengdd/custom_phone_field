import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(58, 64, 80, 1),
        appBar: AppBar(
          title: Text('Phone Field Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  focusNode: focusNode,
                  disableAutoFillHints: true,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: Color.fromRGBO(144, 116, 235, 0.1),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(255, 255, 255, 0.1))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(255, 255, 255, 0.1))),
                      counterText: "",
                      hintText: 'phone number',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.32),
                          fontSize: 16,
                          height: 1),
                      errorText: ""),
                  languageCode: "en",
                  invalidNumberMessage: "",
                  dropdownTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.white,
                  dropdownIcon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  child: Text('Submit'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
