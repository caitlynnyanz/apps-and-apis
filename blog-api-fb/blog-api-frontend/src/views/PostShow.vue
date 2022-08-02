<script>
import axios from "axios";
export default {
  data: function () {
    return {
      post: {},
    };
  },
  created: function () {
    this.showPost();
  },
  methods: {
    showPost: function () {
      axios.get("/posts/" + this.$route.params.id + ".json").then((response) => {
        this.post = response.data;
        console.log("One post: ", response.data);
      });
    },
  },
};
</script>

<template>
  <div>
    <h1>{{ post.title }}</h1>
    <img v-bind:src="post.image" />
    <p>{{ post.body }}</p>
    <div>
      <a v-bind:href="`/posts/${post.id}/edit`">Edit Post</a>
    </div>
    <a href="/posts">Back to posts</a>
  </div>
</template>

<style scoped></style>
