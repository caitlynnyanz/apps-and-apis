<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Vue.js!",
      posts: [],
      articles: [],
    };
  },
  created: function () {
    this.getPostsData();
    this.getNewsData();
  },
  methods: {
    getPostsData: function () {
      axios.get("https://jsonplaceholder.typicode.com/posts").then((response) => {
        console.log(response.data);
        this.posts = response.data;
      });
    },
    getNewsData: function () {
      axios.get("http://localhost:3000/newapi_headlines").then((response) => {
        console.log("news api", response.data);
        this.posts = response.data;
      });
    },
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <div v-for="post in posts" v-bind:key="post.id">
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
    </div>
  </div>
</template>

<style></style>
