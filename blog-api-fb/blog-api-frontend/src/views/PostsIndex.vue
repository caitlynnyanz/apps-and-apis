<script>
import axios from "axios";
export default {
  data: function () {
    return {
      posts: [],
      currentPost: {},
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
    <div class="row">
      <div class="col-sm-4" v-for="post in posts" v-bind:key="post.id" v-on:mouseover="currentPost = post">
        <div class="card mb-4">
          <img class="card-img-top" v-bind:src="post.image" v-bind:alt="post.title" />
          <div class="card-body">
            <h5 class="card-title">{{ post.title }}</h5>
            <p class="card-text">{{ post.body }}</p>
            <a v-bind:href="`/posts/${post.id}`" class="btn btn-primary">Read More</a>
          </div>
        </div>
      </div>
    </div>
    <!-- <div v-for="post in posts" v-bind:key="post.id">
      <img v-bind:src="post.image" />
      <h2>{{ post.title }}</h2>
      <p>{{ post.body }}</p>
      <a v-bind:href="`/posts/${post.id}`">Read more</a>
    </div> -->
  </div>
</template>

<style scoped>
.card img {
  object-fit: cover;
  height: 250px;
}
.selected {
  /* color: white; */
  background-color: #e6e6e6;
  transition: background-color 1s ease;
}
</style>
