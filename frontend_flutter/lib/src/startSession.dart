import 'package:flutter/material.dart';

class StartSession extends StatefulWidget {
  StartSession({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartSessionState createState() => _StartSessionState();
}

class _StartSessionState extends State<StartSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consensus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Start a Session",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: ElevatedButton(
                    child: Text(
                      "Movies",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {},
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * 2 / 5,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: ElevatedButton(
                    child: Text(
                      "Restaurants",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {},
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * 2 / 5,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                child: Text(
                  "Custom",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {},
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
            ),
          ],
        ),
      ),
    );
  }
}
