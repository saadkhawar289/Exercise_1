import 'package:flutter/material.dart';
import 'package:flutter_gmaps/Model/directions_model.dart';
import 'package:flutter_gmaps/Helper/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';










class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.7715, 72.7511),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
              child: DraggableScrollableSheet(
                  expand: true,
                  initialChildSize: 0.2,
                  minChildSize: 0.2,
                  maxChildSize: 0.7,
                  builder: (context, bbb) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                    ),
                    child: SingleChildScrollView(
                      controller: bbb,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                width: 70,
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Wah-Cant ',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt_outlined,
                                          size: 24,
                                        ),
                                        Text(
                                          ' Islamabad',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Today at 4:30pm To 5:30pm ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Divider(
                                  thickness: 3,
                                  height: 3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Stop',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.yellow,
                                            child: Text('1'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                              'Golra Mor I-14 Riphah International University '),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' |',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.yellow,
                                            child: Text('2'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('H11/6 Fast University'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' |',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.yellow,
                                            child: Text('3'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text('E11/3 Nust University'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            ' |',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.yellow,
                                            child: Text('4'),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                              'Blue Area F11/1 Bahria University'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 150,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(16),
                                                    border: Border.all(
                                                      color:  Color(0xff75774c),)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons.timer_outlined,color: Color(0xff75774c),
                                                    ),
                                                    Text('15 sec',style: TextStyle(color: Color(0xff75774c)),)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0,
                                                horizontal: 10),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  width: 180,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    Color(0xff75774c),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(16),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'START JOURNEY',
                                                      style: TextStyle(
                                                          color:
                                                          Colors.white),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
          Positioned(child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.cancel,size: 30,)),
          )),

        ],
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {

      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );

        _destination = null;


        _info = null;
      });
    } else {

      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}