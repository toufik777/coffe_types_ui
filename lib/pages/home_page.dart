import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_ui/util/coffe_tiles.dart';
import 'package:wallet_ui/util/coffe_type.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffe types
  final List coffeTypes = [
    //[coffe type , status]
    [
      'cappucino',
      true,
    ],
    [
      'latte',
      false,
    ],
    [
      'black',
      false,
    ],
    [
      'tea',
      false,
    ]
  ];
  //user selected coffe type
  void coffeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeTypes.length; i++) {
        coffeTypes[i][1] = false;
      }
      coffeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ]),
        body: Column(
          children: [
            //find the best coffe for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Find the best coffe for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 60,
                ),
              ),
            ),
            SizedBox(height: 25),
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefix: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  hintText: 'Find your coffe..',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            //horizontal listview of coffe items
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeTypes.length,
                    itemBuilder: ((context, index) {
                      return CoffeType(
                        coffeType: coffeTypes[index][0],
                        isSelected: coffeTypes[index][1],
                        onTap: () {
                          coffeTypeSelected(index);
                        },
                      );
                    }))),
            //horizontal listview of coffe tiles
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeTile(
                    coffeImagePath: 'lib/images/coffeone.jpg',
                    coffeName: 'latte',
                    CoffePrice: '4.00',
                  ),
                  CoffeTile(
                    coffeImagePath: 'lib/images/coffeeTable2.jpg',
                    coffeName: 'black',
                    CoffePrice: '4.00',
                  ),
                  CoffeTile(
                    coffeImagePath: 'lib/images/beautifulcoffe.png',
                    coffeName: 'cappucino',
                    CoffePrice: '4.00',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
