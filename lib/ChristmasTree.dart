import 'package:flutter/material.dart';

class ChristmasTree extends StatefulWidget {
  ChristmasTree({Key key}) : super(key: key);

  @override
  _ChristmasTreeState createState() => _ChristmasTreeState();
}

class _ChristmasTreeState extends State<ChristmasTree>
    with TickerProviderStateMixin {
  int branches = 7;
  AnimationController controller;
  Animation colorAnimation;
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: buildTree(),
          ),
        ),
      ),
    );
  }

  buildTree() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < branches; i++) buildRow(i),
        buildBase(),
        buildBark(),
      ],
    );
  }

  buildRow(int i) {
    return Wrap(
      children: [
        for (var j = 0; j <= i; j++)
          Text(
            " * ",
            style: TextStyle(
              fontSize: 50,
              color: colorAnimation.value,
            ),
          ),
      ],
    );
  }

  buildBase() {
    return Container(
      width: branches.toDouble() * 50,
      height: 3.5,
      color: Colors.lightGreen,
    );
  }

  buildBark() {
    return Container(
      width: 30,
      height: 100,
      color: Colors.green[700],
    );
  }
}
