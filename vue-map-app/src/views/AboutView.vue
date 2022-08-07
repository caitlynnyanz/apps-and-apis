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
    return {
      places: [],
    };
  },
  created: function () {},
  mounted: function () {
    this.placesIndex();
  },
  methods: {
    placesIndex: function () {
      //where I would make my API call to backend!
      this.places = [
        { lat: 37.773972, lng: -122.431297, description: "This is San Francisco." },
        { lat: 41.881832, lng: -87.623177, description: "This is Chicago." },
        { lat: 40.73061, lng: -73.935242, description: "This is New York." },
      ];
      this.showMap();
    },
    showMap: function () {
      // TO MAKE THE MAP APPEAR YOU MUST
      // ADD YOUR ACCESS TOKEN FROM
      // https://account.mapbox.com
      mapboxgl.accessToken = process.env.VUE_APP_MY_MAP_KEY;
      const map = new mapboxgl.Map({
        container: "map", // container ID
        style: "mapbox://styles/mapbox/streets-v11",
        center: [this.places[0].lng, this.places[0].lat],
        zoom: 8,
        projection: "globe", // display the map as a 3D globe
      });

      this.places.forEach((place) => {
        let popup = new mapboxgl.Popup({ offset: 25 }).setText(place.description);
        let marker = new mapboxgl.Marker().setLngLat([place.lng, place.lat]).setPopup(popup).addTo(map);
        console.log(marker);
      });

      map.on("style.load", () => {
        map.setFog({}); // Set the default atmosphere style
        // Create a default Marker and add it to the map.

        // // create the popup
        // const popup = new mapboxgl.Popup({ offset: 25 }).setText("This is a popup.");

        // const marker1 = new mapboxgl.Marker()
        //   .setLngLat([-122.431297, 37.773972])
        //   .setPopup(popup) // sets a popup on this marker
        //   .addTo(map);

        // // Create a default Marker, colored black, rotated 45 degrees.
        // const marker2 = new mapboxgl.Marker({ color: "black", rotation: 45 })
        //   .setLngLat([-122.75, 37.98])

        //   .addTo(map);
        // console.log(marker1, marker2);
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
