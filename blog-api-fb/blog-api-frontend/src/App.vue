<template>
  <!-- <nav>
    <router-link to="/">Home</router-link>
    |
    <router-link to="/about">About</router-link>
    |
    <router-link to="/test">Test</router-link>
    |
    <router-link to="/posts">Posts</router-link>
    |
    <router-link to="/new">New Post</router-link>
    |
    <router-link to="/signup">Signup</router-link>
    |
    <router-link to="/login">Login</router-link>
    |
    <router-link to="/logout">Logout</router-link>
  </nav> -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">BLOG-API</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/posts">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/new">New Post</a>
          </li>
          <li class="nav-item dropdown" v-if="!isLoggedIn">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Login
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="/login">Login</a></li>
              <li><a class="dropdown-item" href="/signup">Sign Up</a></li>
              <!-- <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="/logout">Logout</a></li> -->
            </ul>
          </li>

          <li class="nav-item" v-if="isLoggedIn">
            <a class="nav-link" href="/logout">Logout</a>
          </li>

          <!-- <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li> -->
        </ul>
        <!-- <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form> -->
      </div>
    </div>
  </nav>
  <div class="container">
    <router-view />
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      isLoggedIn: !!localStorage.jwt,
    };
  },
  watch: {
    $route: function () {
      this.isLoggedIn = !!localStorage.jwt;
    },
  },
};
</script>

<style>
body {
  font-family: Georgia, Times, Times New Roman, serif;
  background-image: url("https://www.toptal.com/designers/subtlepatterns/uploads/45degreee_fabric.png");
}
</style>
