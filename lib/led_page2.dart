import 'package:flutter/material.dart';
import 'send_message.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ledPage2 extends StatefulWidget {
  const ledPage2({Key? key, required this.sendMessageA , required this.sendMessageK}) : super(key: key);
  final Function sendMessageA;
  final Function sendMessageK;

  @override
  _ledPage2State createState() => _ledPage2State();
}

class _ledPage2State extends State<ledPage2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        ),
        GestureDetector(
          onTapDown: (_) => widget.sendMessageA()
          ,
          onTapUp: (_) => widget.sendMessageK(),
          child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Icon(Icons.flash_on)),
        ),
      
      ],
    );
  }
}
