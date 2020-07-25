# dart_socket_server

Experimenting with Dart Sockets, using Flutter apps as client and server.

This is the server app, the client app is [dart_socket_client](https://github.com/nickmeinhold/dart_socket_client).

## Context

Experimenting with sockets so that we can (potentially) use sockets to do video file transfer over a local network in [CrowdLeague](https://github.com/nickmeinhold/crowdleague). 

## Command Line Chat App 

### Run the server 

To run the command line chat app `server`, download this repo and run:

```sh
dart chat_server.dart
```

### Run the client

To run a command line chat app `client`, download [dart_socket_client](https://github.com/nickmeinhold/dart_socket_client) and run:

```sh
dart chat_client.dart
```

Open at least 2 clients, send a message and you will see the message in the other client. 