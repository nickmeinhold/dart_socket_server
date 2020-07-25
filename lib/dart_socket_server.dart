import 'dart:io';
import 'dart:convert';

class DartSocketServer {
  DartSocketServer() {
    ServerSocket.bind(InternetAddress.anyIPv6, 7654).then((ServerSocket srv) {
      print('serversocket is ready');
      srv.listen(_handleClient);
    }).catchError(print);
  }

  void _handleClient(Socket client) {
    print('Connection from: '
        '${client.remoteAddress.address}:${client.remotePort}');
    // data from client:
    utf8.decoder.bind(client).listen(print);
    // data to client:
    client.write("Hello from Simple Socket Server!\n");
    client.close();
  }
}
