import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/getData.dart';

import '../controller/provider.dart';
import 'home_page.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.2, 0.85],
                colors: [
                  Color(0xff955cd1),
                  Color(0xff3fa2fa),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search your city\'s weather',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white70),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                    ),
                    Center(
                      child: TextFormField(
                        onFieldSubmitted: (value) async {
                          if (formKey.currentState!.validate()) {
                            WeatherData weatherData = WeatherData();
                            var weather = await weatherData
                                .getData(searchController.text);

                            weather.fold((l) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(l),
                              ));
                            }, (r) {
                              Provider.of<ProviderWeather>(context,
                                      listen: false)
                                  .weatherData = r;
                              Provider.of<ProviderWeather>(context,
                                      listen: false)
                                  .cityName = searchController.text;

                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ));
                            });
                          }
                        },
                        controller: searchController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a city';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: (const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.black,
                            )),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            hintText: 'Enter a  city',
                            label: const Text('Search'),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            labelStyle: const TextStyle(color: Colors.white70),
                            hintStyle: const TextStyle(
                              color: Color(0xff081b25),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
