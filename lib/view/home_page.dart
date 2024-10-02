import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/view/search_page.dart';
import '../controller/provider.dart';
import '../model/weather_model.dart';

var dayinfo = DateTime.now();
var dateformate = DateFormat('EEEE , d MMM, yyyy').format(dayinfo);

class HomePage extends StatelessWidget {
  Weather? cleint;

  @override
  Widget build(BuildContext context) {
    cleint = Provider.of<ProviderWeather>(context).weatherData;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: size.height * 0.75,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          stops: [0.2, 0.85],
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 58.0),
                          child: Text(
                            '${cleint?.cityName ?? 'Lattakia'} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MavenPro',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dateformate,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'MavenPro',
                            color: Colors.white,
                          ),
                        ),
                        cleint?.icon == null
                            ? Image.asset(
                                'assets/images/sun.png',
                                width: size.width * 0.4,
                                height: size.height * 0.2,
                              )
                            : Image.network(
                                'https:${cleint?.icon}',
                                width: size.width * 0.36,
                                fit: BoxFit.fill,
                              ),
                        Text(
                          '${cleint?.condition ?? 'Sunny'}',
                          style: const TextStyle(
                            fontSize: 49,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cleint?.temp ?? '24'}',
                          style: const TextStyle(
                            fontSize: 49,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/wind.png',
                                    width: size.width * 0.15,
                                    height: size.height * 0.1,
                                  ),
                                  Text(
                                    '${cleint?.wind ?? '16.1'} km/h',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'wind',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/humidity.png',
                                    width: size.width * 0.15,
                                    height: size.height * 0.1,
                                  ),
                                  Text(
                                    '${cleint?.humidity ?? '53'}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/wind_direction.png',
                                    width: size.width * 0.15,
                                    height: size.height * 0.1,
                                  ),
                                  Text(
                                    '${cleint?.wind_dir ?? 'W'}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Wind Direction',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'hubballi',
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 38.0,
                      right: 20,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Gust ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${cleint?.gust ?? '13.2'}kp/h ',
                          style: const TextStyle(
                            fontSize: 23,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'pressure ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cleint?.pressure ?? '1238'}',
                          style: const TextStyle(
                            fontSize: 23,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'UV ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cleint?.uv ?? '4.5'} ',
                          style: const TextStyle(
                            fontSize: 23,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'precptation ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${cleint?.pricipe ?? '6.1'} ',
                          style: const TextStyle(
                            fontSize: 23,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'wind ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' ${cleint?.wind ?? '13.3'}km/h ',
                          style: const TextStyle(
                            fontSize: 23,
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'last update ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Hubballi',
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${cleint?.last_update ?? '2023-08-20 14:45'}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Hubballi',
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
