import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

int getRandomNum(int min, int max) => min + Random().nextInt(max - min);

class MyApp extends StatelessWidget {
  List<OrderCardWidget> orderList(int count) {
    List<OrderCardWidget> list = [];
    for (int i = 0; i <= count; i++) {
      list.add(OrderCardWidget());
    }
    return list.isNotEmpty ? list : [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: orderList(5),
          ),
        ),
        // body:
      ),
    );
  }
}

BoxDecoration styles() {
  return BoxDecoration(
    color: Colors.amber[100],
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

class MyWidget extends StatelessWidget {
  final ScrollController verticalController = ScrollController();
  final ScrollController horizontalController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
//             border: Border.all(
//               color: Colors.black,
//               width: 8,
//             ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x77000000),
            offset: Offset(0.1, 0.1),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Заказ №5000',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView.builder(
                itemCount: 2,
                controller: verticalController,
                shrinkWrap: false,
                itemBuilder: (ctx, idx) {
                  return Card(
                    child: ListTile(
                      title: Text('Motivation $idx'),
                      subtitle:
                          const Text('this is a description of the motivation'),
                    ), // ListTile
                  ); // Card
                }, // ItemBuilder
              ), // ListView.builder
            ), // ScrollConfiguration
          ),
          // Container(
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Text('Done'),
          //   ),
          // ),
        ], // children (Column)
      ), // Column
    ); // Container
  }
}

class OrderCardWidget extends StatelessWidget {
  int productCount = getRandomNum(1, 10);

  OrderCardWidget({Key? key}) : super(key: key);

  Widget card(idx) => Container(
        child: Card(
          elevation: 9,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: ListTile(
            dense: false,
            leading: FlutterLogo(),
            title: Text(
              'Card №${++idx}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: const Text(
              "Деструктив: Lego",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.33,
        maxWidth: MediaQuery.of(context).size.width * 0.33,
        // maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title,
          Text('Order #1000'),
          Flexible(
            child: ListView.builder(
              itemCount: productCount,
              itemBuilder: (context, index) => card(index),
              shrinkWrap: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('wwww');
            },
            child: Text('Go'),
          ),
        ],
      ),
    );
  }
}
