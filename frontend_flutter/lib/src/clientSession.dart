import 'package:flutter/material.dart';

class ClientSession extends StatefulWidget {
  // final String title;
  // ClientSession({Key key, this.title}) : super(key: key);

  @override
  _ClientSession createState() => _ClientSession();
}

class _ClientSession extends State<ClientSession> {
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
                "1",
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
                    "Test",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Join Code:",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    args.toString(),
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "Leave",
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
