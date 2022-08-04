<script>
export default {
  props: ["note", "selectedNoteId"],
  methods: {
    selectNote: function (note) {
      this.$emit("selectTheNote", note);
    },
  },
};
</script>

<template>
  <div class="note-selector" v-bind:class="{ active: selectedNoteId == note.id }" v-on:click="selectNote(note)">
    <p class="note-selector-title">{{ note.body }}</p>
    <p class="note-selector-timestamp">{{ note.timestamp }}</p>
  </div>
</template>

<style>
/* LAYOUT */

.note-selector {
  padding: 1em;
}
.note-selector p {
  margin: 0;
}

/* COLORS */

.note-selector {
  border-bottom: 1px solid #dcdadc;
}
.note-selector.active {
  background-color: #fce18d;
}
.note-selector-title {
  background-color: inherit;
}
.note-selector-timestamp {
  color: #626262;
  background-color: inherit;
}

/* TYPOGRAPHY */

.note-selector-title {
  font-weight: bold;
}
.note-selector-timestamp {
  font-size: 0.7em;
}
</style>
