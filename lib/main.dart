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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final firstChild = Container(
      margin: EdgeInsets.all(4),
      color: Colors.lightGreenAccent, width: MediaQuery
        .of(context)
        .size
        .width, child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("One", textAlign: TextAlign.center),
    ),);
    final secondChild = Container(
      margin: EdgeInsets.all(4),
      color: Colors.redAccent, width: MediaQuery
        .of(context)
        .size
        .width, child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Two", textAlign: TextAlign.center),
    ),);

    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child:
              /*SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: 40,
                          shrinkWrap: true,
                          itemBuilder: (context,index){return  Item(content: "One ${++index}");
                          },
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3
                        ) ,
                      ),
                    ),
                    Container(
                      color: Colors.greenAccent,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 60,
                          shrinkWrap: true,
                          itemBuilder: (context,index){return  Item(content: "Two ${++index}",color: Colors.indigo,);
                          }),
                    )

                  ],

                )
                ,
              )*/

              CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  slivers:<Widget> [
              SliverList(delegate: SliverChildBuilderDelegate(
                  (context, index){
              return Item(content: "Two ${++index}",color: Colors.indigo,);},
                  childCount: 40))
              /*Container(
                    color: Colors.greenAccent,
                    child: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                     return Item(
                        content: "Two ${++index}",
                        color: Colors.indigo,
                      );
                    }, childCount: 40))
                )*/

            ],
          )),
      Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                  ))),
          Expanded(
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                  ))),
        ],
      )
      ],
    ),)
    , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class Item extends StatelessWidget {
  Color? color;
  String content;

  Item({
    super.key,
    required this.content,
    this.color = Colors.deepOrange,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0)
        ),
      ),

      margin: EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content, textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),),
      ),);
  }
}

