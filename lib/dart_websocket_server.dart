import 'dart:io';

class DartWebSocketServer {
  DartWebSocketServer() {
    HttpServer.bind(InternetAddress.anyIPv4, 8080).then((HttpServer server) {
      print("HttpServer listening...");
      server.serverHeader = "DartEcho (1.0) by James Slocum";
      server.listen((HttpRequest request) {
        if (WebSocketTransformer.isUpgradeRequest(request)) {
          WebSocketTransformer.upgrade(request).then(_handleWebSocket);
        } else {
          print("Regular ${request.method} request for: ${request.uri.path}");
          _serveRequest(request);
        }
      });
    });
  }

  void _handleWebSocket(WebSocket socket) {
    print('Client connected!');
    socket.listen((s) {
      print('Client sent: $s');
      socket.add('echo: $s');
    }, onDone: () {
      print('Client disconnected');
    });
  }

  void _serveRequest(HttpRequest request) {
    request.response.statusCode = HttpStatus.forbidden;
    request.response.reasonPhrase = "WebSocket connections only";
    request.response.close();
  }
}
