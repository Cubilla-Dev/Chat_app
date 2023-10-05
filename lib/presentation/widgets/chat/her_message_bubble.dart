import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //busca en el contexto el tema
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              //y si pones SECONDARY toma el color global
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImagenBubble(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImagenBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://assetsio.reedpopcdn.com/civil-war-still.jpg?width=1920&height=1920&fit=bounds&quality=80&format=jpg&auto=webp",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        //es cuando se va a construir en
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: const Text('El otro usuario esta mandando una imagen'),
          );
        },
      ),
    );
  }
}
