import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _wController = TextEditingController();
  final _hController = TextEditingController();
  dynamic height;
  dynamic weight;
  dynamic bmi;
  bool display = false;
  bool loading = false;

  
  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor:Colors.grey[800],
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('BMI CALC'),
        backgroundColor:Colors.grey[900],
        centerTitle:true,
      ),
      
      body: Padding(
        padding:EdgeInsets.symmetric(vertical:20 , horizontal: 20),
        child: Column(
          children: [
            Text('BMI calc'  , textAlign: TextAlign.center , style: TextStyle(color: Colors.white , fontSize: 30 , fontFamily: 'Po'),),
            SizedBox(height: 40,),
            TextField(
             
             controller:  _hController,
             keyboardType: TextInputType.number,
             style: TextStyle(
               fontFamily: 'Po'
             ),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white , width: 2)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey , width: 2)),
                hintText:'Enter a height',

                hintStyle: TextStyle(
                  fontFamily: 'Po'
                )
                
                
              ),
            ),

            SizedBox(height: 30,),
            TextField( controller:  _wController,
            keyboardType: TextInputType.number,
             style: TextStyle(
               fontFamily: 'Po'

             ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white , width: 2)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey , width: 2)),
                 hintText:'Enter a weight',
                 hintStyle: TextStyle(
                   fontFamily: 'Po'
                 )
              ),
            ),
            SizedBox(height: 26,),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                // border: OutlinedBorder(side),
                // border: Border.all(),


              ),
              child: TextButton.icon(
              icon: Icon(Icons.calculate , color: Colors.grey[900],),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
               
                
              ),
              onPressed: (){
                setState(() {
                  height = int.parse(_hController.text);
                  weight = int.parse(_wController.text);
                  bmi =  (height * height ) / weight;
                  display = true;
                  // Future.delayed(Duration(seconds: 2) , (){
                  //   loading = true;
                  // });

                });

              },
              
              label: Text('Calculate' , style: TextStyle(color: Colors.grey[900] , letterSpacing: 2.0 , fontFamily: 'Po'),) ,
             
            ),
            ),
            SizedBox(height: 20,),
            display ?  Text('Your BMI: ${bmi}',  style: TextStyle(color: Colors.white , fontSize: 20 ,fontFamily: 'Pom'  , letterSpacing: 1.2)) : Text('You BMI result goes  here' ,  style: TextStyle(color: Colors.white , fontSize: 20 , fontFamily: 'Po'))
          ],
        ),
      )
    //  This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
