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
    destroyPost: function () {
      axios.delete("/posts/" + this.$route.params.id + ".json").then((response) => {
        this.post = response.data;
        console.log(response.data);
        this.$router.push("/posts");
      });
    },
  },
};
</script>

<template>
  <div class="container">
    <div>
      <img v-bind:src="post.image" />
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
      <div>
        <a class="btn btn-dark" v-bind:href="`/posts/${post.id}/edit`">Edit Post</a>
      </div>
      <div>
        <button class="btn btn-light" v-on:click="destroyPost()">Delete Post</button>
      </div>
      <a class="btn btn-primary" href="/posts">Back to posts</a>
    </div>
  </div>
</template>

<style scoped>
.container {
  background-color: rgb(239, 239, 239);
}
</style>
