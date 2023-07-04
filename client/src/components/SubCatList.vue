<script>
export default {
  data() {
    return {
      //curCat: [],
      collapsed: true,
    }
  },
  props: {
    SubCatObj: Object,
  },
  methods: {
  }
}
</script>

<template>

  <div class="main_categ sidebar_element_cat">
    <span class="title_categ" @click="this.collapsed = !this.collapsed"  v-if="collapsed"><span class="categ_check_mark">&or;</span> {{ SubCatObj.name }}</span>
    <span class="title_categ" @click="this.collapsed = !this.collapsed" v-else><span class="categ_check_mark">&and;</span>{{ SubCatObj.name }}</span>
    <div v-bind:class="{ SubCateg_scroll: collapsed }">
      <label class="params_categ" v-for="elems2 in SubCatObj.val">
        <span class="params_a">
          <span><input type="checkbox" /></span>
          <span>{{ elems2 }}</span>
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