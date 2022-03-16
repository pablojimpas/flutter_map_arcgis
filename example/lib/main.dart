import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ArcGIS')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(32.91081899999999, -92.734876),
                    // center: LatLng(47.925812, 106.919831),
                    zoom: 9,
                    plugins: [EsriPlugin()],
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    FeatureLayerOptions(
                      'https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Congressional_Districts/FeatureServer/0',
                      'polygon',
                      onTap: (dynamic attributes, LatLng location) {
                        if (kDebugMode) {
                          print(attributes);
                        }
                      },
                      render: (dynamic attributes) {
                        // You can render by attribute
                        return const PolygonOptions(
                          borderColor: Colors.blueAccent,
                          color: Colors.black12,
                          borderStrokeWidth: 2,
                        );
                      },
                    ),
                    // FeatureLayerOptions(
                    // "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",
                    //   "point",
                    //   render:(dynamic attributes){
                    //     // You can render by attribute
                    //     return Marker(
                    //       width: 30.0,
                    //       height: 30.0,
                    //       builder: (ctx) => Icon(Icons.pin_drop),
                    //       point: LatLng(40, 40)
                    //     );
                    //   },
                    //   onTap: (attributes, LatLng location) {
                    //     print(attributes);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
