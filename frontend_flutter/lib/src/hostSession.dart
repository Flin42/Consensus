import 'package:flutter/material.dart';

class HostSession extends StatefulWidget {
  // final String title;
  // HostSession({Key key, this.title}) : super(key: key);

  @override
  _HostSession createState() => _HostSession();
}

class _HostSession extends State<HostSession> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Consensus"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.person, size: 40),
              Text(
                "0",
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    args,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Join Code:",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "1234",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
