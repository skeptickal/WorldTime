import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    //set background
    String bgImage =
        (data['isDaytime'] ?? true) ? 'daytime.jpeg' : 'nighttime.jpeg';
    Color bgColor = (data['isDaytime'] ?? true) ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Column(children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: const Icon(Icons.edit_location, color: Colors.white),
                label: const Text('edit location',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Montserrat'),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 66.0,
                  fontFamily: 'Montserrat',
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
