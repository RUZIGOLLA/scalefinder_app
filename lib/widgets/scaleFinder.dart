import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scalefinderapp/objects/accords.dart';
import 'package:scalefinderapp/objects/appData.dart';
import 'package:scalefinderapp/objects/gammeclass.dart';
import 'package:scalefinderapp/objects/noteclass.dart';

import '../main.dart';

Widget scaleFinder () {

}

class ScaleFinder extends StatefulWidget {
  ScaleFinder({Key key, this.title, this.appData}) : super(key: key);
  final String title;
  final AppData appData;
  @override
  _ScaleFinderState createState() => _ScaleFinderState();
}

class _ScaleFinderState extends State<ScaleFinder> {
  Widget buildNoteSelectionBar(Note note, isMode, {isSelectionnable = true}) {
    return Container(
        height: 80,
        width: 80,

        child:
        GestureDetector(
            onTap: () {
              setState(() {
                if (isSelectionnable) {
                  if (!isMode) {
                    widget.appData.selectedNote = note;
                  } else {
                    widget.appData.selectedMode = widget.appData.modes.firstWhere((element) => element.note == note);
                  }
                  widget.appData.selectedGamme = gamme('${widget.appData.selectedNote.libelle} ${widget.appData.selectedMode.libelle}', widget.appData.selectedNote, widget.appData.selectedMode, widget.appData.gammeChromatique);
                }
              }
              );
            },
            child:
            Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                margin: EdgeInsets.all(20),
                child: Center(child: Text(note.libelle))
            )));
  }
  List<bool> _selections = List.generate(
      2, (_) => false);
  @override
  void initState() {

    super.initState();
    setState(() {
      _selections[0] = true;
    });
  }
Widget idkWiget2(Widget child ) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 15),
        child: Container(
          width: double.infinity,
          height: 80,

          child: Card(
              color: Colors.brown[100],

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), topRight: Radius.circular(50))
              ),
              elevation: 10,
              shadowColor: Colors.brown[900],
              child: child
          ),
        ));
  }
Widget idkWiget(Widget child ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15),
      child: Container(
        width: double.infinity,
        height: 80,

        child: Card(
          color: Colors.brown[100],

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))
          ),
          elevation: 10,
          shadowColor: Colors.brown[900],
          child: child
      ),
    ));
  }
Widget displayChordWidget(Accords accord) {
    return Container(
      width: 300,
      height: 60,
      child: Card(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Center(
              child: Text(accord.listeDeNote[0].libelle + ' ${accord.mode}', style: TextStyle(color: Colors.brown[800], fontWeight: FontWeight.w500)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: accord.listeDeNote.map((l) => Text(l.libelle, style: TextStyle(color: Colors.brown[700], fontWeight: FontWeight.w200),),).toList(),
            )

          ],
        ),
        shadowColor: Colors.brown[200],
      ),
    );
}
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('Scale finder'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.brown,
                    Colors.brown[200]
                  ])
          ),
        ),
      ),
      body:   Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
             Colors.white,
              Colors.brown[100],
            ],
          )
      ),
      child: ListView(
          children: [
            ToggleButtons(
              children: [
                Icon(Icons.one_k_plus),
                Icon(Icons.two_k),

              ],
              selectedColor: Colors.blue[200],
              fillColor: Colors.red,
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {

                  _selections[index] = !_selections[index];
                });
              },
            ),
          idkWiget(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.appData.gammeChromatique.map((e)
              {
                if (e.ton < 6)
                  return buildNoteSelectionBar(e, false);
                return Container();
              }).toList(),
            ),
          ),),

            idkWiget2(SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.appData.modes.map((e)
                {
                  if (e.note.ton < 6)
                    return buildNoteSelectionBar(e.note, true);
                  return Container();
                }).toList(),
              ),
            ),),
            SizedBox(width: 20, height: 20,),
            Container(
              width: double.infinity,
              height: 478,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.brown[200],
                      Colors.white,
                    ],
                  )
              ),
              child:
                SingleChildScrollView(
                  child:   Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:

                        Column(
                          children: [
                            Text(widget.appData.selectedGamme.libelle, style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 20),)
                            ,
                            Text(' ${widget.appData.selectedMode.secondLibelle}', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 12),),
                            SizedBox(height: 15),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: widget.appData.selectedGamme.notes.map((note) => Text(note.libelle,  style: TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, fontSize: 10))).toList())
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(

                          children:
                          widget.appData.selectedGamme.accords.map((accord) => displayChordWidget(accord)).toList(),


                        ),
                      )


                    ],

                  ),
                )


            )
        ],
      ),
    ));
  }
}


// Container(
//              width: 100,
//              height: 698,
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topRight,
//                    end: Alignment.bottomLeft,
//                    colors: [
//                      Colors.brown[100],
//                      Colors.white,
//                    ],
//                  )
//              ),
//              child:
//              SingleChildScrollView(
//                child: Column(
//                  children: widget.appData.gammeChromatique.map((e)
//                  {
//                    if (e.ton < 6)
//                      return buildNoteSelectionBar(e, false);
//                    return Container();
//                  }).toList(),
//                ),
//              )
//          ),
//          Container(
//              height: 1000,
//              width: 262,
//              alignment: Alignment.topCenter,
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topRight,
//                    end: Alignment.bottomLeft,
//                    colors: [
//                      Colors.brown[100],
//                      Colors.white,
//                    ],
//                  )
//              ),
//              child:
//              Column(
//                //color: Colors.brown,
//                  children: [
//                    SingleChildScrollView(
//                      scrollDirection: Axis.horizontal,
//
//                      child: Row(
//
//                        children: widget.appData.modes.map((e) => buildNoteSelectionBar(e.note, true)).toList(),
//                      ),
//                    ),
//                    Center(
//
//                        child: Container(
//                          width: 150,
//                          height: 80,
//
//                          child: Card(
//                              color: Colors.red[500],
//                              shadowColor: Colors.black,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(20)
//                              ),
//                              margin: EdgeInsets.all(20),
//                              child :
//                              Center(child: Text('${widget.appData.selectedGamme.libelle}'),
//                              )),
//                        )),
//                    Container(
//                        color: Colors.brown[0],
//                        alignment: Alignment.topCenter,
//
//                        child: Wrap(
//                          children: widget.appData.selectedGamme.notes.map((e) =>
//                              buildNoteSelectionBar(e, false, isSelectionnable: false)
//                          ).toList(),
//                        )
//                    ),
//                  ]
//              )
//          ),
//
//
//
//