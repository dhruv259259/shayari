import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:lottie/lottie.dart';
import 'package:shayari/lits.dart';
import 'next_page.dart';

void main() {
  runApp(MaterialApp(
    home: animated(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}
class animated extends StatelessWidget {
  const animated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(nextScreen: shayri(), splash: Lottie.asset("image/85361-shagririm (2).json",repeat: true,reverse: true,addRepaintBoundary: true),splashIconSize: 250,duration: 3000,backgroundColor: Color(
        0xFFE78DE0),splashTransition: SplashTransition.sizeTransition,animationDuration: Duration(seconds: 3),);
  }
}


class shayri extends StatefulWidget {
  const shayri({Key? key}) : super(key: key);

  @override
  State<shayri> createState() => _shayriState();
}

class _shayriState extends State<shayri> {
  List<bool> d = [];
  bool t = false;
  bool t1 = false;

  @override
  void initState() {
    super.initState();
    d = List.filled(memory.s.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
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
                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    padding: EdgeInsets.fromLTRB(30, 0, 100, 0),
                    child: t1 ? Row(
                      children: [
                        ColorizeAnimatedTextKit(repeatForever: true,
                            text: ["English"],
                            textStyle: TextStyle(
                                fontSize: 37, fontFamily: "font1",
                                fontWeight: FontWeight.bold),
                            colors: [
                              Color(0xFF833ab4),
                              Color(0xFFfd1d1d),
                              Color(0xFFfcb045)])
                      ],
                    ) : Row(
                        children: [
                          ColorizeAnimatedTextKit(repeatForever: true,
                              text: ["hindi"],
                              textStyle: TextStyle(
                                  fontSize: 40, fontFamily: "font1",
                                  fontWeight: FontWeight.bold),
                              colors: [ Color(0xFF833ab4),
                                Color(0xFFfd1d1d),
                                Color(0xFFfcb045)])
                        ]
                    ), onTap: () {
                    setState(() {
                      t = !t;
                      t1 = !t1;
                    });
                  },),
                  PopupMenuItem(
                    padding: EdgeInsets.fromLTRB(20, 0, 100, 0),
                    child: t1 ? Row(
                      children: [
                        ColorizeAnimatedTextKit(repeatForever: true,
                            text: ["Setting"],
                            textStyle: TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.bold),
                            colors: [
                              Color(0xFF833ab4),
                              Color(0xFFfd1d1d),
                              Color(0xFFfcb045)])
                      ],
                    ) : Row(
                        children: [
                          ColorizeAnimatedTextKit(repeatForever: true,
                              text: ["Setting"],
                              textStyle: TextStyle(
                                  fontSize: 35,fontFamily: "font7",
                                  fontWeight: FontWeight.bold),
                              colors: [ Color(0xFF833ab4),
                                Color(0xFFfd1d1d),
                                Color(0xFFfcb045)])
                        ]
                    ), onTap: () {
                    setState(() {
                      t = !t;
                      t1 = !t1;
                    });
                  },),
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
          body: AnimatedSwitcher(duration: Duration(seconds: 1),
              child: t ?
              ListView.builder(
                itemCount: memory.hindi.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapCancel: () {
                      print("on tap cancel");
                      setState(() {
                        d[index] = false;
                      });
                    },
                    onTapDown: (details) {
                      print("on tap down");
                      setState(() {
                        d[index] = true;
                      });
                    },
                    onTapUp: (details) {
                      print("on tap up");
                      setState(() {
                        d[index] = false;
                      });
                    },
                    child:InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return demo2(index);
                      },));
                    },
                      child: Card(
                        color: Color(0xFF1A1919),
                        margin: EdgeInsets.all(20),
                        shape: GradientOutlineInputBorder(
                            width: 2,
                            gradient: LinearGradient(colors: [
                              Colors.cyanAccent,
                              Colors.deepPurpleAccent,
                              Colors.greenAccent
                            ]),
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          shape: GradientOutlineInputBorder(
                              gradient: LinearGradient(colors: [
                                Colors.cyanAccent,
                                Colors.deepPurpleAccent,
                                Colors.greenAccent
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          tileColor: (d[index] == true)
                              ? Color(0xFFf2709c)
                              : null,
                          title: ColorizeAnimatedTextKit(
                              repeatForever: true,
                              speed: Duration(seconds: 1),
                              colors: [
                                Color(0xFF12c2e9),
                                Color(0xFFc471ed),
                                Color(0xFFf64f59),
                              ],
                              text: ["${memory.hindi[index]}"],
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "font1")),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "${memory.img[index]}")),
                          trailing: (d[index] == true)
                              ? Icon(Icons.navigate_next, color: Colors.black)
                              : Icon(Icons.navigate_next,
                              color: Colors.white),
                        ),
                      ),
                    )

                  );
                },
              )
                  : ListView.builder(
                itemCount: memory.s.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTapCancel: () {
                      print("on tap cancel");
                      setState(() {
                        d[index] = false;
                      });
                    },
                    onTapDown: (details) {
                      print("on tap down");
                      setState(() {
                        d[index] = true;
                      });
                    },
                    onTapUp: (details) {
                      print("on tap up");
                      setState(() {
                        d[index] = false;
                      });
                    },
                    child: OpenContainer(
                      transitionDuration: Duration(seconds: 1),
                      closedColor: Color(0xFF1A1919),
                      closedBuilder: (context, action) {
                        return Card(
                          color: Color(0xFF1A1919),
                          margin: EdgeInsets.all(20),
                          shape: GradientOutlineInputBorder(
                              width: 2,
                              gradient: LinearGradient(colors: [
                                Colors.cyanAccent,
                                Colors.deepPurpleAccent,
                                Colors.greenAccent
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            shape: GradientOutlineInputBorder(
                                gradient: LinearGradient(colors: [
                                  Colors.cyanAccent,
                                  Colors.deepPurpleAccent,
                                  Colors.greenAccent
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            tileColor: (d[index] == true)
                                ? Color(0xFFf2709c)
                                : null,
                            title: ColorizeAnimatedTextKit(
                                repeatForever: true,
                                speed: Duration(seconds: 1),
                                colors: [
                                  Color(0xFF12c2e9),
                                  Color(0xFFc471ed),
                                  Color(0xFFf64f59),
                                ],
                                text: ["${memory.s[index]}"],
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "font1")),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "${memory.img[index]}")),
                            trailing: (d[index] == true)
                                ? Icon(Icons.navigate_next, color: Colors.black)
                                : Icon(Icons.navigate_next,
                                color: Colors.white),
                          ),
                        );
                      },
                      openBuilder: (context, action) {
                        return demo2(index);
                      },
                    ),
                  );
                },
              )
          ));
  }

}