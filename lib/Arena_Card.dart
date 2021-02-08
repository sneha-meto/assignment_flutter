import 'package:flutter/material.dart';

class ArenaCard extends StatelessWidget {
  const ArenaCard(
      {@required this.name,
      @required this.img,
      this.open,
      this.close,
      this.slot,
      this.sport,
      this.cost});
  final String name;
  final String img;
  final String open;
  final String close;
  final String slot;
  final String cost;
  final String sport;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            Text('$open' + ' - ' + '$close'),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text("Sport: "),
                Image.network(
                  sport,
                  height: 20,
                ),
              ],
            ),
            Text('\$ ' + '$cost'),
          ]),
        )
      ]),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 2),
          )
        ],
      ),
    );
  }
}
