import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:shayari/lits.dart';
import 'package:shayari/page4.dart';

class demo5 extends StatefulWidget {
  List myshayri = [];
  int det;

  demo5(this.myshayri, this.det);

  @override
  State<demo5> createState() => _demo5State();
}

class _demo5State extends State<demo5> {
  List shayri1 = [];
  bool t2=false;
  bool d3 = false;
  int d1 = 0;
  int a = 0;
  int b = 0;
  bool p = false;
  List color = [
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.cyanAccent,
    Colors.red,
    Colors.tealAccent,
    Colors.purple,
    Colors.grey,
    Colors.amber,
    Colors.blue,
    Colors.deepOrangeAccent,
  ];
  PageController? controller;


  @override
  void initState() {
    d1 = widget.det;
    controller = PageController(initialPage: d1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await FlutterShare.share(
                    title: 'Example share',
                    text: '${memory.love_shayri}',
                  );
                },
                icon: Icon(Icons.share, color: Colors.white)),
            PopupMenuButton(
              color: Colors.black,
              elevation: 50,
              shape: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  width: 2,
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent,
                    Colors.deepPurpleAccent,
                    Colors.greenAccent
                  ])),
              itemBuilder: (context) => [
                PopupMenuItem(
                  padding: EdgeInsets.fromLTRB(30, 0, 100, 0),
                  child: d3
                      ? Row(children: [
                          Text(
                            "White Color",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "font1",
                                fontWeight: FontWeight.bold),
                          )
                        ])
                      : Row(
                          children: [
                            ColorizeAnimatedTextKit(
                                repeatForever: true,
                                text: ["Gradient Color"],
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "font1",
                                    fontWeight: FontWeight.bold),
                                colors: [
                                  Color(0xFF833ab4),
                                  Color(0xFFfd1d1d),
                                  Color(0xFFfcb045)
                                ])
                          ],
                        ),
                  onTap: () {
                    setState(() {
                      t2=!t2;
                      d3=!d3;
                    });
                  },
                )
              ],
            ),
          ],
          title: ColorizeAnimatedTextKit(
              textAlign: TextAlign.left,
              repeatForever: true,
              speed: Duration(seconds: 1),
              text: ["Love", "Shayari"],
              textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font1"),
              colors: [
                Color(0xFF833ab4),
                Color(0xFFfd1d1d),
                Color(0xFFfcb045)
              ]),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFf2709c), Color(0xFFff9472)])),
          ),
        ),
        backgroundColor: Color(0xFF1A1919),
        body: Column(
          children: [
            Expanded(
                child: Container(
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
                                    itemCount: color.length - 1,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 5,
                                            crossAxisSpacing: 5),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            p = true;
                                            a = index;
                                            b = index + 1;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 100,
                                          child: Text(textAlign: TextAlign.center,
                                            "${widget.myshayri[index]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          width: 100,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            color[index],
                                            color[index+1]
                                          ])),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Image(
                              image: AssetImage(
                                  "image/full-screen-97639_960_720.png"))),
                      Text(
                        "${d1 + 1} / ${widget.myshayri.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.greenAccent),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              p = true;
                              a = Random().nextInt(color.length);
                              b = Random().nextInt(color.length);
                            });
                          },
                          child: Image(image: AssetImage("image/82940.png"))),
                    ]),
              ),
              height: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.black),
            )),
            Expanded(
                flex: 7,
                child: t2?Container(
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        d1 = value;
                      });
                    },
                    itemCount: memory.love_shayri.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: (p == true)
                                ? LinearGradient(colors: [color[a], color[b]])
                                : null,
                            color: (p == false) ? Colors.black : null,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
                        child: ColorizeAnimatedTextKit(isRepeatingAnimation: true,textAlign: TextAlign.center,repeatForever: true,text: ["${widget.myshayri[index]}"], textStyle:TextStyle(
                             fontSize: 40,
                             fontWeight: FontWeight.bold,
                         ), colors: [
                          Color(0xFF12c2e9),
                          Color(0xFFc471ed),
                          Color(0xFFf64f59),])

                      );
                    },
                  ),
                  height: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                ):
                Container(
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        d1 = value;
                      });
                    },
                    itemCount: memory.love_shayri.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: (p == true)
                                ? LinearGradient(colors: [color[a], color[b]])
                                : null,
                            color: (p == false) ? Colors.black : null,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
                        child: Text(
                          textAlign: TextAlign.center,
                          "${widget.myshayri[index]}",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    },
                  ),
                  height: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                )),
            Expanded(
                child: Container(
              child: Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            FlutterClipboard.copy('${widget.myshayri[widget.det]}')
                                .then((value) => print('copied'));
                          },
                          icon:
                              Icon(Icons.copy, color: Colors.white, size: 40)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              d1--;
                            });
                            controller!.jumpToPage(d1);
                          },
                          icon: Icon(Icons.settings_backup_restore_sharp,
                              color: Colors.white, size: 40)),
                      OpenContainer(closedColor: Colors.black,transitionDuration: Duration(seconds: 1),closedBuilder: (context, action) {
                        return InkWell(child: Image(
                          image: AssetImage(
                            "image/edit-icon-hi.png",
                          ),
                          height: 95,
                          width: 95,
                        ));
                      }, openBuilder: (context, action) {
                        return edit(widget.myshayri,widget.det);
                      },),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              d1++;
                            });
                            controller!.jumpToPage(d1);
                          },
                          icon: Icon(Icons.next_plan_outlined,
                              color: Colors.white, size: 40)),
                      IconButton(
                          onPressed: () async {
                            await FlutterShare.share(
                              title: 'Example share',
                              text: '${widget.myshayri[widget.det]}',
                            );
                          },
                          icon:
                              Icon(Icons.share, color: Colors.white, size: 40))
                    ]),
              ),
              height: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.black),
            )),
          ],
        ));
  }
}
