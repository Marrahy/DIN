import 'package:flutter/material.dart';

class MyMsgBubble extends StatelessWidget {
  const MyMsgBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final esquemaColor = Theme.of(context).colorScheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: esquemaColor.primary,
              borderRadius: BorderRadius.circular(15)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text('Mensaje mío',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}