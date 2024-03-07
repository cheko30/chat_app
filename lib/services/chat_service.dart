
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/enviroment.dart';

class ChatService with ChangeNotifier {
  Usuario? usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async {

    final apiUrl = Uri.parse('${Enviroment.apiUrl}/mensajes/$usuarioId');
    final resp = await http.get(apiUrl, 
      headers: {
        'Content-Type': 'application/json', 
        'x-token': await AuthService.getToken() ?? '',
      }
    );

    final mensajesResp = mensajeResponseFromJson(resp.body);
    return mensajesResp.mensajes;

  }

}