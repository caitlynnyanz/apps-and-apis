<script>
import axios from "axios";

export default {
  data: function () {
    return {
      newUserParams: {},
      errors: [],
    };
  },
  methods: {
    submit: function () {
      axios
        .post("/users", this.newUserParams)
        .then((response) => {
          console.log(response.data);
          this.$router.push("/login");
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>

<template>
  <div class="signup">
    <form v-on:submit.prevent="submit()">
      <h1>Signup</h1>
      <ul>
        <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
      </ul>
      <div>
        <label>Name:</label>
        <input class="form-control" type="text" v-model="newUserParams.name" />
        <small class="text-danger" v-if="newUserParams.name">{{ 20 - newUserParams.name.length }}</small>
      </div>
      <div>
        <label>Email:</label>
        <input class="form-control" type="email" v-model="newUserParams.email" />
      </div>
      <div>
        <label>Password:</label>
        <input class="form-control" type="password" v-model="newUserParams.password" />
        <small class="text-danger" v-if="newUserParams.password && newUserParams.password.length < 6">
          Must be at least 6 characters.
        </small>
        <br />
        <small class="text-danger" v-if="newUserParams.password && newUserParams.password.length > 20">
          Must be less than 20 characters.
        </small>
      </div>
      <div>
        <label>Password confirmation:</label>
        <input class="form-control" type="password" v-model="newUserParams.password_confirmation" />
        <small class="text-danger" v-if="newUserParams.password !== newUserParams.password_confirmation">
          Must match password.
        </small>
      </div>
      <input class="btn btn-dark" type="submit" value="Submit" />
    </form>
  </div>
</template>
