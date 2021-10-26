import 'dart:convert';

import 'dart:typed_data';

import 'package:buzzer_arduino/buzzer_page.dart';
import 'package:buzzer_arduino/led_page.dart';
import 'package:buzzer_arduino/led_page2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({Key? key, this.server, this.lcdMessage}) : super(key: key);
  final String? lcdMessage;

  @override
  _ChatPageState createState() => _ChatPageState();
}



class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  BluetoothConnection? connection;

  final ScrollController listScrollController = ScrollController();

  bool isConnecting = true;

  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;
  @override
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    BluetoothConnection.toAddress(widget.server!.address).then((_connection) {
      print('Cihaza bağlanıldı');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    });
  }

  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection!.dispose();
      connection = null;
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    
    TextEditingController lcdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              text: "Buzzer",
            ),
            Tab(
              text: "Led",
            ),
            Tab(
              text: "Led 2",
            ),
            Tab(
              text: "LCD",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 95),
              child: buzzerPage(
                sendMessage1: () => _sendMessage('1'),
                sendMessage2: () => _sendMessage('2'),
                sendMessage3: () => _sendMessage('3'),
                sendMessage4: () => _sendMessage('4'),
                sendMessage5: () => _sendMessage('5'),
                sendMessage6: () => _sendMessage('6'),
                sendMessage7: () => _sendMessage('7'),
                sendMessage8: () => _sendMessage('8'),
                sendMessage9: () => _sendMessage('9'),
              )),
          Align(
            alignment: Alignment.center,
            child: ledPage(
              sendMessageA: () => _sendMessage('a'),
              sendMessageK: () => _sendMessage('k'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ledPage2(
              sendMessageA: () => _sendMessage('a'),
              sendMessageK: () => _sendMessage('k'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: lcdController,
                      decoration: InputDecoration(
                        hintText: "LCD ekranda gösterilecek yazıyı giriniz.",
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _sendMessage('x' + lcdController.text);
                        },
                        icon: Icon(Icons.send)),
                    IconButton(
                        onPressed: () {
                          _sendMessage('t');
                        },
                        icon: Icon(Icons.clear))
                  ]),
            ),
          ),


          
        ],
      ),
    );
  }

  _sendMessage(String text) async {
    text = text.trim();
    

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;

        
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
