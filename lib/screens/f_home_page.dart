import 'package:flutter/material.dart';
import 'package:umang/all_list.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double margin_1 = 25;
  String? selectedCat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 35,
          ),
          textAlign: TextAlign.left,
        ),
        actions: [
          Icon(Icons.search, size: 35),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.account_circle,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(margin_1),
              width: double.infinity,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.amber,
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1618220179428-22790b461013?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80"), fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: margin_1,
                  ),
                  ...mybuttons
                      .map(
                        (e) => Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = e;
                                });
                              },
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCat = null;
                        });
                      },
                      child: Text(
                        "Clear",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...myProducts
                      .map(
                        (e) => (selectedCat != null)
                            ? (e["category"] == selectedCat)
                                ? myContainer(URL: e["URL"], title: e["title"], price: e["price"], color: e["BG"])
                                : Container()
                            : myContainer(URL: e["URL"], title: e["title"], price: e["price"], color: e["BG"]),
                      )
                      .toList()
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: margin_1,
                ),
                Text(
                  "New Arrived",
                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(margin_1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 5,
                    ),
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.green.shade200, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Transform.scale(scale: 0.75, child: Image.asset('lib/assets/chair6.png')),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Green Sofa",
                        style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$ 368",
                        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myContainer({required String URL, required String title, required double price, required Color color}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('detail_page');
      },
      child: Container(
          margin: EdgeInsets.only(bottom: margin_1, left: margin_1, top: margin_1),
          width: 200,
          height: 275,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 0.75,
                    child: Image.asset(URL, fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.all(margin_1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${price.toInt()}",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
