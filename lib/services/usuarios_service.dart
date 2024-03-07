import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/usuario.dart';

class UsuarioService {
  Future<List<Usuario>> getUsuarios() async  {
    try {

      final apiUrl = Uri.parse('${Enviroment.apiUrl}/usuarios');
      final resp = await http.get(
        apiUrl, 
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken() ?? '',
        }
      );

      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;

    } catch(e) {
      return [];
    }
  }
}