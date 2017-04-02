class RiverLoader {
  public ArrayList<RiverPartInfo> load(String filename) {
    JSONObject json = loadJSONObject(filename);

    int bankWidth = json.getInt("width") * json.getInt("tilewidth");
    int bankHeight = json.getInt("height") * json.getInt("tileheight");

    JSONArray layers = json.getJSONArray("layers");

    ArrayList<RiverPartInfo> banks = new ArrayList<RiverPartInfo>();

    for (int i = 0; i < layers.size(); i++) {
      JSONObject layer = layers.getJSONObject(i);

      JSONObject properties = layer.getJSONObject("properties");
      int difficulty =
        properties.hasKey("difficulty") ? properties.getInt("difficulty") :
                                          -2;
      JSONArray objects = layer.getJSONArray("objects");
      ArrayList<PVector[]> shapes = new ArrayList<PVector[]>();
      ArrayList<RiverEntityInfo> entities = new ArrayList<RiverEntityInfo>();

      for (int j = 0; j < objects.size(); j++) {
        JSONObject object = objects.getJSONObject(j);

        boolean isPolygon = object.hasKey("polygon");
        boolean isPolyline = object.hasKey("polyline");
        if (isPolygon || isPolyline) {
          String polygonKey = isPolygon ? "polygon" : "polyline";
          JSONArray polygon = object.getJSONArray(polygonKey);
          float polygonX = object.getFloat("x");
          float polygonY = object.getFloat("y");

          PVector[] shape = new PVector[polygon.size()];
          for (int k = 0; k < polygon.size(); k++) {
            JSONObject point = polygon.getJSONObject(k);
            float x = point.getFloat("x");
            float y = point.getFloat("y");
            float relativeX = (x + polygonX) / (float)bankWidth;
            float relativeY = (y + polygonY) / (float)bankHeight;
            shape[k] = new PVector(relativeX, relativeY);
          }
          shapes.add(shape);
        } else if (object.hasKey("ellipse")) {
          String type = object.getString("type");
          float entityWidth = object.getFloat("width");
          float entityHeight = object.getFloat("width");
          float entityX = object.getFloat("x");
          float entityY = object.getFloat("y");
          float relativeX = (entityX + entityWidth / 2) / (float)bankWidth;
          float relativeY = (entityY + entityHeight / 2) / (float)bankHeight;
          PVector position = new PVector(relativeX, relativeY);
          entities.add(new RiverEntityInfo(type, position));
        }
      }

      RiverPartInfo bank = new RiverPartInfo(difficulty, shapes, entities);
      banks.add(bank);
    }

    return banks;
  }
}