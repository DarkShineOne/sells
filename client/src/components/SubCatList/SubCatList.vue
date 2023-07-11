<script>
export default {
  data() {
    return {
      //curCat: [],
      collapsed: true,
    }
  },
  props: {
    SubCatObj: Array,
  },
  methods: {
  }
}
</script>

<template>
  <div class="main_categ sidebar_element_cat">
    <span class="title_categ" @click="this.collapsed = !this.collapsed" v-if="collapsed"><span
        class="categ_check_mark">&or;</span> {{ SubCatObj[0].name }}</span>
    <span class="title_categ" @click="this.collapsed = !this.collapsed" v-else><span
        class="categ_check_mark">&and;</span>{{ SubCatObj[0].name }}</span>
    <div v-bind:class="{ SubCateg_scroll: collapsed }">
      <label class="params_categ" v-for="elems in SubCatObj[0].val">
        <span class="params_a">
          <span><input type="checkbox" @click="$emit('subCatFunc', [elems, SubCatObj[1]])" /></span>
          <span>{{ elems }}</span>
        </span>
      </label>
    </div>
  </div>
</template>

<style>
.SubCateg_scroll {
  overflow: hidden;
  height: 0px;
  scroll-behavior: smooth;
  overflow-x: hidden;
}
</style>