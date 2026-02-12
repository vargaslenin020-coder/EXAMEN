import 'package:flutter/material.dart';

void main() {
  runApp(const MiClimaApp());
}

class MiClimaApp extends StatelessWidget {
  const MiClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Clima Simulado',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaPrincipal(),
    );
  }
}

// --- PANTALLA PRINCIPAL ---
class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(title: const Text('Clima Hoy')),
      body: Center(
        // Column: Organiza widgets verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text: Muestra el nombre de la ciudad
            const Text(
              'QUITO',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Espaciador
            // Icon: Representa el estado del clima
            const Icon(Icons.wb_sunny, size: 100, color: Colors.orange),
            const SizedBox(height: 10),
            // Text: Temperatura simulada
            const Text(
              '25°C',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 40),
            // ElevatedButton: Navega a la siguiente pantalla
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PantallaDetalles()),
                );
              },
              child: const Text('Ver Detalles'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PANTALLA DE DETALLES ---
class PantallaDetalles extends StatelessWidget {
  const PantallaDetalles({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de pronóstico simulado
    final pronostico = [
      {'dia': 'Mañana', 'temp': '22°C', 'icon': Icons.cloud},
      {'dia': 'Miércoles', 'temp': '24°C', 'icon': Icons.wb_sunny},
      {'dia': 'Jueves', 'temp': '19°C', 'icon': Icons.umbrella},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Clima')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard('Humedad', '65%', Icons.water_drop),
                _buildInfoCard('Viento', '15 km/h', Icons.air),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Pronóstico Semanal', style: TextStyle(fontSize: 20, fontWeight  : FontWeight.bold)),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: pronostico.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(pronostico[index]['icon'] as IconData),
                    title: Text(pronostico[index]['dia'].toString()),
                    trailing: Text(pronostico[index]['temp'].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para no repetir código en la fila de detalles
  Widget _buildInfoCard(String titulo, String valor, IconData icono) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Icon(icono, color: Colors.blue),
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(valor),
        ],
      ),
    );
  }
}