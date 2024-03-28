import 'package:coffee/notifacationPage.dart';
import 'package:coffee/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                radius: 26,
                backgroundImage: AssetImage(
                  "assets/image/man.jpg",
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            const Icon(
              Icons.location_on_outlined,
              color: Color.fromARGB(
                255,
                146,
                103,
                87,
              ),
              size: 30,
            ),
            const Text(
              "Los Vegas",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifacationPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                grade: 10,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 178, 177, 177),
                    borderRadius: BorderRadius.circular(
                      30,
                    ), // Adjust the radius as needed
                  ),
                  child: IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 350),
                      child: Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          const   Padding(
              padding: EdgeInsets.only(right: 180,),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        const  SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius:BorderRadius.circular(30,) ),
                      child: const Center(
                        child: Text(
                      "Latte",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      
                      ),
                     ),
                      
                    ),
                  ),
                ],
              ),
            ),
            // const  NameOfCoffee(coffee:"Latte",colors: Colors.red,width: 50, height: 25,),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Latte",
    "Cappuccino",
    "Americano",
    "Espresso",
    "Doppio",
    "Black",
    "Cortado",
    "Red Eye",
    "Flat White",
    "Irish",
    "Iced Coffee",
    "Iced Espresso",
    "Cold Brew",
    "Caffee Amercina",
    "Coratado",
    "Liqueur coffee",
    "Frappé",
    "Ice shot",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          size: 26,
        ),
        onPressed: () {
          query = " ";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 26,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var coffee in searchTerms) {
      if (coffee.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(coffee);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
