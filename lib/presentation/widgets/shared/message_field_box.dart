import 'package:flutter/material.dart';

class MessageFielBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFielBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    //los mismos parametros para dos widget
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    //pase a una varible para asi poder ver mejor el textForField
    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        //los mismos parametros a los dos entonces se pone en una variable
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        //para rellenar el fondo del input
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              //obtenemos el valor ingresado en el input
              final textValue = textController.value.text;
              //y limpiamos
              textController.clear();
              //pasamos lo que escribimos en el input
              onValue(textValue);
            },
            icon: const Icon(Icons.send)));

    return TextFormField(
      //a que cuando ahagamos click afuera el focus se le quitara y para asi esconderse el teclado
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      //le pasamos el focus
      focusNode: focusNode,
      //para recibir los datos
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //para limpiar el input
        textController.clear();
        //a que cuando se limpiar se tiene que quedar el focus ahi en el input
        focusNode.requestFocus();
        //pasamos el valor
        onValue(value);
      },
    );
  }
}
