import 'dart:async';
import 'package:floating_text/floating_text.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  int _id = -1;
  GoogleMapController? _googleMapController ;
  static const cameraPositionList = [
    CameraPosition(
        target: LatLng(14.687112705888778, -17.455037833977645), zoom: 17),
    CameraPosition(
        target: LatLng(14.759494453476421, -17.451214879595693), zoom: 17),
     CameraPosition(
        target: LatLng(14.760439420219441, -17.44047939606599), zoom: 17),
    CameraPosition(
        target: LatLng(14.77134304256057, -17.417026820961876), zoom: 17)
  ];
  CameraPosition get cameraPos {
    if (_id == cameraPositionList.length - 1 || _id == -1) {
      _id = 0;
    } else {
      _id++;
    }
    return cameraPositionList[_id];
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FloatingText(
            text: "Nos Boutiques",
            repeat: true,
            textStyle: const TextStyle(fontSize: 25,color: Colors.amber),
            floatingTextStyle: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 97, 77, 18)
            )),
        ),
        body: GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition: cameraPos,
      onMapCreated: (controller) => _googleMapController = controller ,

    ),
    
    floatingActionButton: FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.black,
      onPressed:()=> _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPos),),
      child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
//14.687112705888778, -17.455037833977645