import 'package:flutter/material.dart';
import '../model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email.subject),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${email.from}', 
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  )),

              const SizedBox(height: 10.0),
              const Divider(color: Colors.orange),
              const SizedBox(height: 10.0),

              Text(email.subject, 
                  style: const TextStyle(
                    fontSize: 15,
                  )),

              const SizedBox(height: 5.0),

              Text(email.dateTime.toString().substring(0, 16), 
                  style: const TextStyle(
                    fontSize: 12
                  )),

              const SizedBox(height: 10.0),
              const Divider(color: Colors.orange),
              const SizedBox(height: 10.0),
              
              Text(email.body,
                  style: const TextStyle(
                    fontSize: 15
                  ),),
            ],
          ),
        ));
  }
}

