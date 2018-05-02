import OLControlFullscreen from 'ol/control/fullscreen';
import OLControlScaleLine from 'ol/control/scaleline';
import OLFeature from 'ol/feature';
import OLGeomLineString from 'ol/geom/linestring';
import OLGeomPoint from 'ol/geom/point';
import OLGraticule from 'ol/graticule';
import OLMap from 'ol/map';
import OLStyle from 'ol/style/style';
import OLStyleCircle from 'ol/style/circle';
import OLStyleFill from 'ol/style/fill';
import OLStyleStroke from 'ol/style/stroke';
import OLTile from 'ol/layer/tile';
import OLVectorLayer from 'ol/layer/vector';
import OLVectorSource from 'ol/source/vector';
import OLView from 'ol/view';
import OSMSource from 'ol/source/osm';
import olControl from 'ol/control';
import olProj from 'ol/proj';

export default {
  Feature: OLFeature,
  Graticule: OLGraticule,
  Map: OLMap,
  View: OLView,
  control: {
    FullScreen: OLControlFullscreen,
    ScaleLine: OLControlScaleLine,
    defaults: olControl.defaults
  },
  geom: {
    LineString: OLGeomLineString,
    Point: OLGeomPoint
  },
  layer: {
    Tile: OLTile,
    Vector: OLVectorLayer
  },
  proj: olProj,
  source: {
    OSM: OSMSource,
    Vector: OLVectorSource
  },
  style: {
    Circle: OLStyleCircle,
    Fill: OLStyleFill,
    Stroke: OLStyleStroke,
    Style: OLStyle
  }
};
