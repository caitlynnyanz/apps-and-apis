<script>
import axios from "axios";
export default {
  data: function () {
    return {
      posts: [],
    };
  },
  created: function () {
    this.indexPosts();
  },
  methods: {
    indexPosts: function () {
      axios.get("/posts.json").then((response) => {
        this.posts = response.data;
        console.log("All posts: ", response.data);
      });
    },
  },
};
</script>

<template>
  <div>
    <h1>All Posts</h1>
    <div v-for="post in posts" v-bind:key="post.id">
      <img v-bind:src="post.image" />
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
    </div>
  </div>
</template>

<style scoped></style>
