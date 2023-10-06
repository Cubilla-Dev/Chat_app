import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImagenBubble(message.imageUrl!),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

//la clase par ala imagen
class _ImagenBubble extends StatelessWidget {
  final String imagenUrl;

  const _ImagenBubble(this.imagenUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imagenUrl,
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
