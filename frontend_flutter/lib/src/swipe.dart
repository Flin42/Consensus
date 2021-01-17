// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipeScreen extends StatefulWidget {
  @override
  SwipeScreenState createState() => SwipeScreenState();
}

class Movie {
  String name;
  String description;

  Movie(this.name, {this.description});
}

class SwipeScreenState extends State<SwipeScreen>
    with TickerProviderStateMixin {
  List<Movie> movies = [
    Movie("Star Wars"),
    Movie("Shrek"),
    Movie("The Godfather"),
    Movie("Interstellar"),
    Movie("Parasite"),
    Movie("Spirited Away"),
    Movie("The Matrix"),
    Movie("Inception"),
    Movie("Forrest Gump"),
    Movie("The Dark Knight"),
  ];

  List<String> welcomeImages = [
    "../../assets/images/SpongeBob.png",
    "assets/images/SpongeBob.png",
    "assets/images/SpongeBob.png",
    "assets/images/SpongeBob.png",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Join Code: 1234"),
        backgroundColor: Colors.blue[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: new TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: movies.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              // child: Image.asset('${welcomeImages[index]}'),
              child: Container(
                child: Center(
                  child: Text(movies[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      )),
                ),
                color: index % 5 == 0
                    ? Colors.red
                    : index % 5 == 1
                        ? Colors.blue
                        : index % 5 == 2
                            ? Colors.purple
                            : index % 5 == 3
                                ? Colors.orange
                                : Colors.green,
              ),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}
