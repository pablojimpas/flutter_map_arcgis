import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_arcgis/layers/feature_layer.dart';
import 'package:flutter_map_arcgis/layers/feature_layer_options.dart';

class EsriPlugin extends MapPlugin {
  @override
  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<void> stream) {
    return FeatureLayer(options as FeatureLayerOptions, mapState, stream);
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is FeatureLayerOptions;
  }
}
