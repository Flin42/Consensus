import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class JoinSession extends StatefulWidget {
  JoinSession({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {
  final _formKey = GlobalKey<FormState>();
  int code;
  var result;

  void scan() async {
    result = await BarcodeScanner.scan();
    print(result.rawContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 4 / 7,
                  height: 40,
                  child: TextFormField(
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                        hintText: 'Enter Code',
                        hintStyle: TextStyle(fontWeight: FontWeight.w100)),
                    textAlign: TextAlign.center,
                    onChanged: (String value) {
                      code = int.tryParse(value);
                    },
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter code';
                      } else if (int.tryParse(value) == null) {
                        return 'Must only be numbers';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ElevatedButton(
                      child: Text("Enter",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pushNamed(context, '/Swipe');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.orange,
                      )),
                  width: MediaQuery.of(context).size.width * 4 / 7,
                  height: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                      child: Text("Scan QR Code",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      onPressed: () {
                        scan();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.purple,
                      )),
                  width: MediaQuery.of(context).size.width * 4 / 7,
                  height: 70,
                ),
              ],
            ),
          )),
    );
  }
}
