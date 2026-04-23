class Contacto {
  String id;
  String nombre;
  String? apellidos;
  String email;
  String telefono;
  String? direccion;

  Contacto({
    required this.id,
    required this.nombre,
    this.apellidos,
    required this.email,
    required this.telefono,
    this.direccion
  });

  factory Contacto.fromJson(Map<String, dynamic> json) {
    return Contacto(
      id: json['id'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      email: json['email'],
      telefono: json['telefono'],
      direccion: json['direccion']
    );
  }
}