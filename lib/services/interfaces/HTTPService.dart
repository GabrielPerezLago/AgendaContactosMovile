import 'dart:convert';

import 'package:agenda_contactos/models/Contacto.dart';
import 'package:http/http.dart' as http;
class HttpService {
  static final String _URL = "http://localhost:3000/";


  Future<List<Contacto>> GET(String db) async {
    final URI = Uri.parse('$_URL/$db/contactos');

    final response = await http.get(
      URI,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }
    ).timeout(Duration(seconds: 7));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((contacto) => Contacto.fromJson(contacto)).toList();
    } else {
      throw Exception("400");
    }
  }

}