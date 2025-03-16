import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_tournament/Models/place.dart';
import 'package:flutter_tournament/Screens/map.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;




class locationInput extends StatefulWidget {
  const locationInput({super.key});

  @override
  State<locationInput> createState() => _locationInputState();
}

class _locationInputState extends State<locationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  String get locationImage {
    if (_pickedLocation == null) {
      return ' ';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return // here is the google map API Key, ehre removed for security purposes
  }

  void getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyCHvmtEr2uL9gHV-lPXVh-Z1ivx9GM-81g');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    print(resData);
    final addresss = resData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: addresss);
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location Chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
    );

    if (_pickedLocation != null) {
      previewContent = Image.network(locationImage,
          fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }

    if (_isGettingLocation == true) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text("Get Current Location"),
              onPressed: getCurrentLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text("Select On Map"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const MapScreen()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
