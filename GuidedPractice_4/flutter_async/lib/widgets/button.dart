import 'package:flutter/material.dart';

class AwaitButton extends StatefulWidget {
  final Function fun;
  final Color color;
  final String icon;
  final int duration;

  const AwaitButton(
      {super.key,
      required this.fun,
      this.color = Colors.blue,
      required this.duration,
      required this.icon});

  @override
  State<AwaitButton> createState() => _AwaitButtonState();
}

class _AwaitButtonState extends State<AwaitButton> {
  bool selected = false;
  bool finished = false;
  String text = '';

  getData() async {
    widget.fun().then((value) => setState(() {
          text = value.toString();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            getData();
            selected = !selected;
          });
        },
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90.0,
                width: 100.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.color),
                child: Center(
                  child: Image.network(
                    widget.icon,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              AnimatedContainer(
                width: selected ? 250.0 : 0.0,
                height: 30.0,
                color: widget.color,
                alignment: AlignmentDirectional.center,
                duration: selected
                    ? Duration(seconds: widget.duration)
                    : const Duration(seconds: 0),
                onEnd: () => setState(
                  () {
                    selected = false;
                    finished = true;
                  },
                ),
              ),
              Text(
                finished ? text : '0',
                style:
                    TextStyle(fontSize: 40, color: widget.color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
