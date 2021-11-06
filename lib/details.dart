import 'package:dashed_circle/dashed_circle.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
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

class Tickets {
  final int number;
  final bool isSelected;
  final bool isPurchased;

  Tickets(
      {required this.number,
      required this.isSelected,
      required this.isPurchased});
}

List<Info> movieInfo = [
  // Info(name, rating, age, category, time, location, tickets, price)
  Info(
      name: "Black Widow",
      rating: "9.5/10",
      age: "15+",
      category: "Action, Sci-fi",
      time: "2:14",
      location: "Gauteng, Fourways Mall",
      tickets: 500,
      price: 200,
      comments: 1024,
      date: "Oct 20 - 25")
];

List<Tickets> tickets = [
  Tickets(number: 1, isSelected: false, isPurchased: true),
  Tickets(number: 2, isSelected: false, isPurchased: true),
  Tickets(number: 3, isSelected: false, isPurchased: false),
  Tickets(number: 4, isSelected: true, isPurchased: false),
  Tickets(number: 5, isSelected: false, isPurchased: false),
  Tickets(number: 6, isSelected: true, isPurchased: false),
  Tickets(number: 7, isSelected: false, isPurchased: false),
  Tickets(number: 8, isSelected: false, isPurchased: false),
  Tickets(number: 9, isSelected: false, isPurchased: true),
  Tickets(number: 10, isSelected: false, isPurchased: false),
  Tickets(number: 11, isSelected: false, isPurchased: false),
  Tickets(number: 12, isSelected: false, isPurchased: true),
  Tickets(number: 13, isSelected: false, isPurchased: true),
  Tickets(number: 14, isSelected: false, isPurchased: true),
];

class _DetailsPageState extends State<DetailsPage> {
  bool isSelected = false;
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

              _statsWidgets(),
              const SizedBox(
                height: 30,
              ),
              Container(
                // color: Colors.red,
                height: 110,
              ),
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width / 2.5,
                child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(tickets.length, (index) {
                      if (tickets[index].isPurchased) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: DashedCircle(
                            strokeWidth: 0.2,
                            child: Center(
                              child: tickets[index].isSelected
                                  ? Icon(Icons.check)
                                  : Text(
                                      tickets[index].number.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                            color: Colors.grey,
                          ),
                        );
                      }
                      return Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: tickets[index].isSelected
                              ? Colors.white
                              : Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: tickets[index].isSelected
                              ? Icon(Icons.check)
                              : Text(
                                  tickets[index].number.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      );
                    })),
              ),
            ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _statsWidgetsInfo(
          title: movieInfo[0].location,
        ),
        SizedBox(
          width: 20,
        ),
        _statsWidgetsInfo(
          title: movieInfo[0].time,
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
            Icons.location_on,
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            movieInfo[0].name,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              textStyle: TextStyle(
                fontSize: 30,
                color: Theme.of(context).focusColor,
              ),
            ),
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
        ],
      ),
    );
  }
}
