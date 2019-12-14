import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/Locations.dart';
import '../models/User.dart';
class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen(this.user);
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          MyMap(),
          Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  hintText: "Seach the location here...",
                  prefixIcon: Icon(Icons.search),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() {
    return _MyMapState();
  }
}

class _MyMapState extends State<MyMap> {
  Set<Marker> markers = Set<Marker>();
  @override
  void initState() {
    super.initState();
    fetchLocations();
  }

  void fetchLocations() async {
    List<Locations> locations = await Locations.getLocations();
    for (Locations location in locations) {
      Marker _marker = Marker(
          markerId: MarkerId(location.id.toString()),
          position: LatLng(location.latitude, location.longitude));
      markers.add(_marker);
    }
    setState(() {
      print(markers);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    CameraPosition initialCamPosition = CameraPosition(
      target: LatLng(18.520430, 73.856743),
      zoom: 5.0,
    );
    return GoogleMap(
      markers: markers,
      initialCameraPosition: initialCamPosition,
    );
  }
}