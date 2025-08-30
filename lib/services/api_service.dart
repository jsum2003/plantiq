import '../models/lote.dart';
import '../data/mock_data.dart'; // Aquí tienes tus datos de prueba

class ApiService {
  // Método estático que devuelve los lotes
  static Future<List<Lote>> getLotes() async {
    // Simulamos un delay como si viniera de una API real
    await Future.delayed(const Duration(seconds: 1));
    return mockLotes; // mockLotes viene de mock_data.dart
  }

  // Nuevo método para devolver lotes con sus riegos
  static Future<List<Lote>> getLotesWithRiegos() async {
    // Simulamos un delay como si viniera de una API real
    await Future.delayed(const Duration(seconds: 1));
    // Asumiendo que mockLotes ya contiene los riegos asociados en la propiedad riegos
    return mockLotes;
  }

  // Método simulado para eliminar riego
  static Future<void> deleteRiego(int riegoId) async {
    // Simulamos delay
    await Future.delayed(const Duration(milliseconds: 500));
    // En tu mockData deberías eliminar el riego de la lista correspondiente
    // Aquí solo se imprime para simulación
    print('Simulación: eliminar riego con id $riegoId');
    // Si manejas mockLotes mutable, elimina el riego así:
    /*
    for (var lote in mockLotes) {
      lote.riegos.removeWhere((r) => r.id == riegoId);
    }
    */
  }

  // Métodos para crear y editar riego puedes agregar aquí cuando los necesites
}
