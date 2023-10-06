import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String messageText;

  const MyMessageBubble({
    Key? key,
    required this.messageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //busca en el contexto el tema
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              //y si pones PRIMARY toma el color global
              color: colors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              messageText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
