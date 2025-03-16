import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tournament/Models/place.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 26.307214717673606,
      longitude: 50.14601138101729,
      address: 'address',
    ),
    this.isSellecting = true,
  });
  final PlaceLocation location;
  final bool isSellecting;

  @override
  State<MapScreen> createState() {
    return _MapScreen();
  }
}

class _MapScreen extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title:
            Text(widget.isSellecting ? 'Pick your location' : 'your location',style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 26),),
        actions: [
          if (widget.isSellecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
            ),
        ],
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 39, 71, 96),
              Color.fromRGBO(34, 56, 67, 1)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.location.latitude, widget.location.longitude),
            zoom: 15),
        markers: {
          Marker(
            markerId: const MarkerId('m1'),
            position:
                LatLng(widget.location.latitude, widget.location.longitude),
          ),
        },
      ),
    );
  }
}
