import 'package:flutter/material.dart';
import 'send_message.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ledPage extends StatefulWidget {
  const ledPage({Key? key, required this.sendMessageA , required this.sendMessageK}) : super(key: key);
  final Function sendMessageA;
  final Function sendMessageK;

  @override
  _ledPageState createState() => _ledPageState();
}

class _ledPageState extends State<ledPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        InkWell(
          onTap: () {
            widget.sendMessageA();
          },
          child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Text(
                "AÇ",
                style: TextStyle(color: Colors.grey[400], fontSize: 20),
              )),
        ),
        SizedBox(
          height: 50,
        ),
        InkWell(
            onTap: () {
              widget.sendMessageK();
            },
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Text(
                  "KAPAT",
                  style: TextStyle(color: Colors.grey[400], fontSize: 20),
                ))),
      ],
    );
  }
}
