import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:websocket_manager/websocket_manager.dart';
// import 'package:web_socket_channel/html.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:socket_io/socket_io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:flutter_simple_dependency_injection/injector.dart';

class HostSession extends StatefulWidget {
  // final String title;
  // final WebSocketChannel channel;
  // HostSession({Key key, @required this.channel}) : super(key: key);

  @override
  _HostSession createState() => _HostSession();
}

class _HostSession extends State<HostSession> {
  int participants = 0;

  WebsocketManager socket;

  @override
  Widget build(BuildContext context) {
    // socket = WebsocketManager("http://localhost:8000");
    // socket.connect();
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
                    args,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                  // StreamBuilder(
                  //   stream: widget.channel.stream,
                  //   builder: (context, snapshot) {
                  //     return Text(
                  //       snapshot.hasData ? snapshot.data : "Waiting",
                  //       style: TextStyle(
                  //           fontSize: 50, fontWeight: FontWeight.w900),
                  //     );
                  //   },
                  // ),
                  QrImage(data: "1234", size: 150),
                  Text(
                    "Join Code:",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "1234",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 20,
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
                      onPressed: () {
                        // print("test");
                        // widget.channel.sink.add('test');
                        // socket.send("test");
                        Navigator.pushNamed(context, '/Swipe');
                      },
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
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
                        // socket.onMessage((dynamic message) {
                        //   print(message);
                        // });
                      },
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
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
