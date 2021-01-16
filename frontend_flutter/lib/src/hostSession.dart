import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:socket_io/socket_io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:flutter_simple_dependency_injection/injector.dart';

class HostSession extends StatefulWidget {
  // final String title;
  // HostSession({Key key}) : super(key: key);

  @override
  _HostSession createState() => _HostSession();
}

class _HostSession extends State<HostSession> {
  int participants = 0;
  String val = "this is a test";

  // final SocketService socketService = injector.get<SocketService>();
  // socketService.createSocketConnection();

  // SocketIOManager manager = SocketIOManager();
  // SocketIO socket;

  // testFunction(var data) {
  //   // socket.emit("test", "this is a test");
  //   print(data);
  // }

  // IO.Socket socket;

  // @override
  // void initState() {
  //   socket = IO.io("http://your url/", <String, dynamic>{
  //     'transports': ['websocket', 'polling'],
  //   });
  //   socket.connect();
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.emit('msg', 'test');
  //   });
  //   socket.on('event', (data) => print(data));
  //   socket.on('disconnect', (_) => print('disconnect'));
  //   socket.on('fromServer', (_) => print(_));
  //   socket.on('test', testFunction);
  // }

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
                        // socket.emit('test', 'hi');
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
