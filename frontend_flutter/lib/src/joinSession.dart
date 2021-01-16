import 'package:flutter/material.dart';

class JoinSession extends StatefulWidget {
  JoinSession({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoinSessionState createState() => _JoinSessionState();
}

class _JoinSessionState extends State<JoinSession> {
  final _formKey = GlobalKey<FormState>();
  int code;

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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      )),
                  width: MediaQuery.of(context).size.width * 4 / 7,
                  height: 70,
                )
              ],
            ),
          )),
    );
  }
}
