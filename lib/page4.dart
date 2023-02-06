import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bubble_slider/bubble_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shayari/lits.dart';

class edit extends StatefulWidget {
  List shayri = [];
  int del;

  edit(this.shayri, this.del);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  String emo="😀 😃 😄 😁 😆 ";
  List color = [
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.cyanAccent,
    Colors.red,
    Colors.tealAccent,
    Colors.purple,
Color(0xFF123C42),
Color(0xFF1F055D),
Color(0xFFE11179),
Color(0xFFE8CF9A),
Color(0xFFFC5D56),
Color(0xFF888723),
Color(0xFF5E8374),
Color(0xFF5332B0),
Color(0xFF024822),
Color(0xFF480238),
Color(0xFF340248),
Color(0xFFA5B9D0),
Color(0xFFAD8E6B),
Color(0xFFC92533),
    Colors.black26,
    Colors.amber,
    Colors.black,
    Colors.white,
    Colors.redAccent,
    Colors.blue,
    Colors.deepOrangeAccent,
    Colors.teal,
    Colors.cyan,
    Colors.black26,
    Colors.greenAccent,
    Colors.blueAccent,
  ];
  List photos=["image/photos1.jpg",
    "image/photos3.jpg",
    "image/photos4.jpg",
    "image/photos5.jpg",
    "image/photos6.jpg",
    "image/photos7.jpg",
    "image/photos8.jpg",
    "image/photos9.jpg",
    "image/photos10.jpg",
    "image/photos11.jpg",
    "image/photos12.jpg",
    "image/photos13.jpg",
    "image/photos14.jpg",
    "image/photos15.jpg",
    "image/photos16.jpg",
    "image/photos17.jpg",
    "image/photos18.jpg",
    "image/photos19.jpg",
    "image/photos20.jpg",
    "image/photos21.jpg",
    "image/photos22.jpg",
    "image/photos23.jpg",
    "image/wp7501012.webp",

  ];
  String fon="font1";
  bool t = false;
  String emo1="😀 😃 😄 😁 😆 🖊 🖋";
  int a = 0, b = 0, c = 0;
  double slid = 50;
  Color colo = Colors.blueGrey;
  String colo1 = "";
  bool t1 = false;
  Color p=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.share, color: Colors.white)),
        ],
        title: ColorizeAnimatedTextKit(
            textAlign: TextAlign.left,
            repeatForever: true,
            speed: Duration(seconds: 1),
            text: ["Love", "Shayari"],
            textStyle: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "font1"),
            colors: [Color(0xFF833ab4), Color(0xFFfd1d1d), Color(0xFFfcb045)]),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFf2709c), Color(0xFFff9472)])),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "${emo} ${widget.shayri[widget.del]} ${emo1}",
                style: TextStyle(
                    fontSize: slid,
                    fontFamily: fon,
                    fontWeight: FontWeight.bold,
                    //    color:(t1=true)?color[c]:null
                    color: p),
              ),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(colo1)),
                  color: (t == false) ? colo : null,
                  gradient: (t == true)
                      ? LinearGradient(colors: [color[a], color[b]])
                      : null),
            )),
        Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              color: Colors.red,
              child: Column(children: [
                Expanded(
                    child: Container(
                  color: Colors.black,
                  child: Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      child: GridView.builder(
                                        itemCount: color.length - 2,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  t = true;
                                                  a = index;
                                                  b = index + 2;
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                        color[index],
                                                        color[index + 2]
                                                      ])),
                                                  height: 100,
                                                  width: 100));
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Image(
                                  image: AssetImage(
                                      "image/full-screen-97639_960_720.png"))),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  t = true;
                                  a = Random().nextInt(color.length);
                                  b = Random().nextInt(color.length);
                                });
                              },
                              child:
                                  Image(image: AssetImage("image/82940.png"))),
                        ]),
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.black,
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(backgroundColor: Colors.black,
                            context: context,
                            builder: (context) {
                              return Container(
                                child: GridView.builder(
                                  itemCount: memory.photos.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            t = true;
                                            colo1 = memory.photos[index];
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      memory.photos[index]))),
                                        ));
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Background",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: GridView.builder(itemCount: color.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 7,
                                            mainAxisSpacing: 4,
                                            crossAxisSpacing: 4),
                                    itemBuilder: (context, index) {
                                      return InkWell(onTap: () {
                                        setState(() {
                                          p=color[index];
                                        });
                                        Navigator.pop(context);
                                      },child: Container(height: 20,width: 20,color: color[index],));
                                    },),
                              );
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Text Color",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await FlutterShare.share(
                            title: 'Example share',
                            text: '${memory.love_shayri[widget.del]}',
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Share",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  )),
                )),
                Expanded(
                    child: Container(
                  color: Colors.black,
                  child: Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: () {
                        showModalBottomSheet(context: context, builder: (context) {
                          return Container(child: GridView.builder(itemCount: memory.font.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
                            return InkWell(onTap:() {
                                      setState(() {
                                        fon=memory.font[index];
                                      });
                                      Navigator.pop(context);
                            },child: Container(color: Colors.black,alignment: Alignment.center,child: Text("shayari",style: TextStyle(color: Colors.white,fontSize: 40,fontFamily: memory.font[index]),),));
                          },),);
                        },);
                      },
                        child: Container(

                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Font",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      InkWell(onTap: () {
                        showModalBottomSheet(context: context, builder:(context) {
                          return Container(child: GridView.builder(itemCount: memory.emoji_1.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context, index) {
                            return InkWell(onTap: () {
                            setState(() {
                              emo=memory.emoji_1[index];
                              emo1=memory.emoji_1[index];
                            });
                            Navigator.pop(context);
                            },child: Container(color: Colors.white,alignment: Alignment.center,child: Text("${memory.emoji_1[index]}",style: TextStyle(fontSize: 45),),));
                          },),);
                        },);
                      },
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Emoji",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 50,
                            shape: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(9)),
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setS) {
                                  return BubbleSlider(
                                    onChangeEnd: (value) {},
                                    min: 0,
                                    max: 100,
                                    bubblesSpeed: BubbleSpeed.slow,
                                    color: Colors.greenAccent,
                                    bubbleSize: BubbleSize.medium,
                                    isBubbleVisible: true,
                                    onChanged: (value) {
                                      setS(() {
                                        slid = value;
                                        setState(() {});

                                      });

                                    },
                                    value: slid,
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 41,
                          width: 100,
                          child: Text(
                            "Text Size",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  )),
                )),
              ]),
            )),
      ]),
    );
  }
}
