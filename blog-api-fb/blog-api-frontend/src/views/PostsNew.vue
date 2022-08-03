<script>
import axios from "axios";
export default {
  data: function () {
    return {
      newPostParams: {},
      errors: [],
    };
  },
  methods: {
    createPost: function () {
      axios
        .post("/posts.json", this.newPostParams)
        .then((response) => {
          console.log("Success!", response.data);
          this.$router.push("/posts");
        })
        .catch((error) => {
          console.log(error.response.data.errors);
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>

<template>
  <div>
    <h1>New Post</h1>
    <form v-on:submit.prevent="createPost()">
      <ul>
        <li v-for="error in errors" v-bind:key="error">
          {{ error }}
        </li>
      </ul>
      <div>
        Title:
        <input class="form-control" type="text" v-model="newPostParams.title" />
      </div>
      <div>
        Body:
        <input class="form-control" type="text" v-model="newPostParams.body" />
      </div>
      <div>
        Image:
        <input class="form-control" type="text" v-model="newPostParams.image" />
      </div>
      <input class="btn btn-dark" type="submit" value="Submit Post" />
    </form>
  </div>
</template>
