import 'dart:convert';
import 'dart:ffi';

import 'package:agenda_contactos/models/Contacto.dart';
import 'package:http/http.dart' as http;
class HttpService {
  static final String _URL = "http://172.30.1.21:3000";

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
    } else if (response.statusCode == 400) {
      throw Exception("400");
    } else {
      throw Exception(response.body);
    }
  }

  Future<Map<String, List<String>>> CREATE(String db, Contacto contacto) async {
    final URI = Uri.parse('$_URL/$db/contactos/create');


    final res = await http.post(
      URI,
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'nombre': contacto.nombre,
        'apellidos': contacto.apellidos ?? "",
        'email': contacto.email,
        'telefono': contacto.telefono,
        'direccion': contacto.direccion ?? " , "
      })
    ).timeout(Duration(seconds: 7));

    if (res.statusCode == 201) {

      return {
        'success' : ['Contacto Insertado en tu agenda correctamente']
      };

    } else if (res.statusCode == 400) {
      final Map<String, dynamic> errList = jsonDecode(res.body);

      return {
        'error' : _errorDecode(errList)
      };

    } else {
      throw Exception(res.body);
    }

  }

  Future<int> DELETE(String db, String telefono) async {
    final URI = Uri.parse('$_URL/$db/contactos/delete');
    final response = await http.delete(
      URI,
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'telefono': telefono
      })
    );

    if (response.statusCode == 204) {
      return 204;
    } else if (response.statusCode == 404) {
      return 400;
    } else {
      throw Exception(response.body);
    }
  }

  List<String> _errorDecode(Map<String, dynamic> jsonDecoded) {
    List<String> data = [];
    
    jsonDecoded.forEach((key, value){
      data.add(value.toString());
    });

    return data;
  }


}