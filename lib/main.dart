import 'dart:io';

import 'package:dart_socket_server/dart_socket_server.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final server = DartSocketServer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dart Socket Server')),
        body: Center(
            child: FutureBuilder(
          future: server.init(),
          builder: (context, snapshot) {
            if (snapshot == null) return Text('Server: Null Snapshot');
            if (snapshot.error != null)
              return Text('Server: Snapshot Error: ${snapshot.error}');
            final serverSocket = snapshot.data as ServerSocket;
            if (serverSocket == null) return Text('Null Server Socket');
            return Column(
              children: [
                Text('address: ${serverSocket.address}'),
                Text('port: ${serverSocket.port}'),
                StreamBuilder(
                  stream: server.stream,
                  builder: (context, snapshot) {
                    if (snapshot == null) return Text('Socket: Null Snapshot');
                    if (snapshot.error != null)
                      return Text('Socket Error: ${snapshot.error}');
                    return Text(snapshot.data ?? 'null');
                  },
                ),
              ],
            );
          },
        )));
  }
}
