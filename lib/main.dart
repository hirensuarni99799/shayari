import 'package:flutter/material.dart';
import 'package:shayariapp21/Secondpage.dart';

void main() {
  runApp(const MaterialApp(
    home: MyShayariapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyShayariapp extends StatefulWidget {
  const MyShayariapp({Key? key}) : super(key: key);

  @override
  State<MyShayariapp> createState() => _MyShayariappState();
}

class _MyShayariappState extends State<MyShayariapp> {
  List name = [
    "Friendship",
    "Love",
    "Sad",
    "Funny",
    " Romantic",
    "Heart touching",
    "Zindagi",
    "Emotional",
    "Miss you",
    "Good morning",
    "Good night",
    "Alon"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shayari"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Secondpage(index, name);
                },
              ));
            },
            title: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                name[index],
                style: TextStyle(fontSize: 20),
              ),
            ),
            leading: CircleAvatar(
                backgroundImage: AssetImage("image/Image${index + 1}.jpg")),
            trailing: Icon(Icons.keyboard_double_arrow_right),
          );
        },
      ),
    );
  }

}
