class Aspersor {
  final int id;
  final String nombre;
  final double humedad;
  final double ph;

  Aspersor({
    required this.id,
    required this.nombre,
    required this.humedad,
    required this.ph,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Aspersor && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
