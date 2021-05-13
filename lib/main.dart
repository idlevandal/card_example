import 'package:card_design/color_filters.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Example'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          buildBasicCard(),
          SizedBox(height: 15.0,),
          buildImageCard(),
        ],
      )
    );
  }
  Widget buildBasicCard() => Card(
    clipBehavior: Clip.antiAlias,
    shadowColor: Colors.black12,
    elevation: 8,
    // color: Color(0xFF222222),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2A2A2A), Color(0xFF222222)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WordOfTheDayWidget(
            splitWords: ['be', 'nev', 'o', 'lent'],
            definition: 'well meaning and kindly.',
            type: 'adjective',
            example: 'a benevolent smile',
          ),
          TextButton(
              child: Text('Learn More'),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
  Widget buildImageCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: NetworkImage(
            'https://homepages.cae.wisc.edu/~ece533/images/girl.png'
          ),
          colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {},
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'Card With Splash',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0
          ),
        )
      ],
    ),
  );
}

class WordOfTheDayWidget extends StatelessWidget {
  final List<String> splitWords;
  final String definition;
  final String type;
  final String example;

  WordOfTheDayWidget({@required this.splitWords, @required this.definition, @required this.type, @required this.example});
  @override
  Widget build(BuildContext context) {
    final bullet = ' \u2022 ';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Word of the Day',
          style: TextStyle(fontSize: 22.0, color: Colors.white54),
        ),
        SizedBox(height: 12.0,),
        Text(
          splitWords.join(bullet),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1
          ),
        ),
        SizedBox(height: 12.0,),
        Text(
          type,
          style: TextStyle(fontSize: 20.0, color: Colors.white54),
        ),
        SizedBox(height: 8.0,),
        Text(
          definition,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        SizedBox(height: 8.0,),
        Text(
          example,
          style: TextStyle(fontSize: 20.0, color: Colors.white70),
        ),
      ],
    );
  }
}


