<script>
import NoteSelector from "./NoteSelector.vue";

export default {
  data: function () {
    return {};
  },
  components: {
    NoteSelector,
  },
};
</script>
<template>
  <div class="note-selectors">
    <NoteSelector />
    <NoteSelector />
    <NoteSelector />
  </div>
</template>

<style>
/* LAYOUT */

.note-selectors {
  flex: 0 0 13em;
}

/* COLORS */

.note-selectors {
  border-right: 1px solid #dcdadc;
}
</style>
