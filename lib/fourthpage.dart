// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class fourthpage extends StatefulWidget {
  List blanck;
  int index;

  fourthpage(this.blanck, this.index);

  @override
  State<fourthpage> createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {
  List gcolor = [
    Colors.amber,
    Colors.blue,
    Colors.white,
    Colors.black45,
    Colors.black,
    Colors.red,
    Colors.grey,
    Colors.blueAccent,
    Colors.teal,
  ];

  Color gcolors = Colors.grey;
  Color textcolors = Colors.black;
  double textsizee = 20;
  String fonttext = "";
  List Font = ["Schyler", "Schyler1","Schyler2","Schyler3","Schyler4","Schyler5"];

  List Emojis = [
    "😀",
    "😁",
    "😂",
    "🤣",
    "😅",
    "😃",
    "😆",
    "😉",
    "😊",
    "😋",
    "😎",
    "😍",
    "🥰",
    "😗",
    "😙",
    "😚",
    "☺",
    "🙂",
    "🤗",
    "🤩",
    "🤔",
    "🤨",
    "😐",
    "😑",
    "😏",
    "😥",
    "😮",
    "🤐",
    "😯",
    "😫",
    "🥱",
    "😛",
    "😜",
    "🤤",
    "🤑",
    "😖",
    "😤",
    "😢",
    "😭",
    "😦",
    "😨",
    "🤯",
    "😬",
    "😰",
    "😱",
    "🥵",
    "🥶",
    "😳",
    "🤒",
    "🤢",
    "🤮",
    "🤧",
    "😇",
    "🥳",
    "🤠",
    "🤥",
    "🤫",
    "🤭"
  ];

  String emoji = "";
  GlobalKey gp = GlobalKey();
  String folderName = "";

  // ignore: non_constant_identifier_names
  Future<Uint8List> CapturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
          gp.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CapturePng();

    createFolder();
  }

  createFolder() async {
    String folderName = "Shayari app";
    final path = Directory("storage/emulated/0/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
    setState(() {
      folderName = path.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              key: gp,
              child: Card(
                color: gcolors,
                child: Center(
                    child: Text(
                  "$emoji$emoji$emoji\n${widget.blanck[widget.index]}\n$emoji$emoji$emoji",
                  style: TextStyle(
                      color: textcolors,
                      fontSize: textsizee,
                      fontFamily: fonttext),
                )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: Font.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  fonttext = Font[index];
                                });
                              },
                              title: Text(
                                "Shayari",
                                style: TextStyle(fontFamily: Font[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.text_fields,color: Colors.white,size: 18),Text(" Font",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
              InkWell(onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        child: GridView.builder(
                            itemCount: gcolor.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    textcolors = gcolor[index];
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  color: gcolor[index],
                                ),
                              );
                            }),
                      );
                    });
              },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.color_lens_rounded,color: Colors.white,size: 18),Text(" Text Color",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
              InkWell(onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState1) {
                        return Container(
                          height: 200,
                          child: Slider(
                            min: 10,
                            max: 50,
                            value: textsizee,
                            onChanged: (value) {
                              setState1(() {
                                setState(() {
                                  textsizee = value;
                                });
                              });
                            },
                          ),
                        );
                      },
                    );
                    ;
                  },
                );
              },
                child:Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.format_size_outlined,color: Colors.white,size: 18),Text(" Size",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.blueGrey[200],
                      child: GridView.builder(
                        itemCount: gcolor.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                gcolors = gcolor[index];
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              color: gcolor[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.flip_to_back,color: Colors.white,size: 18),Text(" Backgroun",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
              InkWell(onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        child: GridView.builder(
                            itemCount: Emojis.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    emoji = Emojis[index];
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Text(
                                    Emojis[index],
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ),
                              );
                            }),
                      );
                    });
              },
                child:Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.emoji_emotions_outlined,color: Colors.white,size: 18),Text(" Emoji",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
              InkWell(onTap: () {
                Share.share('${widget.blanck[widget.index]}');
              },
                child:Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:[Icon(Icons.share_outlined,color: Colors.white,size: 18),Text(" Share",style:TextStyle(color: Colors.white,fontSize: 11
                      ),)],
                    )),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
