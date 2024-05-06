import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_hive/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Methods to handle the data
  final _myBox = Hive.box<User>("myBox");

  void _writeData() {
    _myBox.put(
      1,
      User(
        name: "Rafe",
        age: 18,
      ),
    );
  }

  void _readData() {
    debugPrint(_myBox.get(1).toString());
  }

  void _deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _writeData,
              child: const Text("Write"),
            ),
            const SizedBox(width: 10),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: _readData,
              child: const Text("Read"),
            ),
            const SizedBox(width: 10),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: _deleteData,
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
