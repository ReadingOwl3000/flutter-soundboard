import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Totally useful soundboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Totally useful soundboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _assetsAudioPlayer = AssetsAudioPlayer();

  void _playSound(String soundname) {
    _assetsAudioPlayer.open(Audio("raw/" + soundname));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        children: [
          ElevatedButton(
            child: const Text('Sad Trombone'),
            // TODO: soundname anpassen
            onPressed: () {
              _playSound("sadtromboneogg");
            },
          ),
          ElevatedButton(
            child: const Text('Long Fanfare'),
            // TODO: soundname anpassen
            onPressed: () {
              _playSound("fanfarelong");
            },
          ),
          ElevatedButton(
            child: const Text('Short Fanfare'),
            // TODO: soundname anpassen
            onPressed: () {
              _playSound("fanfareshort");
            },
          ),
        ],
      ),
    );
  }
}
