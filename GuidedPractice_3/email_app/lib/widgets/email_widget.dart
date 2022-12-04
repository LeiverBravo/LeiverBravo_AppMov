import 'package:flutter/material.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(9),
        height: 90,
        child: Row(
          children: [
            //Part for icon with state read or unread
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Icon(
                    color: !email.read ? Colors.amber : Colors.transparent,
                    Icons.alternate_email),
              ),
            ),
            //Part for email-headers
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(email.dateTime.toString().substring(0, 10),
                      style: const TextStyle(
                        fontSize: 14,
                      )),
                  Text(email.subject, 
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )),
                  Text(email.from, 
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}