import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingController = TextEditingController();
  String string;
  List<String> list= ['A1','A2','A3','A4','A5'];


  void add(){
    setState(() {
      string=textEditingController.text;
      list.add(string);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [

            Container(
              width: 200,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'Enter String',
                    labelText: 'Text'
                ),
              ),
            ),
            Text('$string'),
            ElevatedButton(onPressed: add, child: Text('Click me')),
            Expanded(
                child:ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext cxt, int index){
                      return Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.blue,
                          margin: EdgeInsets.all(5),
                          child: Text('${list[index]}',textAlign: TextAlign.center,)
                      );
                    }
                )
            )
          ],
        ),

      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
