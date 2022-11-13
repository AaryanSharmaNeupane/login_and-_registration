import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Position position = ModalRoute.of(context)?.settings.arguments as Position;
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(position.latitude, position.longitude),
            zoom: 18,

            // maxBounds: LatLngBounds(LatLng(27.700769, 85.300140)),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/rustu-neupane/claf0wpuq004v14ql79zhr52v/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVzdHUtbmV1cGFuZSIsImEiOiJjbGFlejIycGUweDV1M29veXdtbGJsbzhmIn0.TOVRtOIGFVGjOWYvkBiwsQ',
              additionalOptions: const {
                'accessToken':
                    "pk.eyJ1IjoicnVzdHUtbmV1cGFuZSIsImEiOiJjbGFlejIycGUweDV1M29veXdtbGJsbzhmIn0.TOVRtOIGFVGjOWYvkBiwsQ",
                'id': "mapbox.mapbox-streets-v8",
              },
            ),
            MarkerLayer(
              markers: [
                Marker(
                    // width: 45,
                    // height: 45,
                    point: LatLng(position.latitude, position.longitude),
                    builder: ((context) => Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.location_on)),
                        )))
              ],
            )
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 320,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 16,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Hi there, ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Where to?, ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.yellowAccent,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Search Drop Off Location')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add Home"),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Your living home address",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add Work"),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Your office address",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
