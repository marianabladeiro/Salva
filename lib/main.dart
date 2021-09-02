import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:secure/settingsPage.dart';
import 'aboutPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Audio audio = Audio.load('assets/police_siren.mp3');
  bool audioFlag = false;

  Position _currentPosition = Position();
  String _currentAddress = '';
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  //function to get current coordinates
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  //TODO get address from coordinates (check if it's needed)
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Salva', style: new TextStyle(fontSize: 33),),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xfffdb9c8),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfffdb9c8),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                    )
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      const Divider(
                        height: 1,
                        thickness: 3,
                        indent: 35,
                        endIndent: 35,
                        color: CupertinoColors.white,
                      ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Padding (
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          'Name',
                          style: new TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                          ),
                        ),
                      ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => settingsPage()));
                          },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(90, 0, 0, 0),

                        child: Icon(
                          Ionicons.settings_outline, size: 35, color: Color(0xffffffff),
                        ),
                        ),
                        ),
                        ],
                  ),
                    ]
                ),
              ),
            ),

            //SOS
            Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                //alignment: Alignment(-0.85, 0),
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffDE3163),
                ),
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 100, height: 100),
                          child: ElevatedButton(
                            child: Text(
                              "SOS",
                              style: new TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: () => {
                              //do something
                              },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Color(0xfffdb9c8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            'Depois de pressionares o botão de SOS, vamos ligar para o número de emergência e enviar'
                                ' uma mensagem com a tua localização aos teus contactos de SOS.',
                            style: new TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                )
            ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //SOUND
                GestureDetector(
                  onTap: () {
                setState(() {
                    if (audioFlag == false) {
                      audio.play();
                      audioFlag = true;
                    }
                    else if (audioFlag == true) {
                      audio.pause();
                      audioFlag = false;
                    }
                });

                  },
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  width: 190,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfffdb9c8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Padding (
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Ionicons.volume_high_outline, size: 45, color: Color(0xffDE3163),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            audioFlag ?
                            'Clica para parar o som de sirene.' :
                            'Clica para emitir o som de sirene.'
                            ,
                            style: new TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  width: 190,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfffdb9c8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Padding (
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Ionicons.pin_outline, size: 45, color: Color(0xffDE3163),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            'Clica para veres sítios perto de ti.',
                            style: new TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),

                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //alignment: Alignment(-0.85, 0),
                  width: 190,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfffdb9c8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Padding (
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Ionicons.locate_outline, size: 45, color: Color(0xffDE3163),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            'Clica para enviares a tua localização.',
                            style: new TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //alignment: Alignment(-0.85, 0),
                  width: 190,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfffdb9c8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Padding (
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Ionicons.camera_outline, size: 45, color: Color(0xffDE3163),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Text(
                            'Clica para começar a gravar.',
                            style: new TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

              ],
            ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //how Salva works
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => aboutPage()));
              },
            child: Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xfffdb9c8),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Text(
                        'Como funciona a aplicação Salva?',
                        style: new TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight:  FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
              ),
            ),
            ),
            ],
          ),
          ],
        ),

      ),

    );
  }


}



