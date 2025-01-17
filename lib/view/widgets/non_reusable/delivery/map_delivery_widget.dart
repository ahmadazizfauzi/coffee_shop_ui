import 'package:coffee/model/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapDeliveryWidget extends StatefulWidget {
  const MapDeliveryWidget({super.key});

  @override
  State<MapDeliveryWidget> createState() => _MapDeliveryWidgetState();
}

class _MapDeliveryWidgetState extends State<MapDeliveryWidget> {
  GoogleMapController? mapController;

  static const LatLng _defaultPosition = LatLng(-6.200000, 106.816666);

  Set<Marker> markers = {};

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    // Menambahkan marker default
    markers.add(
      Marker(
        markerId: const MarkerId('default'),
        position: _defaultPosition,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _defaultPosition,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
              });
            },
            markers: markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false, // Disable default location button
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            compassEnabled: true,
          ),
        ),
        // Back Button
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.color_ededed,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        // Location Button
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.color_ededed,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.my_location),
              onPressed: () async {
                try {
                  final position = await _getCurrentLocation();
                  final latLng = LatLng(position.latitude, position.longitude);

                  // Update marker position
                  setState(() {
                    markers.clear();
                    markers.add(
                      Marker(
                        markerId: const MarkerId('current_location'),
                        position: latLng,
                      ),
                    );
                  });

                  // Animate camera to new position
                  final GoogleMapController controller = await mapController!;
                  controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: latLng,
                        zoom: 15,
                      ),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
