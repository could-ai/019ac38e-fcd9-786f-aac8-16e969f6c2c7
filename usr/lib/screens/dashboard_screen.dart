import 'package:flutter/material.dart';
import '../models/platform_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<SocialPlatform> platforms;

  @override
  void initState() {
    super.initState();
    platforms = getPlatforms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Réseaux'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vue d'ensemble",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Gérez vos connexions pour l'agent Jackie",
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: platforms.length,
                itemBuilder: (context, index) {
                  final platform = platforms[index];
                  return _buildPlatformCard(platform);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformCard(SocialPlatform platform) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          setState(() {
            platform.isConnected = !platform.isConnected;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(platform.isConnected 
                ? '${platform.name} connecté avec succès' 
                : '${platform.name} déconnecté'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                platform.icon,
                size: 40,
                color: platform.color,
              ),
              const SizedBox(height: 12),
              Text(
                platform.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: platform.isConnected ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  platform.isConnected ? 'Connecté' : 'Déconnecté',
                  style: TextStyle(
                    color: platform.isConnected ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
