import 'package:assignmentapp/Arena_Card.dart';
import 'package:flutter/material.dart';
import 'package:assignmentapp/Arena_Model.dart';
import 'package:assignmentapp/Services.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    print(getAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Arenas"),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          child: FutureBuilder<List<Arena>>(
              future: getAllPosts(),
              builder: (context, AsyncSnapshot snapshot) {
//                print(name);

                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }

                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ArenaCard(
                            name: snapshot.data[index].name,
                            img: snapshot.data[index].images != null
                                ? snapshot.data[index].images[0]
                                : 'https://static.vecteezy.com/system/resources/previews/000/420/202/non_2x/people-doing-sports-on-world-health-day-vector-illustration.jpg',
                            open: snapshot.data[index].openTime,
                            close: snapshot.data[index].closeTime,
                            slot: snapshot.data[index].slotTimeSize.toString(),
                            cost: snapshot.data[index].costPerSlot.toString(),
                            sport: snapshot.data[index].sports.iconBlackUrl,
                          ),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
//Text('${snapshot.data[index].name}')
