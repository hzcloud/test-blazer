import 'package:flutter/material.dart';
import 'package:hello_world/newCustomer.dart';
import 'package:hello_world/service.dart';

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  List<dynamic> _customerList = [];
  bool _back = false;

  Widget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCustomerPage())).then((_) {
                  setState(() {
                    _back = true;
                  });
                });
              },
            ),
          ],
        ));
  }

  Widget _listView() {
    return FutureBuilder(
      future: ApiService.getCustomers(),
      builder: (context, snapshot) {
        //print("_customers: ${snapshot.data["status"]}");

        switch (snapshot.connectionState) {
          // Uncompleted State
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          default:
            // Completed with error
            if (snapshot.hasError)
              return Container(child: Text(snapshot.error.toString()));

            // if (snapshot.connectionState == ConnectionState.done) {

            if (snapshot.data != null) {
              _customerList.clear();

              snapshot.data.list.forEach((value) {
                _customerList.add(value);
              });

              // _bookingList = snapshot.data.list;

              return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0.0),
                  scrollDirection: Axis.vertical,
                  primary: true,
                  itemCount: _customerList.length,
                  itemBuilder: (BuildContext content, int index) {
                    print("index : $index");

                    return InkWell(
                        onTap: () {
                          //TODO:
                          print("tap item $index");
                          // Navigator.pushNamed(context, "/booking",
                          //     arguments: booking);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                color: Colors.white),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      "${_customerList[index]["firstName"]} ${_customerList[index]["lastName"]}"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(_customerList[index]["email"]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(_customerList[index]["phoneNumber"]),
                                ])));
                  });
            } else {
              return Container(child: Center(child: Text("No results found")));
            }
        }
      },
    );
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
      appBar: _appBar(),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_listView()],
          ),
        ),
      ),
    );
  }
}
