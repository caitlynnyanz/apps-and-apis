<script>
import axios from "axios";

export default {
  data: function () {
    return {
      contacts: [],
      errors: [],
      message: "All Contacts",
      currentContact: {},
      newContact: {},
    };
  },
  created: function () {
    this.indexContacts();
  },
  methods: {
    indexContacts: function () {
      axios.get(`http://localhost:3000/contacts`).then((response) => {
        this.contacts = response.data;
        console.log("All contacts: ", response.data);
      });
    },
    createContact: function () {
      axios
        .post(`http://localhost:3000/contacts`, this.newContact)
        .then((response) => {
          console.log("Success!", response.data);
          this.contacts.push(response.data);
          this.newContact = {};
        })
        .catch((error) => {
          console.log(error.response.data.errors);
          this.errors = error.response.data.errors;
        });
    },
    showContact: function (contact) {
      this.currentContact = contact;
      document.querySelector("#contact-info").showModal();
    },
    updateContact: function (contactToEdit) {
      axios.patch(`http://localhost:3000/contacts/${contactToEdit.id}.json`, contactToEdit).then((response) => {
        console.log(response.data);
      });
    },
    destroyContact: function (contact) {
      axios.delete(`http://localhost:3000/contacts/${contact.id}.json`).then((response) => {
        console.log(response.data);
        var index = this.contacts.indexOf(contact);
        this.contacts.splice(index, 1);
      });
    },
  },
};
</script>

<template>
  <div class="home">
    <h1>Contacts</h1>
    <h2>New Contact</h2>
    First Name:
    <input type="text" v-model="newContact.first_name" />
    Last Name:
    <input type="text" v-model="newContact.last_name" />
    Email:
    <input type="text" v-model="newContact.email" />
    Phone Number:
    <input type="text" v-model="newContact.phone_number" />
    Image:
    <input type="text" v-model="newContact.image" />
    <button v-on:click="createContact()">Create Contact</button>
    <div class="errors" v-for="error in errors" v-bind:key="error">
      {{ error }}
    </div>
    <h1>{{ message }}</h1>
    <div v-for="contact in contacts" v-bind:key="contact.id">
      <h2>First Name: {{ contact.first_name }}</h2>
      <h2>Last Name: {{ contact.last_name }}</h2>
      <img v-bind:src="contact.image" />
      <div><button v-on:click="showContact(contact)">More Info</button></div>
    </div>
    <dialog id="contact-info">
      <form method="dialog">
        <h2>Contact Info:</h2>
        <p>
          First Name:
          <input type="text" v-model="currentContact.first_name" />
        </p>
        <p>
          Last Name:
          <input type="text" v-model="currentContact.last_name" />
        </p>
        <p>
          Email:
          <input type="text" v-model="currentContact.email" />
        </p>
        <p>
          Phone Number:
          <input type="text" v-model="currentContact.phone_number" />
        </p>
        <p>
          Image:
          <input type="text" v-model="currentContact.image" />
        </p>
        <button v-on:click="updateContact(currentContact)">Update</button>
        <button v-on:click="destroyContact(currentContact)">Delete</button>
        <button>Close</button>
      </form>
    </dialog>
  </div>
</template>

<style>
.errors {
  color: rgb(139, 42, 42);
}
</style>
