import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scalefinderapp/objects/appData.dart';
import 'package:scalefinderapp/objects/gammeclass.dart';
import 'package:scalefinderapp/objects/noteclass.dart';
import 'package:scalefinderapp/utilFunctions/noteManagement.dart';
import 'package:scalefinderapp/widgets/scaleFinder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppData appData = constructAppDatas();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Scale finder', appData: appData),
    );
  }
}

AppData constructAppDatas() {
   AppData appData = AppData();
   appData.gammeChromatique = createListNote();
   appData.modes = createListMode(appData.gammeChromatique);
   appData.selectedNote = appData.gammeChromatique.firstWhere((element) => element.libelle == 'C');
   appData.selectedMode = appData.modes.firstWhere((element) => element.note == appData.selectedNote);
   appData.selectedGamme = gamme('${appData.selectedNote.libelle} ${appData.selectedMode.libelle}', appData.selectedNote, appData.selectedMode, appData.gammeChromatique);
   return appData;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.appData}) : super(key: key);
  final String title;
  final AppData appData;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    super.initState();
  }



  Widget centerSectionWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Container(
        width: double.infinity,
        height: 350,

        child : Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.brown[100],

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          shadowColor: Colors.brown[900],
        ),
      ),

    );
  }
  Widget cardSectionWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),

      child: Container(
        width: double.infinity,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 115,
              height: 115,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new ScaleFinder(title: 'allo', appData: widget.appData),
                      ));
                },
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.brown[100],

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    shadowColor: Colors.brown[900],

                    margin: EdgeInsets.all(15),
                    child: Center(child: Text('Scale finder', style: TextStyle(),))
                ),
              )
            ),
            Container(
              width: 115,
              height: 115,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                  shadowColor: Colors.brown[900],
                  color: Colors.brown[100],

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                margin: EdgeInsets.all(15),
                  child: Center(child: Text('Rythm finder', style: TextStyle(),))

              ),
            ),
            Container(
              width: 115,
              height: 115,
              child: Card(
                color: Colors.brown[100],
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shadowColor: Colors.brown[900],
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                margin: EdgeInsets.all(15),
                  child: Center(child: Text('locked'
                      '', style: TextStyle(),))

              ),
            ),
          ],
        )
      ),
    );
  }
  Widget idkWiget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15),
      child: Container(
        width: double.infinity,
        height: 75,

        child: Card(
          color: Colors.brown[100],

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))
          ),
          elevation: 10,
          shadowColor: Colors.brown[900],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),

      appBar: AppBar(

          centerTitle: true,
          title: Text(widget.title),
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
      body:  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.brown[100],
                  Colors.white,
                ],
              )
          ),
        child: Column(
          children: [

            idkWiget(),
            cardSectionWidget(),
            centerSectionWidget()
            //
            //
            //
            //
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomGamme();
        },
        child: Icon(Icons.access_time),
        backgroundColor: Colors.brown[400],
      ),
        );

  }

  void randomGamme() {
        var rng = new Random();
        setState(() {


        widget.appData.selectedNote = widget.appData.gammeChromatique[rng.nextInt(12)];
        widget.appData.selectedMode = widget.appData.modes[rng.nextInt(7)];
        widget.appData.selectedGamme = gamme('${widget.appData.selectedNote.libelle} ${widget.appData.selectedMode.libelle}', widget.appData.selectedNote, widget.appData.selectedMode, widget.appData.gammeChromatique);
        });
        }
}
