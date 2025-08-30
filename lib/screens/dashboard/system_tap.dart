import 'package:flutter/material.dart';

class SystemTap extends StatefulWidget {
  @override
  _SystemTapState createState() => _SystemTapState();
}

class _SystemTapState extends State<SystemTap> {
  final TextEditingController nombreCultivoController = TextEditingController();
  final TextEditingController tipoCultivoController = TextEditingController();
  final TextEditingController inicioRiegoController = TextEditingController();
  final TextEditingController duracionRiegoController = TextEditingController();

  int? numeroLotes;
  int? numeroAspersoresPorLote;

  @override
  void dispose() {
    nombreCultivoController.dispose();
    tipoCultivoController.dispose();
    inicioRiegoController.dispose();
    duracionRiegoController.dispose();
    super.dispose();
  }

  void guardarDatos() {
    String nombre = nombreCultivoController.text;
    String tipo = tipoCultivoController.text;
    String inicioRiego = inicioRiegoController.text;
    String duracionRiego = duracionRiegoController.text;

    print('Nombre Cultivo: $nombre');
    print('Tipo de cultivo: $tipo');
    print('Número de lotes: $numeroLotes');
    print('Número de aspersores por lote: $numeroAspersoresPorLote');
    print('Inicio de riego: $inicioRiego');
    print('Duración de riego: $duracionRiego');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos guardados correctamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1F2A),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 124, right: 124 ),
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B2F3A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Registro de Cultivos",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFFE3E3E3),
                                ),
                              ),
                              const SizedBox(height: 17),
                              TextField(
                                controller: nombreCultivoController,
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                cursorColor: Color(0xFFE3E3E3),
                                decoration: InputDecoration(
                                  labelText: "Nombre Cultivo",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.grass, color: Color(0xFFE3E3E3), size: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                ),
                              ),
                              const SizedBox(height: 13),
                              TextField(
                                controller: tipoCultivoController,
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                cursorColor: Color(0xFFE3E3E3),
                                decoration: InputDecoration(
                                  labelText: "Tipo de cultivo",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.eco, color: Color(0xFFE3E3E3), size: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B2F3A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Registro de lotes del cultivos",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE3E3E3),
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 17),
                              DropdownButtonFormField<int>(
                                decoration: InputDecoration(
                                  labelText: "Número de lotes",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: const Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.numbers, color: Color(0xFFE3E3E3), size: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                dropdownColor: const Color(0xFF2B2F3A),
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                items: List.generate(10, (index) => index + 1)
                                    .map((e) => DropdownMenuItem<int>(
                                          value: e,
                                          child: Text(e.toString()),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    numeroLotes = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField<int>(
                                decoration: InputDecoration(
                                  labelText: "Número de apersores por lote",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: const Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.numbers, color: Color(0xFFE3E3E3), size: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                dropdownColor: const Color(0xFF2B2F3A),
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                items: List.generate(10, (index) => index + 1)
                                    .map((e) => DropdownMenuItem<int>(
                                          value: e,
                                          child: Text(e.toString()),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    numeroAspersoresPorLote = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: inicioRiegoController,
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                cursorColor: Color(0xFFE3E3E3),
                                decoration: InputDecoration(
                                  labelText: "Inicio de riego",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.grass, color: Color(0xFFE3E3E3), size: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: duracionRiegoController,
                                style: const TextStyle(color: Color(0xFFE3E3E3)),
                                cursorColor: Color(0xFFE3E3E3),
                                decoration: InputDecoration(
                                  labelText: "Duración de riego",
                                  labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                                  filled: true,
                                  fillColor: Color(0xFF1C1F2A),
                                  prefixIcon: Icon(Icons.grass, color: Color(0xFFE3E3E3), size: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: guardarDatos,
                                child: const Text('Guardar'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
