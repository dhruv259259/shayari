import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:shayari/all_shayri.dart';
import 'package:shayari/lits.dart';

class demo2 extends StatefulWidget {
  int ind;
  demo2(this.ind);


  @override
  State<demo2> createState() => _demo2State();
}

class _demo2State extends State<demo2> {
  List<bool> d = [];
  List shayri=[];
  bool t = false;
  bool t1 = false;


  @override
  void initState() {
    super.initState();
          if(widget.ind==0)
            {
              shayri=memory.love_shayri;
            }
          else if(widget.ind==1)
            {
              shayri=memory.sad_shayri;
            }
          else if(widget.ind==2)
            {
              shayri=memory.romantic_shayri;
            }
          else if(widget.ind==3)
            {
              shayri=memory.Shayari_On_Life_shayri;
            }
          else if(widget.ind==4)
          {
            shayri=memory.Maa_Shayari;
          }
          else if(widget.ind==5)
          {
            shayri=memory.Funny_Shayari;
          }
          else if(widget.ind==6)
          {
            shayri=memory.good_night_shayari;
          }
          else if(widget.ind==7)
          {
            shayri=memory.breakup_shayri;
          }
          else if(widget.ind==8)
          {
            shayri=memory.good_morning_shayri;
          }
          else if(widget.ind==9)
          {
            shayri=memory.judai_shayri;
          }


    d = List.filled(memory.love_shayri.length, false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
              child: t1 ?  Row(
                  children: [
                    Text("White Color",style: TextStyle(color: Colors.white,
                        fontSize: 30, fontFamily: "font1",
                        fontWeight: FontWeight.bold),
                    )
                  ]
              ):Row(
                children: [
                  ColorizeAnimatedTextKit(repeatForever: true,
                      text: ["Gradient Color"],
                      textStyle: TextStyle(
                          fontSize: 30, fontFamily: "font1",
                          fontWeight: FontWeight.bold),
                      colors: [ Color(0xFF833ab4),
                        Color(0xFFfd1d1d),
                        Color(0xFFfcb045)])
                ],
              ) , onTap: () {
              setState(() {
                t = !t;
                t1 = !t1;
              });
            },)
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
    ), backgroundColor: Color(0xFF1A1919),
    body:ListView.builder(itemCount: shayri.length,itemBuilder: (context, index) {
      return OpenContainer(closedColor: Colors.black,transitionDuration: Duration(seconds: 1),closedBuilder: (context, action) {
        return AnimatedSwitcher(reverseDuration: Duration(seconds: 1),duration: Duration(seconds: 1),
          child: t?Card(
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
                    Colors.pinkAccent,
                    Colors.tealAccent,

                  ]),
                  borderRadius: BorderRadius.circular(30)),
              tileColor: (d[index] == true)
                  ? Color(0xFFf2709c)
                  : null,
              title: ColorizeAnimatedTextKit(displayFullTextOnTap:true,speed: Duration(milliseconds: 300),isRepeatingAnimation: true,repeatForever: true,text: [
                "${shayri[index].toString().substring(0,20)}"
              ], textStyle: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font2"),colors:[
                Colors.limeAccent,
                Colors.tealAccent,
                Colors.pinkAccent
              ]),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "${memory.img[widget.ind]}")),
              trailing: (d[index] == true)
                  ? Icon(Icons.navigate_next, color: Colors.black)
                  : Icon(Icons.navigate_next,
                  color: Colors.white),
            ),
          ):
          Card(
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
              title:Text("${memory.emoji[widget.ind]} ${shayri[index].toString().substring(0,20)}",style:TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "font1"),),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "${memory.img[widget.ind]}")),
              trailing: (d[index] == true)
                  ? Icon(Icons.navigate_next, color: Colors.black)
                  : Icon(Icons.navigate_next,
                  color: Colors.white),
            ),
          ),);

      },openBuilder: (context, action) {
        return demo5(shayri,index);
      },);
    },)
      );
  }
}
