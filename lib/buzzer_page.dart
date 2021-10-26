import 'package:flutter/material.dart';


class buzzerPage extends StatefulWidget {
  const buzzerPage({Key? key , required this.sendMessage1  , required this.sendMessage2  , required this.sendMessage3  , required this.sendMessage4
    , required this.sendMessage5  , required this.sendMessage6,
     required this.sendMessage7  , required this.sendMessage8  , required this.sendMessage9          }) : super(key: key);
  final Function sendMessage1;
  final Function sendMessage2;
  final Function sendMessage3;
  final Function sendMessage4;
  final Function sendMessage5;
  final Function sendMessage6;
  final Function sendMessage7;
  final Function sendMessage8;
  final Function sendMessage9;
  

  @override
  _buzzerPageState createState() => _buzzerPageState();
}

class _buzzerPageState extends State<buzzerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (_) => widget.sendMessage1(),
              onTapDown: (_) => widget.sendMessage2(),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Do",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTapUp: (_) => widget.sendMessage1(),
                onTapDown: (_) => widget.sendMessage3(),
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Text(
                      "Re",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ))),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (_) =>widget.sendMessage1(),
              onTapDown: (_) => widget.sendMessage4(),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Mi",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTapUp: (_) =>widget.sendMessage1(),
                onTapDown: (_) => widget.sendMessage5(),
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Text(
                      "Fa",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ))),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (_) =>widget.sendMessage1(),
              onTapDown: (_) => widget.sendMessage6(),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Sol",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTapUp: (_) =>widget.sendMessage1(),
                onTapDown: (_) => widget.sendMessage7(),
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Text(
                      "La",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ))),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            GestureDetector(
              onTapUp: (_) =>widget.sendMessage1(),
              onTapDown: (_) => widget.sendMessage8(),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Si",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTapUp: (_) =>widget.sendMessage1(),
                onTapDown: (_) => widget.sendMessage9(),
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    child: Text(
                      "iDo",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ))),
          ],
        ),
      ],
    );
  }
}
