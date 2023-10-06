import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //para el scroll que cuando llega un sms nuevo y que vaya hasta ese ss de nuevo
  final ScrollController chatScrollController = ScrollController();
  final GetYesNonswer getYesNonswer = GetYesNonswer();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    //el isEmpty es lo mismo que poner length
    //si no tiene nada el texto viene vacio que no haga nada
    if (text.isEmpty) return;
    // creamos un nuevo mensaje a que cuando se llamada y cuando reciba
    //el valor del texto se agregara a la losta
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    //el endsWith, si termina el texto con el simbolo hacer tal cosa
    if (text.endsWith('?')) {
      herReplay();
    }

    //es para avisarle al provider que cambio alg y que se actualize
    notifyListeners();
    moveScrollToBottom();
  }

  //lo que va a responser la api
  Future<void> herReplay() async {
    final herMessage = await getYesNonswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    //es para que tenga un delay, asi se envia mejor el sms y despues hace el scroll
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //la posicion del scroll
        //y lo que hace es ir al maximo que puede ir el controller
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //el curve seria el tipo de animacion
        curve: Curves.easeOut);
  }
}
