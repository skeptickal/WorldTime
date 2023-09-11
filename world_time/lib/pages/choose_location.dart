import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    final logger = Logger();
    // simulate a network request for a username
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return 'yoshi';
    });
    // simulate a network request for a bio of username
    String bio = await Future.delayed(const Duration(seconds: 2), () {
      return 'egg collector';
    });
    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: const Text('hello'),
      ),
    );
  }
}
