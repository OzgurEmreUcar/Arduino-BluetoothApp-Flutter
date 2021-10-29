library send_messagee;

import 'dart:convert';

import 'dart:typed_data';
import 'package:animated_stack/animated_stack.dart';
import 'package:buzzer_arduino/buzzer_page.dart';
import 'package:buzzer_arduino/led_page.dart';
import 'package:buzzer_arduino/led_page2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({
    Key? key,
    this.server,
    this.lcdMessage,
  }) : super(key: key);
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
  List<Color> _colorlist = [];
  List<Color> genrateColorslist() {
    List<Color> _colorslist = [];
    for (int i = 0; i < (8 * 8); i++) {
      _colorslist.add(Colors.black);
    }
    return _colorslist;
  }

  void initState() {
    super.initState();
    _colorlist = genrateColorslist();
    _controller = TabController(length: 5, vsync: this, initialIndex: 0);
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

  bool btnColor = false;

  Widget build(BuildContext context) {
    TextEditingController lcdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
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
            Tab(text: "Matrix"),
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
          AnimatedStack(
            backgroundColor: Colors.black,
            fabBackgroundColor: Colors.white,
            foregroundWidget: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2d2d2d),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 55),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemCount: 8 * 8,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          btnColorChange();
                          if (_colorlist[index] == Colors.red) {
                            setState(() {
                              _colorlist[index] = Colors.black;
                            });
                            _sendMessage(index.toString() + "+0");
                          } else {
                            setState(() {
                              _colorlist[index] = Colors.red;
                            });
                            _sendMessage(index.toString() + "+1");
                          }

                          print(index.toString());
                          print(index.toString());
                        },
                        child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: _colorlist[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            columnWidget: Column(
              children: [
                IconButton(
                    onPressed: () {
                      _sendMessage('c');
                    },
                    icon: Icon(Icons.face)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      _sendMessage('d');
                    },
                    icon: Icon(Icons.car_repair)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      _sendMessage('e');
                    },
                    icon: Icon(Icons.arrow_upward_outlined)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      _sendMessage('f');
                    },
                    icon: Icon(Icons.arrow_downward_outlined)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      _sendMessage('g');
                    },
                    icon: Icon(Icons.arrow_back_outlined)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      _sendMessage('h');
                    },
                    icon: Icon(Icons.arrow_forward_outlined)),
              ],
            ),
            bottomWidget: Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: GestureDetector(
                  onTap: () {
                    _sendMessage('j');
                   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Matrix'i temizle",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.clear)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  btnColorChange() {
    setState(() {
      btnColor = !btnColor;
    });
  }

  _sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state

      }
    }
  }
}
