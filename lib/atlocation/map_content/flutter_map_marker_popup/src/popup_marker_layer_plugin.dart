import 'package:flutter/widgets.dart';
import 'package:atfind/atlocation/map_content/flutter_map/src/layer/layer.dart';
import 'package:atfind/atlocation/map_content/flutter_map/src/map/map.dart';
import 'package:atfind/atlocation/map_content/flutter_map/src/plugins/plugin.dart';
import 'package:atfind/atlocation/map_content/flutter_map_marker_popup/src/popup_marker_layer.dart';
import 'package:atfind/atlocation/map_content/flutter_map_marker_popup/src/popup_marker_layer_options.dart';

class PopupMarkerPlugin extends MapPlugin {
  @override
  Widget createLayer(
      LayerOptions options, MapState? mapState, Stream<void> stream) {
    return PopupMarkerLayer(
        options as PopupMarkerLayerOptions, mapState, stream as Stream<Null>);
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is PopupMarkerLayerOptions;
  }
}
