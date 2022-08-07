<template>
  <div class="about">
    <h1>This is a map page</h1>
  </div>
  <div id="map"></div>
</template>

<script>
/* global mapboxgl */
export default {
  data: function () {
    return {};
  },
  created: function () {},
  mounted: function () {
    this.showMap();
  },
  methods: {
    showMap: function () {
      // TO MAKE THE MAP APPEAR YOU MUST
      // ADD YOUR ACCESS TOKEN FROM
      // https://account.mapbox.com
      mapboxgl.accessToken = process.env.VUE_APP_MY_MAP_KEY;
      const map = new mapboxgl.Map({
        container: "map", // container ID
        style: "mapbox://styles/mapbox/streets-v11",
        center: [-122.431297, 37.773972],
        zoom: 8,
        projection: "globe", // display the map as a 3D globe
      });

      map.on("style.load", () => {
        map.setFog({}); // Set the default atmosphere style
        // Create a default Marker and add it to the map.

        // create the popup
        const popup = new mapboxgl.Popup({ offset: 25 }).setText("This is a popup.");

        const marker1 = new mapboxgl.Marker()
          .setLngLat([-122.431297, 37.773972])
          .setPopup(popup) // sets a popup on this marker
          .addTo(map);

        // Create a default Marker, colored black, rotated 45 degrees.
        const marker2 = new mapboxgl.Marker({ color: "black", rotation: 45 })
          .setLngLat([-122.75, 37.98])

          .addTo(map);
        console.log(marker1, marker2);
      });
    },
  },
};
</script>
<style>
body {
  margin: 0;
  padding: 0;
}
#map {
  position: absolute;
  height: 500px;
  width: 500px;
  margin-left: 50px;
}
</style>
