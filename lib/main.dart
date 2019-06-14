import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<State> mykey = GlobalKey<State>();

  bool _isButtonDisable = false;
  bool _isOneRemain = false;
  int _counter = 3;

  @override
  void initState() {
    super.initState();
    _isButtonDisable = false;
    _isOneRemain = false;
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter <= 0) {
        _isButtonDisable = true;
        _isOneRemain = false;
      } else if (_counter == 1) {
        _isOneRemain = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have this many times left:',
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(color: _isOneRemain ? Colors.orange : null),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: mykey,
        onPressed: _isButtonDisable ? null : _decrementCounter,
        tooltip: _isButtonDisable ? 'Locked' : 'Decrement',
        elevation: _isButtonDisable ? 1.0 : null,
        backgroundColor: _isButtonDisable ? Colors.grey : null,
        child: Icon(
          Icons.add,
          color: _isButtonDisable ? Colors.black26 : null,
        ),
      ),
    );
  }
}
