import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JackieAgentScreen extends StatefulWidget {
  const JackieAgentScreen({super.key});

  @override
  State<JackieAgentScreen> createState() => _JackieAgentScreenState();
}

class _JackieAgentScreenState extends State<JackieAgentScreen> {
  final List<Map<String, dynamic>> _logs = [
    {
      'type': 'agent',
      'message': 'Bonjour ! Je suis Jackie, votre agent IA. Je suis prête à poster vos vidéos aujourd\'hui.',
      'time': '09:00'
    }
  ];

  bool _isProcessing = false;

  void _triggerAutoPost() async {
    setState(() {
      _logs.add({
        'type': 'user',
        'message': 'Jackie, poste ma dernière vidéo sur tous les réseaux.',
        'time': 'Maintenant'
      });
      _isProcessing = true;
    });

    // Simulation du processus de l'agent
    await Future.delayed(const Duration(seconds: 1));
    _addLog('agent', 'Bien reçu ! Analyse de la vidéo en cours...');
    
    await Future.delayed(const Duration(seconds: 2));
    _addLog('agent', 'Optimisation des descriptions et hashtags pour chaque plateforme...');

    await Future.delayed(const Duration(seconds: 2));
    _addLog('agent', 'Publication sur TikTok... ✅');
    _addLog('agent', 'Publication sur YouTube Shorts... ✅');
    _addLog('agent', 'Publication sur Instagram Reels... ✅');
    _addLog('agent', 'Publication sur Facebook... ✅');
    
    await Future.delayed(const Duration(seconds: 1));
    _addLog('agent', 'Sauvegarde des liens dans Google Sheets... ✅');
    _addLog('agent', 'Sauvegarde du fichier source dans Google Drive... ✅');

    setState(() {
      _isProcessing = false;
      _addLog('agent', 'Terminé ! Votre contenu est en ligne partout. 🚀');
    });
  }

  void _addLog(String type, String message) {
    setState(() {
      _logs.add({
        'type': type,
        'message': message,
        'time': 'Maintenant'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFF6C63FF),
              child: Icon(Icons.smart_toy, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Agent Jackie', style: TextStyle(fontSize: 16)),
                Text('En ligne • Automatique', style: TextStyle(fontSize: 12, color: Colors.greenAccent[400])),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _logs.length,
              itemBuilder: (context, index) {
                final log = _logs[index];
                final isAgent = log['type'] == 'agent';
                return Align(
                  alignment: isAgent ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isAgent ? const Color(0xFF2C2C2C) : const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: isAgent ? Radius.zero : const Radius.circular(12),
                        bottomRight: isAgent ? const Radius.circular(12) : Radius.zero,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          log['message'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          log['time'],
                          style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isProcessing)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1E1E1E),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isProcessing ? null : _triggerAutoPost,
                    icon: const Icon(Icons.rocket_launch),
                    label: const Text("Lancer la publication automatique"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
