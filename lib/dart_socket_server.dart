import 'dart:async';
import 'dart:convert';
import 'dart:io';

class DartSocketServer {
  ServerSocket _serverSocket;
  StreamSubscription<Socket> _subscription;
  Stream<String> _stream;
  Socket _socket;

  DartSocketServer();

  Stream<String> get stream => _stream;
  Socket get socket => _socket;

  Future<ServerSocket> init() async {
    // bind
    _serverSocket = await ServerSocket.bind('0.0.0.0', 6677);

    // listen
    _subscription = _serverSocket.listen((socket) {
      _socket = socket;
      _stream = utf8.decoder.bind(socket);
    }, onError: (dynamic error, StackTrace trace) {
      print(error.toString());
    });

    return _serverSocket;
  }
}
