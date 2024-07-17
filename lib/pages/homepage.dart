import 'package:flutter/material.dart';
import 'package:graphedemo/services/auth_service.dart';
import 'package:graphedemo/services/data_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode searchTextArea = FocusNode();
  String searchterm = '';

  void fetchData(String searchTerm) {
    final dataService = Provider.of<DataService>(context, listen: false);
    dataService.fetchWeatherData(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Graphe Weather"),
              GestureDetector(
                  onTap: () {
                    AuthService().signOut(context);
                  },
                  child: const Icon(Icons.logout))
            ],
          ),
          leading: const Icon(Icons.menu),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          alignment: const AlignmentDirectional(0, -1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width * .9,
                child: TextField(
                  focusNode: searchTextArea,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      searchterm = value;
                    });
                  },
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 83, 13,
                              95), // Change the color to your desired color
                          width: 2.0, // Set the width of the border
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      hintText: "Search for the city",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    debugPrint(searchterm);
                    searchTextArea.unfocus();
                    fetchData(searchterm);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 183, 194, 66),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 40,
                    width: 150,
                    child: const Center(
                      child: Text("Search",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
