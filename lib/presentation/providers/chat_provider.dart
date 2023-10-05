import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // TODO: implementar metodo
    // creamos un nuevo mensaje a que cuando se llamada y cuando reciba
    //el valor del texto se agregara a la losta
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    //es para avisarle al provider que cambio alg y que se actualize
    notifyListeners();
  }
}
