import 'package:cinema_ui/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class Info {
  final String name;
  final String rating;
  final String age;
  final String category;
  final String time;
  final String location;
  final String date;
  final int comments;
  final int tickets;
  final int price;

  Info(
      {required this.name,
      required this.rating,
      required this.age,
      required this.category,
      required this.time,
      required this.location,
      required this.date,
      required this.comments,
      required this.tickets,
      required this.price});
}

List<Info> movieInfo = [
  // Info(name, rating, age, category, time, location, tickets, price)
  Info(
      name: "Black Widow",
      rating: "9.5/10",
      age: "15+",
      category: "Action, Sci-fi",
      time: "2:14",
      location: "sddsv",
      tickets: 500,
      price: 200,
      comments: 1024,
      date: "Oct 20 - 25")
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              _titleWidget(),
              const SizedBox(
                height: 13,
              ),
              _movieStatsRow(),
              SizedBox(
                height: 17,
              ),
              _statsWidgets(),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 380,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text("Movie Poster"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buyBotton()
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buyBotton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            width: 100,
            child: Row(
              children: [
                Icon(Icons.airplane_ticket),
                SizedBox(
                  width: 4,
                ),
                Text("Buy Ticket"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _statsWidgets extends StatelessWidget {
  const _statsWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _statsWidgetsInfo(
          title: movieInfo[0].date,
        ),
        SizedBox(
          width: 20,
        ),
        _statsWidgetsInfo(
          title: movieInfo[0].time,
        ),
        SizedBox(
          width: 20,
        ),
        _statsWidgetsInfo(
          title: movieInfo[0].comments.toString(),
        ),
      ],
    );
  }
}

class _statsWidgetsInfo extends StatelessWidget {
  final String title;

  const _statsWidgetsInfo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _movieStatsRow extends StatelessWidget {
  const _movieStatsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            movieStats(
              name: movieInfo[0].rating,
              icon: true,
              isSelected: true,
            ),
            SizedBox(
              width: 15,
            ),
            movieStats(
              name: movieInfo[0].age,
              icon: false,
              isSelected: false,
            ),
            SizedBox(
              width: 15,
            ),
            movieStats(
              name: movieInfo[0].category,
              icon: false,
              isSelected: false,
            ),
          ],
        )
      ],
    );
  }
}

class movieStats extends StatelessWidget {
  final String name;
  final bool icon;
  final bool isSelected;

  const movieStats(
      {Key? key,
      required this.name,
      required this.icon,
      required this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).focusColor
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            isSelected
                ? BoxShadow(
                    color: Color(0xFFFFFFFF).withOpacity(0.3),
                    offset: Offset(0, 8),
                    blurRadius: 10,
                    spreadRadius: 0.2)
                : BoxShadow(
                    color: Color(0xFFFFFFFF).withOpacity(0.0),
                    offset: Offset(0, 8),
                    blurRadius: 10,
                    spreadRadius: 0.2)
          ]),
      child: Row(
        children: [
          icon
              ? Icon(
                  Icons.star,
                  size: 17,
                )
              : Container(),
          Text(
            name,
            style: TextStyle(
                color:
                    isSelected ? Colors.black : Theme.of(context).focusColor),
          ),
        ],
      ),
    );
  }
}

class _titleWidget extends StatelessWidget {
  const _titleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "Womens Movie Night",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            textStyle: TextStyle(
              fontSize: 15,
              color: Theme.of(context).highlightColor,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          movieInfo[0].name,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            textStyle: TextStyle(
              fontSize: 35,
              color: Theme.of(context).focusColor,
            ),
          ),
        ),
      ],
    );
  }
}
